#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WMIQ_LANGUAGE_FEATURES extends Win32Enum {

    /**
     * Native name: WMIQ_LF1_BASIC_SELECT
     * @type {Integer (Int32)}
     */
    static LF1_BASIC_SELECT => 1

    /**
     * Native name: WMIQ_LF2_CLASS_NAME_IN_QUERY
     * @type {Integer (Int32)}
     */
    static LF2_CLASS_NAME_IN_QUERY => 2

    /**
     * Native name: WMIQ_LF3_STRING_CASE_FUNCTIONS
     * @type {Integer (Int32)}
     */
    static LF3_STRING_CASE_FUNCTIONS => 3

    /**
     * Native name: WMIQ_LF4_PROP_TO_PROP_TESTS
     * @type {Integer (Int32)}
     */
    static LF4_PROP_TO_PROP_TESTS => 4

    /**
     * Native name: WMIQ_LF5_COUNT_STAR
     * @type {Integer (Int32)}
     */
    static LF5_COUNT_STAR => 5

    /**
     * Native name: WMIQ_LF6_ORDER_BY
     * @type {Integer (Int32)}
     */
    static LF6_ORDER_BY => 6

    /**
     * Native name: WMIQ_LF7_DISTINCT
     * @type {Integer (Int32)}
     */
    static LF7_DISTINCT => 7

    /**
     * Native name: WMIQ_LF8_ISA
     * @type {Integer (Int32)}
     */
    static LF8_ISA => 8

    /**
     * Native name: WMIQ_LF9_THIS
     * @type {Integer (Int32)}
     */
    static LF9_THIS => 9

    /**
     * Native name: WMIQ_LF10_COMPEX_SUBEXPRESSIONS
     * @type {Integer (Int32)}
     */
    static LF10_COMPEX_SUBEXPRESSIONS => 10

    /**
     * Native name: WMIQ_LF11_ALIASING
     * @type {Integer (Int32)}
     */
    static LF11_ALIASING => 11

    /**
     * Native name: WMIQ_LF12_GROUP_BY_HAVING
     * @type {Integer (Int32)}
     */
    static LF12_GROUP_BY_HAVING => 12

    /**
     * Native name: WMIQ_LF13_WMI_WITHIN
     * @type {Integer (Int32)}
     */
    static LF13_WMI_WITHIN => 13

    /**
     * Native name: WMIQ_LF14_SQL_WRITE_OPERATIONS
     * @type {Integer (Int32)}
     */
    static LF14_SQL_WRITE_OPERATIONS => 14

    /**
     * Native name: WMIQ_LF15_GO
     * @type {Integer (Int32)}
     */
    static LF15_GO => 15

    /**
     * Native name: WMIQ_LF16_SINGLE_LEVEL_TRANSACTIONS
     * @type {Integer (Int32)}
     */
    static LF16_SINGLE_LEVEL_TRANSACTIONS => 16

    /**
     * Native name: WMIQ_LF17_QUALIFIED_NAMES
     * @type {Integer (Int32)}
     */
    static LF17_QUALIFIED_NAMES => 17

    /**
     * Native name: WMIQ_LF18_ASSOCIATONS
     * @type {Integer (Int32)}
     */
    static LF18_ASSOCIATONS => 18

    /**
     * Native name: WMIQ_LF19_SYSTEM_PROPERTIES
     * @type {Integer (Int32)}
     */
    static LF19_SYSTEM_PROPERTIES => 19

    /**
     * Native name: WMIQ_LF20_EXTENDED_SYSTEM_PROPERTIES
     * @type {Integer (Int32)}
     */
    static LF20_EXTENDED_SYSTEM_PROPERTIES => 20

    /**
     * Native name: WMIQ_LF21_SQL89_JOINS
     * @type {Integer (Int32)}
     */
    static LF21_SQL89_JOINS => 21

    /**
     * Native name: WMIQ_LF22_SQL92_JOINS
     * @type {Integer (Int32)}
     */
    static LF22_SQL92_JOINS => 22

    /**
     * Native name: WMIQ_LF23_SUBSELECTS
     * @type {Integer (Int32)}
     */
    static LF23_SUBSELECTS => 23

    /**
     * Native name: WMIQ_LF24_UMI_EXTENSIONS
     * @type {Integer (Int32)}
     */
    static LF24_UMI_EXTENSIONS => 24

    /**
     * Native name: WMIQ_LF25_DATEPART
     * @type {Integer (Int32)}
     */
    static LF25_DATEPART => 25

    /**
     * Native name: WMIQ_LF26_LIKE
     * @type {Integer (Int32)}
     */
    static LF26_LIKE => 26

    /**
     * Native name: WMIQ_LF27_CIM_TEMPORAL_CONSTRUCTS
     * @type {Integer (Int32)}
     */
    static LF27_CIM_TEMPORAL_CONSTRUCTS => 27

    /**
     * Native name: WMIQ_LF28_STANDARD_AGGREGATES
     * @type {Integer (Int32)}
     */
    static LF28_STANDARD_AGGREGATES => 28

    /**
     * Native name: WMIQ_LF29_MULTI_LEVEL_ORDER_BY
     * @type {Integer (Int32)}
     */
    static LF29_MULTI_LEVEL_ORDER_BY => 29

    /**
     * Native name: WMIQ_LF30_WMI_PRAGMAS
     * @type {Integer (Int32)}
     */
    static LF30_WMI_PRAGMAS => 30

    /**
     * Native name: WMIQ_LF31_QUALIFIER_TESTS
     * @type {Integer (Int32)}
     */
    static LF31_QUALIFIER_TESTS => 31

    /**
     * Native name: WMIQ_LF32_SP_EXECUTE
     * @type {Integer (Int32)}
     */
    static LF32_SP_EXECUTE => 32

    /**
     * Native name: WMIQ_LF33_ARRAY_ACCESS
     * @type {Integer (Int32)}
     */
    static LF33_ARRAY_ACCESS => 33

    /**
     * Native name: WMIQ_LF34_UNION
     * @type {Integer (Int32)}
     */
    static LF34_UNION => 34

    /**
     * Native name: WMIQ_LF35_COMPLEX_SELECT_TARGET
     * @type {Integer (Int32)}
     */
    static LF35_COMPLEX_SELECT_TARGET => 35

    /**
     * Native name: WMIQ_LF36_REFERENCE_TESTS
     * @type {Integer (Int32)}
     */
    static LF36_REFERENCE_TESTS => 36

    /**
     * Native name: WMIQ_LF37_SELECT_INTO
     * @type {Integer (Int32)}
     */
    static LF37_SELECT_INTO => 37

    /**
     * Native name: WMIQ_LF38_BASIC_DATETIME_TESTS
     * @type {Integer (Int32)}
     */
    static LF38_BASIC_DATETIME_TESTS => 38

    /**
     * Native name: WMIQ_LF39_COUNT_COLUMN
     * @type {Integer (Int32)}
     */
    static LF39_COUNT_COLUMN => 39

    /**
     * Native name: WMIQ_LF40_BETWEEN
     * @type {Integer (Int32)}
     */
    static LF40_BETWEEN => 40

    /**
     * Native name: WMIQ_LF_LAST
     * @type {Integer (Int32)}
     */
    static LF_LAST => 40
}
