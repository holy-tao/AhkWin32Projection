#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UProperty extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_ALPHABETIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_BINARY_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_ASCII_HEX_DIGIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_BIDI_CONTROL => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_BIDI_MIRRORED => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_DASH => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_DEFAULT_IGNORABLE_CODE_POINT => 5

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_DEPRECATED => 6

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_DIACRITIC => 7

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_EXTENDER => 8

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_FULL_COMPOSITION_EXCLUSION => 9

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_GRAPHEME_BASE => 10

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_GRAPHEME_EXTEND => 11

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_GRAPHEME_LINK => 12

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_HEX_DIGIT => 13

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_HYPHEN => 14

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_ID_CONTINUE => 15

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_ID_START => 16

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_IDEOGRAPHIC => 17

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_IDS_BINARY_OPERATOR => 18

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_IDS_TRINARY_OPERATOR => 19

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_JOIN_CONTROL => 20

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_LOGICAL_ORDER_EXCEPTION => 21

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_LOWERCASE => 22

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_MATH => 23

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NONCHARACTER_CODE_POINT => 24

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_QUOTATION_MARK => 25

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_RADICAL => 26

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_SOFT_DOTTED => 27

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_TERMINAL_PUNCTUATION => 28

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_UNIFIED_IDEOGRAPH => 29

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_UPPERCASE => 30

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_WHITE_SPACE => 31

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_XID_CONTINUE => 32

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_XID_START => 33

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CASE_SENSITIVE => 34

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_S_TERM => 35

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_VARIATION_SELECTOR => 36

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NFD_INERT => 37

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NFKD_INERT => 38

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NFC_INERT => 39

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NFKC_INERT => 40

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_SEGMENT_STARTER => 41

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_PATTERN_SYNTAX => 42

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_PATTERN_WHITE_SPACE => 43

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_POSIX_ALNUM => 44

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_POSIX_BLANK => 45

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_POSIX_GRAPH => 46

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_POSIX_PRINT => 47

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_POSIX_XDIGIT => 48

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CASED => 49

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CASE_IGNORABLE => 50

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CHANGES_WHEN_LOWERCASED => 51

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CHANGES_WHEN_UPPERCASED => 52

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CHANGES_WHEN_TITLECASED => 53

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CHANGES_WHEN_CASEFOLDED => 54

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CHANGES_WHEN_CASEMAPPED => 55

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CHANGES_WHEN_NFKC_CASEFOLDED => 56

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_EMOJI => 57

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_EMOJI_PRESENTATION => 58

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_EMOJI_MODIFIER => 59

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_EMOJI_MODIFIER_BASE => 60

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_EMOJI_COMPONENT => 61

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_REGIONAL_INDICATOR => 62

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_PREPENDED_CONCATENATION_MARK => 63

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_EXTENDED_PICTOGRAPHIC => 64

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_BIDI_CLASS => 4096

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_INT_START => 4096

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_BLOCK => 4097

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CANONICAL_COMBINING_CLASS => 4098

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_DECOMPOSITION_TYPE => 4099

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_EAST_ASIAN_WIDTH => 4100

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_GENERAL_CATEGORY => 4101

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_JOINING_GROUP => 4102

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_JOINING_TYPE => 4103

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_LINE_BREAK => 4104

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NUMERIC_TYPE => 4105

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_SCRIPT => 4106

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_HANGUL_SYLLABLE_TYPE => 4107

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NFD_QUICK_CHECK => 4108

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NFKD_QUICK_CHECK => 4109

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NFC_QUICK_CHECK => 4110

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NFKC_QUICK_CHECK => 4111

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_LEAD_CANONICAL_COMBINING_CLASS => 4112

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_TRAIL_CANONICAL_COMBINING_CLASS => 4113

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_GRAPHEME_CLUSTER_BREAK => 4114

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_SENTENCE_BREAK => 4115

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_WORD_BREAK => 4116

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_BIDI_PAIRED_BRACKET_TYPE => 4117

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_INDIC_POSITIONAL_CATEGORY => 4118

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_INDIC_SYLLABIC_CATEGORY => 4119

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_VERTICAL_ORIENTATION => 4120

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_GENERAL_CATEGORY_MASK => 8192

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_MASK_START => 8192

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NUMERIC_VALUE => 12288

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_DOUBLE_START => 12288

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_AGE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_STRING_START => 16384

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_BIDI_MIRRORING_GLYPH => 16385

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_CASE_FOLDING => 16386

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_LOWERCASE_MAPPING => 16388

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_NAME => 16389

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_SIMPLE_CASE_FOLDING => 16390

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_SIMPLE_LOWERCASE_MAPPING => 16391

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_SIMPLE_TITLECASE_MAPPING => 16392

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_SIMPLE_UPPERCASE_MAPPING => 16393

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_TITLECASE_MAPPING => 16394

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_UPPERCASE_MAPPING => 16396

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_BIDI_PAIRED_BRACKET => 16397

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_SCRIPT_EXTENSIONS => 28672

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_OTHER_PROPERTY_START => 28672

    /**
     * @type {Integer (Int32)}
     */
    static UCHAR_INVALID_CODE => -1
}
