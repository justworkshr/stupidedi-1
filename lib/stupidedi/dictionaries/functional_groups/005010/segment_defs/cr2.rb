module Stupidedi
  module Dictionaries
    module FunctionalGroups
      module FiftyTen
        module SegmentDictionary

          CR2 = SegmentDef.new \
            :CR2, "Chiropractic Certification",
            "To supply information related to the chiropractic service rendered to a patient",
            E::E609 .simple_use(Relational, RepeatCount.bounded(1)),
            E::E380 .simple_use(Relational, RepeatCount.bounded(1)),
            E::E1367.simple_use(Relational, RepeatCount.bounded(1)),
            E::E1367.simple_use(Optional,   RepeatCount.bounded(1)),
            E::E355 .simple_use(Relational, RepeatCount.bounded(1)),
            E::E380 .simple_use(Relational, RepeatCount.bounded(1)),

            E::E380 .simple_use(Optional,   RepeatCount.bounded(1)),
            E::E1342.simple_use(Optional,   RepeatCount.bounded(1)),
            E::E1073.simple_use(Optional,   RepeatCount.bounded(1)),
            E::E352 .simple_use(Optional,   RepeatCount.bounded(1)),
            E::E352 .simple_use(Optional,   RepeatCount.bounded(1)),
            E::E1073.simple_use(Optional,   RepeatCount.bounded(1)),

            SyntaxNote::P.new(1, 2),
            SyntaxNote::C.new(4, 3),
            SyntaxNote::P.new(5, 6)

        end
      end
    end
  end
end