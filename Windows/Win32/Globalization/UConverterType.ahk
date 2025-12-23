#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UConverterType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UNSUPPORTED_CONVERTER => -1

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_SBCS => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_DBCS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_MBCS => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LATIN_1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UTF8 => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UTF16_BigEndian => 5

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UTF16_LittleEndian => 6

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UTF32_BigEndian => 7

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UTF32_LittleEndian => 8

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_EBCDIC_STATEFUL => 9

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_ISO_2022 => 10

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_1 => 11

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_2 => 12

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_3 => 13

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_4 => 14

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_5 => 15

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_6 => 16

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_8 => 17

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_11 => 18

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_16 => 19

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_17 => 20

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_18 => 21

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_19 => 22

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_LMBCS_LAST => 22

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_HZ => 23

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_SCSU => 24

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_ISCII => 25

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_US_ASCII => 26

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UTF7 => 27

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_BOCU1 => 28

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UTF16 => 29

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UTF32 => 30

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_CESU8 => 31

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_IMAP_MAILBOX => 32

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_COMPOUND_TEXT => 33

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_NUMBER_OF_SUPPORTED_CONVERTER_TYPES => 34
}
