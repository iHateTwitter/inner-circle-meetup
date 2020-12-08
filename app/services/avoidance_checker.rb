# frozen_string_literak: true

class AvoidanceChecker
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def investigate(meetup)
    avoidable = false

#    캐싱된 기피하는 대상이 포함되어 있으면 바로 false 리턴
#    participant_ids = meetup.participants.ids
#    return false

    twitter_client = user.client
    investigating_user = twitter_client.user

    meetup.participants.each do |participant|
      begin
        investigated_user = twitter_client.user(participant.nickname)
        result = twitter_client.friendship(investigating_user, investigated_user)

        source = result.attrs[:source]
        avoidable ||= source[:blocking]
        avoidable ||= source[:blocked_by]
        avoidable ||= source[:muting]

        if source[:blocking]
          avoidance = Avoidance.find_or_create_by(user: user, target: participant)
          avoidance.update(reason: '내가 트위터에서 블락함')
        end
      rescue Twitter::Error::NotFound => e
        Rails.logger.info "Not Found Error #{e} #{e.message}"
        avoidable ||= false
      end
    end

    avoidable
  end
end
