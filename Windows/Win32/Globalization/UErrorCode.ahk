#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UErrorCode{

    /**
     * @type {Integer (Int32)}
     */
    static U_USING_FALLBACK_WARNING => -128

    /**
     * @type {Integer (Int32)}
     */
    static U_ERROR_WARNING_START => -128

    /**
     * @type {Integer (Int32)}
     */
    static U_USING_DEFAULT_WARNING => -127

    /**
     * @type {Integer (Int32)}
     */
    static U_SAFECLONE_ALLOCATED_WARNING => -126

    /**
     * @type {Integer (Int32)}
     */
    static U_STATE_OLD_WARNING => -125

    /**
     * @type {Integer (Int32)}
     */
    static U_STRING_NOT_TERMINATED_WARNING => -124

    /**
     * @type {Integer (Int32)}
     */
    static U_SORT_KEY_TOO_SHORT_WARNING => -123

    /**
     * @type {Integer (Int32)}
     */
    static U_AMBIGUOUS_ALIAS_WARNING => -122

    /**
     * @type {Integer (Int32)}
     */
    static U_DIFFERENT_UCA_VERSION => -121

    /**
     * @type {Integer (Int32)}
     */
    static U_PLUGIN_CHANGED_LEVEL_WARNING => -120

    /**
     * @type {Integer (Int32)}
     */
    static U_ZERO_ERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_ILLEGAL_ARGUMENT_ERROR => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_MISSING_RESOURCE_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_INVALID_FORMAT_ERROR => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_FILE_ACCESS_ERROR => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_INTERNAL_PROGRAM_ERROR => 5

    /**
     * @type {Integer (Int32)}
     */
    static U_MESSAGE_PARSE_ERROR => 6

    /**
     * @type {Integer (Int32)}
     */
    static U_MEMORY_ALLOCATION_ERROR => 7

    /**
     * @type {Integer (Int32)}
     */
    static U_INDEX_OUTOFBOUNDS_ERROR => 8

    /**
     * @type {Integer (Int32)}
     */
    static U_PARSE_ERROR => 9

    /**
     * @type {Integer (Int32)}
     */
    static U_INVALID_CHAR_FOUND => 10

    /**
     * @type {Integer (Int32)}
     */
    static U_TRUNCATED_CHAR_FOUND => 11

    /**
     * @type {Integer (Int32)}
     */
    static U_ILLEGAL_CHAR_FOUND => 12

    /**
     * @type {Integer (Int32)}
     */
    static U_INVALID_TABLE_FORMAT => 13

    /**
     * @type {Integer (Int32)}
     */
    static U_INVALID_TABLE_FILE => 14

    /**
     * @type {Integer (Int32)}
     */
    static U_BUFFER_OVERFLOW_ERROR => 15

    /**
     * @type {Integer (Int32)}
     */
    static U_UNSUPPORTED_ERROR => 16

    /**
     * @type {Integer (Int32)}
     */
    static U_RESOURCE_TYPE_MISMATCH => 17

    /**
     * @type {Integer (Int32)}
     */
    static U_ILLEGAL_ESCAPE_SEQUENCE => 18

    /**
     * @type {Integer (Int32)}
     */
    static U_UNSUPPORTED_ESCAPE_SEQUENCE => 19

    /**
     * @type {Integer (Int32)}
     */
    static U_NO_SPACE_AVAILABLE => 20

    /**
     * @type {Integer (Int32)}
     */
    static U_CE_NOT_FOUND_ERROR => 21

    /**
     * @type {Integer (Int32)}
     */
    static U_PRIMARY_TOO_LONG_ERROR => 22

    /**
     * @type {Integer (Int32)}
     */
    static U_STATE_TOO_OLD_ERROR => 23

    /**
     * @type {Integer (Int32)}
     */
    static U_TOO_MANY_ALIASES_ERROR => 24

    /**
     * @type {Integer (Int32)}
     */
    static U_ENUM_OUT_OF_SYNC_ERROR => 25

    /**
     * @type {Integer (Int32)}
     */
    static U_INVARIANT_CONVERSION_ERROR => 26

    /**
     * @type {Integer (Int32)}
     */
    static U_INVALID_STATE_ERROR => 27

    /**
     * @type {Integer (Int32)}
     */
    static U_COLLATOR_VERSION_MISMATCH => 28

    /**
     * @type {Integer (Int32)}
     */
    static U_USELESS_COLLATOR_ERROR => 29

    /**
     * @type {Integer (Int32)}
     */
    static U_NO_WRITE_PERMISSION => 30

    /**
     * @type {Integer (Int32)}
     */
    static U_BAD_VARIABLE_DEFINITION => 65536

    /**
     * @type {Integer (Int32)}
     */
    static U_PARSE_ERROR_START => 65536

    /**
     * @type {Integer (Int32)}
     */
    static U_MALFORMED_RULE => 65537

    /**
     * @type {Integer (Int32)}
     */
    static U_MALFORMED_SET => 65538

    /**
     * @type {Integer (Int32)}
     */
    static U_MALFORMED_SYMBOL_REFERENCE => 65539

    /**
     * @type {Integer (Int32)}
     */
    static U_MALFORMED_UNICODE_ESCAPE => 65540

    /**
     * @type {Integer (Int32)}
     */
    static U_MALFORMED_VARIABLE_DEFINITION => 65541

    /**
     * @type {Integer (Int32)}
     */
    static U_MALFORMED_VARIABLE_REFERENCE => 65542

    /**
     * @type {Integer (Int32)}
     */
    static U_MISMATCHED_SEGMENT_DELIMITERS => 65543

    /**
     * @type {Integer (Int32)}
     */
    static U_MISPLACED_ANCHOR_START => 65544

    /**
     * @type {Integer (Int32)}
     */
    static U_MISPLACED_CURSOR_OFFSET => 65545

    /**
     * @type {Integer (Int32)}
     */
    static U_MISPLACED_QUANTIFIER => 65546

    /**
     * @type {Integer (Int32)}
     */
    static U_MISSING_OPERATOR => 65547

    /**
     * @type {Integer (Int32)}
     */
    static U_MISSING_SEGMENT_CLOSE => 65548

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_ANTE_CONTEXTS => 65549

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_CURSORS => 65550

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_POST_CONTEXTS => 65551

    /**
     * @type {Integer (Int32)}
     */
    static U_TRAILING_BACKSLASH => 65552

    /**
     * @type {Integer (Int32)}
     */
    static U_UNDEFINED_SEGMENT_REFERENCE => 65553

    /**
     * @type {Integer (Int32)}
     */
    static U_UNDEFINED_VARIABLE => 65554

    /**
     * @type {Integer (Int32)}
     */
    static U_UNQUOTED_SPECIAL => 65555

    /**
     * @type {Integer (Int32)}
     */
    static U_UNTERMINATED_QUOTE => 65556

    /**
     * @type {Integer (Int32)}
     */
    static U_RULE_MASK_ERROR => 65557

    /**
     * @type {Integer (Int32)}
     */
    static U_MISPLACED_COMPOUND_FILTER => 65558

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_COMPOUND_FILTERS => 65559

    /**
     * @type {Integer (Int32)}
     */
    static U_INVALID_RBT_SYNTAX => 65560

    /**
     * @type {Integer (Int32)}
     */
    static U_INVALID_PROPERTY_PATTERN => 65561

    /**
     * @type {Integer (Int32)}
     */
    static U_MALFORMED_PRAGMA => 65562

    /**
     * @type {Integer (Int32)}
     */
    static U_UNCLOSED_SEGMENT => 65563

    /**
     * @type {Integer (Int32)}
     */
    static U_ILLEGAL_CHAR_IN_SEGMENT => 65564

    /**
     * @type {Integer (Int32)}
     */
    static U_VARIABLE_RANGE_EXHAUSTED => 65565

    /**
     * @type {Integer (Int32)}
     */
    static U_VARIABLE_RANGE_OVERLAP => 65566

    /**
     * @type {Integer (Int32)}
     */
    static U_ILLEGAL_CHARACTER => 65567

    /**
     * @type {Integer (Int32)}
     */
    static U_INTERNAL_TRANSLITERATOR_ERROR => 65568

    /**
     * @type {Integer (Int32)}
     */
    static U_INVALID_ID => 65569

    /**
     * @type {Integer (Int32)}
     */
    static U_INVALID_FUNCTION => 65570

    /**
     * @type {Integer (Int32)}
     */
    static U_UNEXPECTED_TOKEN => 65792

    /**
     * @type {Integer (Int32)}
     */
    static U_FMT_PARSE_ERROR_START => 65792

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_DECIMAL_SEPARATORS => 65793

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_DECIMAL_SEPERATORS => 65793

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_EXPONENTIAL_SYMBOLS => 65794

    /**
     * @type {Integer (Int32)}
     */
    static U_MALFORMED_EXPONENTIAL_PATTERN => 65795

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_PERCENT_SYMBOLS => 65796

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_PERMILL_SYMBOLS => 65797

    /**
     * @type {Integer (Int32)}
     */
    static U_MULTIPLE_PAD_SPECIFIERS => 65798

    /**
     * @type {Integer (Int32)}
     */
    static U_PATTERN_SYNTAX_ERROR => 65799

    /**
     * @type {Integer (Int32)}
     */
    static U_ILLEGAL_PAD_POSITION => 65800

    /**
     * @type {Integer (Int32)}
     */
    static U_UNMATCHED_BRACES => 65801

    /**
     * @type {Integer (Int32)}
     */
    static U_UNSUPPORTED_PROPERTY => 65802

    /**
     * @type {Integer (Int32)}
     */
    static U_UNSUPPORTED_ATTRIBUTE => 65803

    /**
     * @type {Integer (Int32)}
     */
    static U_ARGUMENT_TYPE_MISMATCH => 65804

    /**
     * @type {Integer (Int32)}
     */
    static U_DUPLICATE_KEYWORD => 65805

    /**
     * @type {Integer (Int32)}
     */
    static U_UNDEFINED_KEYWORD => 65806

    /**
     * @type {Integer (Int32)}
     */
    static U_DEFAULT_KEYWORD_MISSING => 65807

    /**
     * @type {Integer (Int32)}
     */
    static U_DECIMAL_NUMBER_SYNTAX_ERROR => 65808

    /**
     * @type {Integer (Int32)}
     */
    static U_FORMAT_INEXACT_ERROR => 65809

    /**
     * @type {Integer (Int32)}
     */
    static U_NUMBER_ARG_OUTOFBOUNDS_ERROR => 65810

    /**
     * @type {Integer (Int32)}
     */
    static U_NUMBER_SKELETON_SYNTAX_ERROR => 65811

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_INTERNAL_ERROR => 66048

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_ERROR_START => 66048

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_HEX_DIGITS_EXPECTED => 66049

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_SEMICOLON_EXPECTED => 66050

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_RULE_SYNTAX => 66051

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_UNCLOSED_SET => 66052

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_ASSIGN_ERROR => 66053

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_VARIABLE_REDFINITION => 66054

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_MISMATCHED_PAREN => 66055

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_NEW_LINE_IN_QUOTED_STRING => 66056

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_UNDEFINED_VARIABLE => 66057

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_INIT_ERROR => 66058

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_RULE_EMPTY_SET => 66059

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_UNRECOGNIZED_OPTION => 66060

    /**
     * @type {Integer (Int32)}
     */
    static U_BRK_MALFORMED_RULE_TAG => 66061

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_INTERNAL_ERROR => 66304

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_ERROR_START => 66304

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_RULE_SYNTAX => 66305

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_INVALID_STATE => 66306

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_BAD_ESCAPE_SEQUENCE => 66307

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_PROPERTY_SYNTAX => 66308

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_UNIMPLEMENTED => 66309

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_MISMATCHED_PAREN => 66310

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_NUMBER_TOO_BIG => 66311

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_BAD_INTERVAL => 66312

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_MAX_LT_MIN => 66313

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_INVALID_BACK_REF => 66314

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_INVALID_FLAG => 66315

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_LOOK_BEHIND_LIMIT => 66316

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_SET_CONTAINS_STRING => 66317

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_MISSING_CLOSE_BRACKET => 66319

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_INVALID_RANGE => 66320

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_STACK_OVERFLOW => 66321

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_TIME_OUT => 66322

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_STOPPED_BY_CALLER => 66323

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_PATTERN_TOO_BIG => 66324

    /**
     * @type {Integer (Int32)}
     */
    static U_REGEX_INVALID_CAPTURE_GROUP_NAME => 66325

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_PROHIBITED_ERROR => 66560

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_ERROR_START => 66560

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_UNASSIGNED_ERROR => 66561

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_CHECK_BIDI_ERROR => 66562

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_STD3_ASCII_RULES_ERROR => 66563

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_ACE_PREFIX_ERROR => 66564

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_VERIFICATION_ERROR => 66565

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_LABEL_TOO_LONG_ERROR => 66566

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_ZERO_LENGTH_LABEL_ERROR => 66567

    /**
     * @type {Integer (Int32)}
     */
    static U_IDNA_DOMAIN_NAME_TOO_LONG_ERROR => 66568

    /**
     * @type {Integer (Int32)}
     */
    static U_STRINGPREP_PROHIBITED_ERROR => 66560

    /**
     * @type {Integer (Int32)}
     */
    static U_STRINGPREP_UNASSIGNED_ERROR => 66561

    /**
     * @type {Integer (Int32)}
     */
    static U_STRINGPREP_CHECK_BIDI_ERROR => 66562

    /**
     * @type {Integer (Int32)}
     */
    static U_PLUGIN_ERROR_START => 66816

    /**
     * @type {Integer (Int32)}
     */
    static U_PLUGIN_TOO_HIGH => 66816

    /**
     * @type {Integer (Int32)}
     */
    static U_PLUGIN_DIDNT_SET_LEVEL => 66817
}
