# frozen_string_literal: true
module Stupidedi
  using Refinements

  module Guides
    module FiftyTen
      module X220A1

        b = GuideBuilder
        d = Schema
        r = SegmentReqs
        e = ElementReqs
        s = Versions::FunctionalGroups::FiftyTen::SegmentDefs
        t = Versions::FunctionalGroups::FiftyTen::TransactionSetDefs

        BE834 = b.build(t::BE834,
          d::TableDef.header("Table 1 - Header",
            b::Segment(100, s::ST, "Transaction Set Header",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Transaction Set Identifier Code", b::Values("834")),
              b::Element(e::Required,    "Transaction Set Control Number"),
              b::Element(e::Required,     "Implementation Guide Version Name")),
            b::Segment(200, s::BGN, "Beginning Segment",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Transaction Set Purpose Code", b::Values("00", "15", "22")),
              b::Element(e::Situational, "Reference Identification", b::MaxLength(50)),
              b::Element(e::Required,    "Date"),
              b::Element(e::Situational, "Time"),
              b::Element(e::Situational, "Time Code", b::Values("AD", "AS", "AT", "CD", "CS", "CT", "ED", "ES", "ET", "GM", "HD", "HS", "HT", "MD", "MS", "PD", "PS", "PT", "UT")),
              b::Element(e::Situational, "Reference Identification", b::MaxLength(50)),
              b::Element(e::Situational, "Transaction Type Code"),
              b::Element(e::Situational, "Action Code", b::Values("2", "4", "RX"))),
            b::Segment(300, s::REF, "Receiver Identification",
              r::Situational, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Reference Identification Qualifier", b::Values("38")),
              b::Element(e::Required,    "Receiver Identifier"),
              b::Element(e::NotUsed,     "Description"),
              b::Element(e::NotUsed,     "REFERENCE IDENTIFIER")),
            b::Segment(400, s::DTP, "File Effective Date",
              r::Situational, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Date/Time Qualifier", b::Values("007")),
              b::Element(e::Required,    "Date Time Period Format Qualifier", b::Values("D8")),
              b::Element(e::Required,    "Date Time Period")),
            b::Segment(600, s::QTY, "Transaction Set Control Totals",
              r::Situational, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Quantity Qualifier", b::Values("DT", "ET", "TO")),
              b::Element(e::Required,    "Quantity", b::MaxLength(15)),
              b::Element(e::NotUsed,     "Composite Unit of Measure"),
              b::Element(e::NotUsed,     "Free-form Information")),

            d::LoopDef.build("1000A",
              d::RepeatCount.bounded(1),
              b::Segment(700, s::N1, "Sponsor Name",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Entity Identifier Code", b::Values("P5")),
                b::Element(e::Situational, "Name", b::MaxLength(60)),
                b::Element(e::Situational, "Identification Code Qualifier", b::Values("24", "FI")),
                b::Element(e::Situational, "Identification Code", b::MaxLength(80)),
                b::Element(e::NotUsed,     "Entity Identifier Code"),
                b::Element(e::NotUsed,     "Entity Relationship Code"))),

            d::LoopDef.build("1000B",
              d::RepeatCount.bounded(1),
              b::Segment(700, s::N1, "Payer",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Entity Identifier Code", b::Values("IN")),
                b::Element(e::Situational, "Name", b::MaxLength(60)),
                b::Element(e::Situational, "Identification Code Qualifier", b::Values("XV", "FI")),
                b::Element(e::Situational, "Identification Code", b::MaxLength(80)),
                b::Element(e::NotUsed,     "Entity Identifier Code"),
                b::Element(e::NotUsed,     "Entity Relationship Code")))),

          d::TableDef.header("Table 2 - Detail",
            d::LoopDef.build("1000C",
              d::RepeatCount.bounded(1),
              b::Segment(700, s::N1, "TPA/Broker Name",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Entity Identifier Code", b::Values("BO", "TV")),
                b::Element(e::Situational, "Name", b::MaxLength(60)),
                b::Element(e::Situational, "Identification Code Qualifier", b::Values("XV", "FI")),
                b::Element(e::Situational, "Identification Code", b::MaxLength(80)),
                b::Element(e::NotUsed,     "Entity Identifier Code"),
                b::Element(e::NotUsed,     "Entity Relationship Code"))),

            d::LoopDef.build("2000",
              d::RepeatCount.unbounded,
              b::Segment(100, s::INS, "Member Level Detail",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Yes/No Condition or Reponse Code", b::Values("Y", "N")),
                b::Element(e::Required,    "Individual Relationship Code", b::Values("01","03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "23", "24", "25", "26", "31", "38", "53", "60", "D2", "G8", "G9")),
                b::Element(e::Required,    "Maintenance Type Code", b::Values("001", "021", "024", "025", "030")),
                b::Element(e::Situational, "Maintenance Reason Code", b::Values("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "14", "15", "16", "17", "18", "20", "21", "22", "25", "26", "27", "28", "29", "31", "32", "33", "37", "38", "39", "40", "41", "43", "59", "AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AI", "AJ", "AL", "EC", "XN", "XT")),
                b::Element(e::Situational, "Benefit Status Code", b::Values("A", "C", "S", "T")),
                b::Element(e::Situational, "Medicare Status Code"),
                b::Element(e::Situational, "Consolidated Omnibus Budget Reconciliation Act (COBRA) Qualifying Event Code", b::Values("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "ZZ")),
                b::Element(e::Situational, "Employment Status Code", b::Values("AC", "AO", "AU", "FT", "L1", "PT", "RT", "TE")),
                b::Element(e::Situational, "Student Status Code", b::Values("F", "N", "P")),
                b::Element(e::Situational, "Yes/No Condition or Response Code", b::Values("Y", "N")),
                b::Element(e::Situational, "Date Time Period Qualifier", b::Values("D8")),
                b::Element(e::Situational, "Date Time Period", b::MaxLength(35)),
                b::Element(e::Situational, "Confidentiality Code", b::Values("R", "U")),
                b::Element(e::Situational, "City Name", b::MaxLength(30)),
                b::Element(e::Situational, "State or Province Code", b::MaxLength(2)),
                b::Element(e::Situational, "Country Code", b::MaxLength(3)),
                b::Element(e::Situational, "Number", b::MaxLength(9))),
              b::Segment(200, s::REF, "Subscriber Identifier",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Reference Identification Qualifier", b::Values("0F")),
                b::Element(e::Required,    "Receiver Identifier"),
                b::Element(e::NotUsed,     "Description"),
                b::Element(e::NotUsed,     "REFERENCE IDENTIFIER")),
              b::Segment(200, s::REF, "Member Supplemental Identifier",
                r::Situational, d::RepeatCount.bounded(13),
                b::Element(e::Required,    "Reference Identification Qualifier", b::Values("17", "1L", "23", "3H", "4A", "6O", "ABB", "D3", "DX", "F6", "Q4", "QQ", "ZZ")),
                b::Element(e::Required,    "Receiver Identifier"),
                b::Element(e::NotUsed,     "Description"),
                b::Element(e::NotUsed,     "REFERENCE IDENTIFIER")),
              b::Segment(250, s::DTP, "Member Level Dates",
                r::Situational, d::RepeatCount.bounded(13),
                b::Element(e::Required,    "Date/Time Qualifier", b::Values("050", "286", "296", "297", "300", "301", "303", "336", "337", "338", "339", "340", "341", "350", "356", "357", "383", "385", "386", "393", "394", "473", "474")),
                b::Element(e::Required,    "Date Time Period Format Qualifier", b::Values("D8")),
                b::Element(e::Required,    "Date Time Period", b::MaxLength(35))),

              d::LoopDef.build("2100A",
                d::RepeatCount.bounded(1),
                b::Segment(300, s::NM1, "Member Name",
                  r::Required, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Entity Identifier Code", b::Values("74", "IL")),
                  b::Element(e::Required,    "Entity Type Qualifier", b::Values("1")),
                  b::Element(e::Situational, "Name Last or Organization Name", b::MaxLength(60)),
                  b::Element(e::Situational, "Name First", b::MaxLength(35)),
                  b::Element(e::Situational, "Name Middle", b::MaxLength(25)),
                  b::Element(e::Situational, "Name Prefix", b::MaxLength(10)),
                  b::Element(e::Situational, "Name Suffix", b::MaxLength(10)),
                  b::Element(e::Situational, "Identification Code Qualifier", b::Values("34", "ZZ")),
                  b::Element(e::Situational, "Identification Code", b::MaxLength(80)),
                  b::Element(e::NotUsed,     "Entity Relationship Code"),
                  b::Element(e::NotUsed,     "Entity Identifier Code"),
                  b::Element(e::NotUsed,     "Name Last or Organization Name")),
                b::Segment(400, s::PER, "Member Communications Numbers",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Contact Function Code", b::Values("IP")),
                  b::Element(e::Situational, "Name"),
                  b::Element(e::Situational, "Communication Number Qualifier", b::Values("AP", "BN", "CP", "EM", "EX", "FX", "HP", "TE", "WP")),
                  b::Element(e::Situational, "Communication Number", b::MaxLength(256)),
                  b::Element(e::Situational, "Communication Number Qualifier", b::Values("AP", "BN", "CP", "EM", "EX", "FX", "HP", "TE", "WP")),
                  b::Element(e::Situational, "Communication Number"),
                  b::Element(e::Situational, "Communication Number Qualifier", b::Values("AP", "BN", "CP", "EM", "EX", "FX", "HP", "TE", "WP")),
                  b::Element(e::Situational, "Communication Number"),
                  b::Element(e::Situational, "Contact Inquiry Reference")),
                b::Segment(500, s::N3, "Member Residence Street Address",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Address Information", b::MaxLength(55)),
                  b::Element(e::Situational, "Address Information", b::MaxLength(55))),
                b::Segment(600, s::N4, "Member City, State, ZIP Code",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Situational, "City Name", b::MaxLength(30)),
                  b::Element(e::Situational, "State or Province Code", b::MaxLength(2)),
                  b::Element(e::Situational, "Postal Code", b::MaxLength(15)),
                  b::Element(e::Situational, "Country Code", b::MaxLength(3)),
                  b::Element(e::Situational, "Location Qualifier", b::MaxLength(2)),
                  b::Element(e::Situational, "Location Identifier", b::MaxLength(30)),
                  b::Element(e::Situational, "Country Subdivision Code", b::MaxLength(3))),
                b::Segment(800, s::DMG, "Member Demographics",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Situational, "Date Time Period Format Qualifier", b::Values("D8")),
                  b::Element(e::Situational, "Date Time Period", b::MaxLength(35)),
                  b::Element(e::Situational, "Gender Code", b::Values("F", "M")),
                  b::Element(e::Situational, "Marital Status Code", b::Values("B", "D", "I", "M", "R", "S", "U", "W", "X")),
                  b::Element(e::Situational, "Composite Race or Ethnicity Information"),
                  b::Element(e::Situational, "Citizenship Status Code"),
                  b::Element(e::Situational, "Country Code"),
                  b::Element(e::Situational, "Basis of Verification Code"),
                  b::Element(e::Situational, "Quantity"),
                  b::Element(e::Situational, "Code List Qualifier Code"),
                  b::Element(e::Situational, "Industry Code"))),
              d::LoopDef.build("2300",
                d::RepeatCount.bounded(99),
                b::Segment(2600, s::HD, "Health Coverage",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Maintenance Type Code", b::Values("001", "002", "021", "024", "025", "026", "030", "032")),
                  b::Element(e::Situational, "Maintenance Reason Code"),
                  b::Element(e::Situational, "Insurance Line Code", b::Values("AG", "AH", "AJ", "AK", "DCP", "DEN", "EPO", "FAC", "HE", "HLT", "HMO", "LTC", "LTD", "MM", "MOD", "PDG", "POS", "PPO", "PRA", "STD", "UR", "VIS")),
                  b::Element(e::Situational, "Plan Coverage Description", b::MaxLength(50)),
                  b::Element(e::Situational, "Coverage Level Code", b::Values("CHD", "DEP", "E1D", "E2D", "E3D", "E5D", "E6D", "E7D", "E8D", "E9D", "ECH", "EMP", "ESP", "FAM", "IND", "SPC", "SPO", "TWO")),
                  b::Element(e::Situational, "Count", b::MaxLength(9)),
                  b::Element(e::Situational, "Count", b::MaxLength(9)),
                  b::Element(e::Situational, "Underwriting Decision Code", b::MaxLength(1)),
                  b::Element(e::Situational, "Yes/No Condition or Response Code", b::MaxLength(1))),
                b::Segment(2700, s::DTP, "Health Coverage Dates",
                  r::Required, d::RepeatCount.bounded(6),
                  b::Element(e::Required, "Date/Time Qualifier", b::Values("300", "303", "343", "348", "349", "543", "695")),
                  b::Element(e::Required, "Date Time Period Format Qualifier", b::Values("D8", "RD8")),
                  b::Element(e::Required, "Date Time Period", b::MaxLength(35))))),
            b::Segment(6900, s::SE, "Transaction Set Trailer",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Number of Included Segments"),
              b::Element(e::Required,    "Transaction Set Control Number"))))
      end
    end
  end
end
