require 'klout'
require 'json'

module Klout
  # Represents an identity
  class Identity
    class << self
      def find_by_twitter_id(twitter_id)
        response = Klout.get "/tw-user.json/#{twitter_id}/score", :query => {key: Klout.api_key}
        Hashie::Mash.new(response)
      end
      
      def find_scores_by_twitter_ids(twitter_ids)
        response = Klout.get "/tw-user.json/batch/score?twitterIds=#{twitter_ids}", :query => {key: Klout.api_key}
        Hashie::Mash.new(response)
      end
      
      # Batch identity method only; that's all we use
      # Probably not the best place to put it
      def find_topics_by_twitter_ids(twitter_ids)
        response = Klout.get "/tw-user.json/batch/topics?twitterIds=#{twitter_ids}", :query => {key: Klout.api_key}
        Hashie::Mash.new(response)
      end
      
      def find_ranked_topics_by_twitter_ids(twitter_ids)
        response = Klout.get "/tw-user.json/batch/rankedTopics?twitterIds=#{twitter_ids}", :query => {key: Klout.api_key}
        Hashie::Mash.new(response)
      end
      
      def find_by_screen_name(screen_name)
        response = Klout.get "/identity.json/twitter", :query => {key: Klout.api_key, screenName: screen_name}
        Hashie::Mash.new(response)
      end
      
      def find_by_klout_id(klout_id)
        response = Klout.get "/identity.json/klout/#{klout_id}/tw", :query => {key: Klout.api_key}
        Hashie::Mash.new(response)
      end
      
      # batch graph stuff
      def grab_my_influencers(twitter_ids)
        response = Klout.get "/tw-user.json/batch/influence?twitterIds=#{twitter_ids}", :query => {key: Klout.api_key}
        Hashie::Mash.new(response)
      end
    end
  end
end
