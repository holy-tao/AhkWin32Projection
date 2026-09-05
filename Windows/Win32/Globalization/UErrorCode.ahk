#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UErrorCode extends Win32Enum {

    /**
     * Native name: U_USING_FALLBACK_WARNING
     * @type {Integer (Int32)}
     */
    static USING_FALLBACK_WARNING => -128

    /**
     * Native name: U_ERROR_WARNING_START
     * @type {Integer (Int32)}
     */
    static WARNING_START => -128

    /**
     * Native name: U_USING_DEFAULT_WARNING
     * @type {Integer (Int32)}
     */
    static USING_DEFAULT_WARNING => -127

    /**
     * Native name: U_SAFECLONE_ALLOCATED_WARNING
     * @type {Integer (Int32)}
     */
    static SAFECLONE_ALLOCATED_WARNING => -126

    /**
     * Native name: U_STATE_OLD_WARNING
     * @type {Integer (Int32)}
     */
    static STATE_OLD_WARNING => -125

    /**
     * Native name: U_STRING_NOT_TERMINATED_WARNING
     * @type {Integer (Int32)}
     */
    static STRING_NOT_TERMINATED_WARNING => -124

    /**
     * Native name: U_SORT_KEY_TOO_SHORT_WARNING
     * @type {Integer (Int32)}
     */
    static SORT_KEY_TOO_SHORT_WARNING => -123

    /**
     * Native name: U_AMBIGUOUS_ALIAS_WARNING
     * @type {Integer (Int32)}
     */
    static AMBIGUOUS_ALIAS_WARNING => -122

    /**
     * Native name: U_DIFFERENT_UCA_VERSION
     * @type {Integer (Int32)}
     */
    static DIFFERENT_UCA_VERSION => -121

    /**
     * Native name: U_PLUGIN_CHANGED_LEVEL_WARNING
     * @type {Integer (Int32)}
     */
    static PLUGIN_CHANGED_LEVEL_WARNING => -120

    /**
     * Native name: U_ZERO_ERROR
     * @type {Integer (Int32)}
     */
    static ZERO_ERROR => 0

    /**
     * Native name: U_ILLEGAL_ARGUMENT_ERROR
     * @type {Integer (Int32)}
     */
    static ILLEGAL_ARGUMENT_ERROR => 1

    /**
     * Native name: U_MISSING_RESOURCE_ERROR
     * @type {Integer (Int32)}
     */
    static MISSING_RESOURCE_ERROR => 2

    /**
     * Native name: U_INVALID_FORMAT_ERROR
     * @type {Integer (Int32)}
     */
    static INVALID_FORMAT_ERROR => 3

    /**
     * Native name: U_FILE_ACCESS_ERROR
     * @type {Integer (Int32)}
     */
    static FILE_ACCESS_ERROR => 4

    /**
     * Native name: U_INTERNAL_PROGRAM_ERROR
     * @type {Integer (Int32)}
     */
    static INTERNAL_PROGRAM_ERROR => 5

    /**
     * Native name: U_MESSAGE_PARSE_ERROR
     * @type {Integer (Int32)}
     */
    static MESSAGE_PARSE_ERROR => 6

    /**
     * Native name: U_MEMORY_ALLOCATION_ERROR
     * @type {Integer (Int32)}
     */
    static MEMORY_ALLOCATION_ERROR => 7

    /**
     * Native name: U_INDEX_OUTOFBOUNDS_ERROR
     * @type {Integer (Int32)}
     */
    static INDEX_OUTOFBOUNDS_ERROR => 8

    /**
     * Native name: U_PARSE_ERROR
     * @type {Integer (Int32)}
     */
    static PARSE_ERROR => 9

    /**
     * Native name: U_INVALID_CHAR_FOUND
     * @type {Integer (Int32)}
     */
    static INVALID_CHAR_FOUND => 10

    /**
     * Native name: U_TRUNCATED_CHAR_FOUND
     * @type {Integer (Int32)}
     */
    static TRUNCATED_CHAR_FOUND => 11

    /**
     * Native name: U_ILLEGAL_CHAR_FOUND
     * @type {Integer (Int32)}
     */
    static ILLEGAL_CHAR_FOUND => 12

    /**
     * Native name: U_INVALID_TABLE_FORMAT
     * @type {Integer (Int32)}
     */
    static INVALID_TABLE_FORMAT => 13

    /**
     * Native name: U_INVALID_TABLE_FILE
     * @type {Integer (Int32)}
     */
    static INVALID_TABLE_FILE => 14

    /**
     * Native name: U_BUFFER_OVERFLOW_ERROR
     * @type {Integer (Int32)}
     */
    static BUFFER_OVERFLOW_ERROR => 15

    /**
     * Native name: U_UNSUPPORTED_ERROR
     * @type {Integer (Int32)}
     */
    static UNSUPPORTED_ERROR => 16

    /**
     * Native name: U_RESOURCE_TYPE_MISMATCH
     * @type {Integer (Int32)}
     */
    static RESOURCE_TYPE_MISMATCH => 17

    /**
     * Native name: U_ILLEGAL_ESCAPE_SEQUENCE
     * @type {Integer (Int32)}
     */
    static ILLEGAL_ESCAPE_SEQUENCE => 18

    /**
     * Native name: U_UNSUPPORTED_ESCAPE_SEQUENCE
     * @type {Integer (Int32)}
     */
    static UNSUPPORTED_ESCAPE_SEQUENCE => 19

    /**
     * Native name: U_NO_SPACE_AVAILABLE
     * @type {Integer (Int32)}
     */
    static NO_SPACE_AVAILABLE => 20

    /**
     * Native name: U_CE_NOT_FOUND_ERROR
     * @type {Integer (Int32)}
     */
    static CE_NOT_FOUND_ERROR => 21

    /**
     * Native name: U_PRIMARY_TOO_LONG_ERROR
     * @type {Integer (Int32)}
     */
    static PRIMARY_TOO_LONG_ERROR => 22

    /**
     * Native name: U_STATE_TOO_OLD_ERROR
     * @type {Integer (Int32)}
     */
    static STATE_TOO_OLD_ERROR => 23

    /**
     * Native name: U_TOO_MANY_ALIASES_ERROR
     * @type {Integer (Int32)}
     */
    static TOO_MANY_ALIASES_ERROR => 24

    /**
     * Native name: U_ENUM_OUT_OF_SYNC_ERROR
     * @type {Integer (Int32)}
     */
    static ENUM_OUT_OF_SYNC_ERROR => 25

    /**
     * Native name: U_INVARIANT_CONVERSION_ERROR
     * @type {Integer (Int32)}
     */
    static INVARIANT_CONVERSION_ERROR => 26

    /**
     * Native name: U_INVALID_STATE_ERROR
     * @type {Integer (Int32)}
     */
    static INVALID_STATE_ERROR => 27

    /**
     * Native name: U_COLLATOR_VERSION_MISMATCH
     * @type {Integer (Int32)}
     */
    static COLLATOR_VERSION_MISMATCH => 28

    /**
     * Native name: U_USELESS_COLLATOR_ERROR
     * @type {Integer (Int32)}
     */
    static USELESS_COLLATOR_ERROR => 29

    /**
     * Native name: U_NO_WRITE_PERMISSION
     * @type {Integer (Int32)}
     */
    static NO_WRITE_PERMISSION => 30

    /**
     * Native name: U_INPUT_TOO_LONG_ERROR
     * @type {Integer (Int32)}
     */
    static INPUT_TOO_LONG_ERROR => 31

    /**
     * Native name: U_BAD_VARIABLE_DEFINITION
     * @type {Integer (Int32)}
     */
    static BAD_VARIABLE_DEFINITION => 65536

    /**
     * Native name: U_PARSE_ERROR_START
     * @type {Integer (Int32)}
     */
    static PARSE_ERROR_START => 65536

    /**
     * Native name: U_MALFORMED_RULE
     * @type {Integer (Int32)}
     */
    static MALFORMED_RULE => 65537

    /**
     * Native name: U_MALFORMED_SET
     * @type {Integer (Int32)}
     */
    static MALFORMED_SET => 65538

    /**
     * Native name: U_MALFORMED_SYMBOL_REFERENCE
     * @type {Integer (Int32)}
     */
    static MALFORMED_SYMBOL_REFERENCE => 65539

    /**
     * Native name: U_MALFORMED_UNICODE_ESCAPE
     * @type {Integer (Int32)}
     */
    static MALFORMED_UNICODE_ESCAPE => 65540

    /**
     * Native name: U_MALFORMED_VARIABLE_DEFINITION
     * @type {Integer (Int32)}
     */
    static MALFORMED_VARIABLE_DEFINITION => 65541

    /**
     * Native name: U_MALFORMED_VARIABLE_REFERENCE
     * @type {Integer (Int32)}
     */
    static MALFORMED_VARIABLE_REFERENCE => 65542

    /**
     * Native name: U_MISMATCHED_SEGMENT_DELIMITERS
     * @type {Integer (Int32)}
     */
    static MISMATCHED_SEGMENT_DELIMITERS => 65543

    /**
     * Native name: U_MISPLACED_ANCHOR_START
     * @type {Integer (Int32)}
     */
    static MISPLACED_ANCHOR_START => 65544

    /**
     * Native name: U_MISPLACED_CURSOR_OFFSET
     * @type {Integer (Int32)}
     */
    static MISPLACED_CURSOR_OFFSET => 65545

    /**
     * Native name: U_MISPLACED_QUANTIFIER
     * @type {Integer (Int32)}
     */
    static MISPLACED_QUANTIFIER => 65546

    /**
     * Native name: U_MISSING_OPERATOR
     * @type {Integer (Int32)}
     */
    static MISSING_OPERATOR => 65547

    /**
     * Native name: U_MISSING_SEGMENT_CLOSE
     * @type {Integer (Int32)}
     */
    static MISSING_SEGMENT_CLOSE => 65548

    /**
     * Native name: U_MULTIPLE_ANTE_CONTEXTS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_ANTE_CONTEXTS => 65549

    /**
     * Native name: U_MULTIPLE_CURSORS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_CURSORS => 65550

    /**
     * Native name: U_MULTIPLE_POST_CONTEXTS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_POST_CONTEXTS => 65551

    /**
     * Native name: U_TRAILING_BACKSLASH
     * @type {Integer (Int32)}
     */
    static TRAILING_BACKSLASH => 65552

    /**
     * Native name: U_UNDEFINED_SEGMENT_REFERENCE
     * @type {Integer (Int32)}
     */
    static UNDEFINED_SEGMENT_REFERENCE => 65553

    /**
     * Native name: U_UNDEFINED_VARIABLE
     * @type {Integer (Int32)}
     */
    static UNDEFINED_VARIABLE => 65554

    /**
     * Native name: U_UNQUOTED_SPECIAL
     * @type {Integer (Int32)}
     */
    static UNQUOTED_SPECIAL => 65555

    /**
     * Native name: U_UNTERMINATED_QUOTE
     * @type {Integer (Int32)}
     */
    static UNTERMINATED_QUOTE => 65556

    /**
     * Native name: U_RULE_MASK_ERROR
     * @type {Integer (Int32)}
     */
    static RULE_MASK_ERROR => 65557

    /**
     * Native name: U_MISPLACED_COMPOUND_FILTER
     * @type {Integer (Int32)}
     */
    static MISPLACED_COMPOUND_FILTER => 65558

    /**
     * Native name: U_MULTIPLE_COMPOUND_FILTERS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_COMPOUND_FILTERS => 65559

    /**
     * Native name: U_INVALID_RBT_SYNTAX
     * @type {Integer (Int32)}
     */
    static INVALID_RBT_SYNTAX => 65560

    /**
     * Native name: U_INVALID_PROPERTY_PATTERN
     * @type {Integer (Int32)}
     */
    static INVALID_PROPERTY_PATTERN => 65561

    /**
     * Native name: U_MALFORMED_PRAGMA
     * @type {Integer (Int32)}
     */
    static MALFORMED_PRAGMA => 65562

    /**
     * Native name: U_UNCLOSED_SEGMENT
     * @type {Integer (Int32)}
     */
    static UNCLOSED_SEGMENT => 65563

    /**
     * Native name: U_ILLEGAL_CHAR_IN_SEGMENT
     * @type {Integer (Int32)}
     */
    static ILLEGAL_CHAR_IN_SEGMENT => 65564

    /**
     * Native name: U_VARIABLE_RANGE_EXHAUSTED
     * @type {Integer (Int32)}
     */
    static VARIABLE_RANGE_EXHAUSTED => 65565

    /**
     * Native name: U_VARIABLE_RANGE_OVERLAP
     * @type {Integer (Int32)}
     */
    static VARIABLE_RANGE_OVERLAP => 65566

    /**
     * Native name: U_ILLEGAL_CHARACTER
     * @type {Integer (Int32)}
     */
    static ILLEGAL_CHARACTER => 65567

    /**
     * Native name: U_INTERNAL_TRANSLITERATOR_ERROR
     * @type {Integer (Int32)}
     */
    static INTERNAL_TRANSLITERATOR_ERROR => 65568

    /**
     * Native name: U_INVALID_ID
     * @type {Integer (Int32)}
     */
    static INVALID_ID => 65569

    /**
     * Native name: U_INVALID_FUNCTION
     * @type {Integer (Int32)}
     */
    static INVALID_FUNCTION => 65570

    /**
     * Native name: U_UNEXPECTED_TOKEN
     * @type {Integer (Int32)}
     */
    static UNEXPECTED_TOKEN => 65792

    /**
     * Native name: U_FMT_PARSE_ERROR_START
     * @type {Integer (Int32)}
     */
    static FMT_PARSE_ERROR_START => 65792

    /**
     * Native name: U_MULTIPLE_DECIMAL_SEPARATORS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_DECIMAL_SEPARATORS => 65793

    /**
     * Native name: U_MULTIPLE_DECIMAL_SEPERATORS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_DECIMAL_SEPERATORS => 65793

    /**
     * Native name: U_MULTIPLE_EXPONENTIAL_SYMBOLS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_EXPONENTIAL_SYMBOLS => 65794

    /**
     * Native name: U_MALFORMED_EXPONENTIAL_PATTERN
     * @type {Integer (Int32)}
     */
    static MALFORMED_EXPONENTIAL_PATTERN => 65795

    /**
     * Native name: U_MULTIPLE_PERCENT_SYMBOLS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_PERCENT_SYMBOLS => 65796

    /**
     * Native name: U_MULTIPLE_PERMILL_SYMBOLS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_PERMILL_SYMBOLS => 65797

    /**
     * Native name: U_MULTIPLE_PAD_SPECIFIERS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_PAD_SPECIFIERS => 65798

    /**
     * Native name: U_PATTERN_SYNTAX_ERROR
     * @type {Integer (Int32)}
     */
    static PATTERN_SYNTAX_ERROR => 65799

    /**
     * Native name: U_ILLEGAL_PAD_POSITION
     * @type {Integer (Int32)}
     */
    static ILLEGAL_PAD_POSITION => 65800

    /**
     * Native name: U_UNMATCHED_BRACES
     * @type {Integer (Int32)}
     */
    static UNMATCHED_BRACES => 65801

    /**
     * Native name: U_UNSUPPORTED_PROPERTY
     * @type {Integer (Int32)}
     */
    static UNSUPPORTED_PROPERTY => 65802

    /**
     * Native name: U_UNSUPPORTED_ATTRIBUTE
     * @type {Integer (Int32)}
     */
    static UNSUPPORTED_ATTRIBUTE => 65803

    /**
     * Native name: U_ARGUMENT_TYPE_MISMATCH
     * @type {Integer (Int32)}
     */
    static ARGUMENT_TYPE_MISMATCH => 65804

    /**
     * Native name: U_DUPLICATE_KEYWORD
     * @type {Integer (Int32)}
     */
    static DUPLICATE_KEYWORD => 65805

    /**
     * Native name: U_UNDEFINED_KEYWORD
     * @type {Integer (Int32)}
     */
    static UNDEFINED_KEYWORD => 65806

    /**
     * Native name: U_DEFAULT_KEYWORD_MISSING
     * @type {Integer (Int32)}
     */
    static DEFAULT_KEYWORD_MISSING => 65807

    /**
     * Native name: U_DECIMAL_NUMBER_SYNTAX_ERROR
     * @type {Integer (Int32)}
     */
    static DECIMAL_NUMBER_SYNTAX_ERROR => 65808

    /**
     * Native name: U_FORMAT_INEXACT_ERROR
     * @type {Integer (Int32)}
     */
    static FORMAT_INEXACT_ERROR => 65809

    /**
     * Native name: U_NUMBER_ARG_OUTOFBOUNDS_ERROR
     * @type {Integer (Int32)}
     */
    static NUMBER_ARG_OUTOFBOUNDS_ERROR => 65810

    /**
     * Native name: U_NUMBER_SKELETON_SYNTAX_ERROR
     * @type {Integer (Int32)}
     */
    static NUMBER_SKELETON_SYNTAX_ERROR => 65811

    /**
     * Native name: U_BRK_INTERNAL_ERROR
     * @type {Integer (Int32)}
     */
    static BRK_INTERNAL_ERROR => 66048

    /**
     * Native name: U_BRK_ERROR_START
     * @type {Integer (Int32)}
     */
    static BRK_ERROR_START => 66048

    /**
     * Native name: U_BRK_HEX_DIGITS_EXPECTED
     * @type {Integer (Int32)}
     */
    static BRK_HEX_DIGITS_EXPECTED => 66049

    /**
     * Native name: U_BRK_SEMICOLON_EXPECTED
     * @type {Integer (Int32)}
     */
    static BRK_SEMICOLON_EXPECTED => 66050

    /**
     * Native name: U_BRK_RULE_SYNTAX
     * @type {Integer (Int32)}
     */
    static BRK_RULE_SYNTAX => 66051

    /**
     * Native name: U_BRK_UNCLOSED_SET
     * @type {Integer (Int32)}
     */
    static BRK_UNCLOSED_SET => 66052

    /**
     * Native name: U_BRK_ASSIGN_ERROR
     * @type {Integer (Int32)}
     */
    static BRK_ASSIGN_ERROR => 66053

    /**
     * Native name: U_BRK_VARIABLE_REDFINITION
     * @type {Integer (Int32)}
     */
    static BRK_VARIABLE_REDFINITION => 66054

    /**
     * Native name: U_BRK_MISMATCHED_PAREN
     * @type {Integer (Int32)}
     */
    static BRK_MISMATCHED_PAREN => 66055

    /**
     * Native name: U_BRK_NEW_LINE_IN_QUOTED_STRING
     * @type {Integer (Int32)}
     */
    static BRK_NEW_LINE_IN_QUOTED_STRING => 66056

    /**
     * Native name: U_BRK_UNDEFINED_VARIABLE
     * @type {Integer (Int32)}
     */
    static BRK_UNDEFINED_VARIABLE => 66057

    /**
     * Native name: U_BRK_INIT_ERROR
     * @type {Integer (Int32)}
     */
    static BRK_INIT_ERROR => 66058

    /**
     * Native name: U_BRK_RULE_EMPTY_SET
     * @type {Integer (Int32)}
     */
    static BRK_RULE_EMPTY_SET => 66059

    /**
     * Native name: U_BRK_UNRECOGNIZED_OPTION
     * @type {Integer (Int32)}
     */
    static BRK_UNRECOGNIZED_OPTION => 66060

    /**
     * Native name: U_BRK_MALFORMED_RULE_TAG
     * @type {Integer (Int32)}
     */
    static BRK_MALFORMED_RULE_TAG => 66061

    /**
     * Native name: U_REGEX_INTERNAL_ERROR
     * @type {Integer (Int32)}
     */
    static REGEX_INTERNAL_ERROR => 66304

    /**
     * Native name: U_REGEX_ERROR_START
     * @type {Integer (Int32)}
     */
    static REGEX_ERROR_START => 66304

    /**
     * Native name: U_REGEX_RULE_SYNTAX
     * @type {Integer (Int32)}
     */
    static REGEX_RULE_SYNTAX => 66305

    /**
     * Native name: U_REGEX_INVALID_STATE
     * @type {Integer (Int32)}
     */
    static REGEX_INVALID_STATE => 66306

    /**
     * Native name: U_REGEX_BAD_ESCAPE_SEQUENCE
     * @type {Integer (Int32)}
     */
    static REGEX_BAD_ESCAPE_SEQUENCE => 66307

    /**
     * Native name: U_REGEX_PROPERTY_SYNTAX
     * @type {Integer (Int32)}
     */
    static REGEX_PROPERTY_SYNTAX => 66308

    /**
     * Native name: U_REGEX_UNIMPLEMENTED
     * @type {Integer (Int32)}
     */
    static REGEX_UNIMPLEMENTED => 66309

    /**
     * Native name: U_REGEX_MISMATCHED_PAREN
     * @type {Integer (Int32)}
     */
    static REGEX_MISMATCHED_PAREN => 66310

    /**
     * Native name: U_REGEX_NUMBER_TOO_BIG
     * @type {Integer (Int32)}
     */
    static REGEX_NUMBER_TOO_BIG => 66311

    /**
     * Native name: U_REGEX_BAD_INTERVAL
     * @type {Integer (Int32)}
     */
    static REGEX_BAD_INTERVAL => 66312

    /**
     * Native name: U_REGEX_MAX_LT_MIN
     * @type {Integer (Int32)}
     */
    static REGEX_MAX_LT_MIN => 66313

    /**
     * Native name: U_REGEX_INVALID_BACK_REF
     * @type {Integer (Int32)}
     */
    static REGEX_INVALID_BACK_REF => 66314

    /**
     * Native name: U_REGEX_INVALID_FLAG
     * @type {Integer (Int32)}
     */
    static REGEX_INVALID_FLAG => 66315

    /**
     * Native name: U_REGEX_LOOK_BEHIND_LIMIT
     * @type {Integer (Int32)}
     */
    static REGEX_LOOK_BEHIND_LIMIT => 66316

    /**
     * Native name: U_REGEX_SET_CONTAINS_STRING
     * @type {Integer (Int32)}
     */
    static REGEX_SET_CONTAINS_STRING => 66317

    /**
     * Native name: U_REGEX_MISSING_CLOSE_BRACKET
     * @type {Integer (Int32)}
     */
    static REGEX_MISSING_CLOSE_BRACKET => 66319

    /**
     * Native name: U_REGEX_INVALID_RANGE
     * @type {Integer (Int32)}
     */
    static REGEX_INVALID_RANGE => 66320

    /**
     * Native name: U_REGEX_STACK_OVERFLOW
     * @type {Integer (Int32)}
     */
    static REGEX_STACK_OVERFLOW => 66321

    /**
     * Native name: U_REGEX_TIME_OUT
     * @type {Integer (Int32)}
     */
    static REGEX_TIME_OUT => 66322

    /**
     * Native name: U_REGEX_STOPPED_BY_CALLER
     * @type {Integer (Int32)}
     */
    static REGEX_STOPPED_BY_CALLER => 66323

    /**
     * Native name: U_REGEX_PATTERN_TOO_BIG
     * @type {Integer (Int32)}
     */
    static REGEX_PATTERN_TOO_BIG => 66324

    /**
     * Native name: U_REGEX_INVALID_CAPTURE_GROUP_NAME
     * @type {Integer (Int32)}
     */
    static REGEX_INVALID_CAPTURE_GROUP_NAME => 66325

    /**
     * Native name: U_IDNA_PROHIBITED_ERROR
     * @type {Integer (Int32)}
     */
    static IDNA_PROHIBITED_ERROR => 66560

    /**
     * Native name: U_IDNA_ERROR_START
     * @type {Integer (Int32)}
     */
    static IDNA_ERROR_START => 66560

    /**
     * Native name: U_IDNA_UNASSIGNED_ERROR
     * @type {Integer (Int32)}
     */
    static IDNA_UNASSIGNED_ERROR => 66561

    /**
     * Native name: U_IDNA_CHECK_BIDI_ERROR
     * @type {Integer (Int32)}
     */
    static IDNA_CHECK_BIDI_ERROR => 66562

    /**
     * Native name: U_IDNA_STD3_ASCII_RULES_ERROR
     * @type {Integer (Int32)}
     */
    static IDNA_STD3_ASCII_RULES_ERROR => 66563

    /**
     * Native name: U_IDNA_ACE_PREFIX_ERROR
     * @type {Integer (Int32)}
     */
    static IDNA_ACE_PREFIX_ERROR => 66564

    /**
     * Native name: U_IDNA_VERIFICATION_ERROR
     * @type {Integer (Int32)}
     */
    static IDNA_VERIFICATION_ERROR => 66565

    /**
     * Native name: U_IDNA_LABEL_TOO_LONG_ERROR
     * @type {Integer (Int32)}
     */
    static IDNA_LABEL_TOO_LONG_ERROR => 66566

    /**
     * Native name: U_IDNA_ZERO_LENGTH_LABEL_ERROR
     * @type {Integer (Int32)}
     */
    static IDNA_ZERO_LENGTH_LABEL_ERROR => 66567

    /**
     * Native name: U_IDNA_DOMAIN_NAME_TOO_LONG_ERROR
     * @type {Integer (Int32)}
     */
    static IDNA_DOMAIN_NAME_TOO_LONG_ERROR => 66568

    /**
     * Native name: U_STRINGPREP_PROHIBITED_ERROR
     * @type {Integer (Int32)}
     */
    static STRINGPREP_PROHIBITED_ERROR => 66560

    /**
     * Native name: U_STRINGPREP_UNASSIGNED_ERROR
     * @type {Integer (Int32)}
     */
    static STRINGPREP_UNASSIGNED_ERROR => 66561

    /**
     * Native name: U_STRINGPREP_CHECK_BIDI_ERROR
     * @type {Integer (Int32)}
     */
    static STRINGPREP_CHECK_BIDI_ERROR => 66562

    /**
     * Native name: U_PLUGIN_ERROR_START
     * @type {Integer (Int32)}
     */
    static PLUGIN_ERROR_START => 66816

    /**
     * Native name: U_PLUGIN_TOO_HIGH
     * @type {Integer (Int32)}
     */
    static PLUGIN_TOO_HIGH => 66816

    /**
     * Native name: U_PLUGIN_DIDNT_SET_LEVEL
     * @type {Integer (Int32)}
     */
    static PLUGIN_DIDNT_SET_LEVEL => 66817
}
