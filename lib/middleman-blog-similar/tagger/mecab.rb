require 'natto'

module Middleman
  module Blog
    module Similar
      module Tagger
        class Mecab
          def call(article)
            Natto::MeCab.new.parse(article.body.gsub(%r{</?[^>]+>}, ''))
                        .split("\n")
                        .map { |l| l.split("\t") }
                        .select { |l| l[1] && l[1].start_with?('名詞,一般') }
                        .map { |l| l[0] }
          end
        end
      end
    end
  end
end
