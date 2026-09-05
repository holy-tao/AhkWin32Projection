#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_POLICY_ENTRY_TYPE extends Win32Enum {

    /**
     * Native name: ImagePolicyEntryTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: ImagePolicyEntryTypeBool
     * @type {Integer (Int32)}
     */
    static Bool => 1

    /**
     * Native name: ImagePolicyEntryTypeInt8
     * @type {Integer (Int32)}
     */
    static Int8 => 2

    /**
     * Native name: ImagePolicyEntryTypeUInt8
     * @type {Integer (Int32)}
     */
    static TypeUInt8 => 3

    /**
     * Native name: ImagePolicyEntryTypeInt16
     * @type {Integer (Int32)}
     */
    static Int16 => 4

    /**
     * Native name: ImagePolicyEntryTypeUInt16
     * @type {Integer (Int32)}
     */
    static TypeUInt16 => 5

    /**
     * Native name: ImagePolicyEntryTypeInt32
     * @type {Integer (Int32)}
     */
    static Int32 => 6

    /**
     * Native name: ImagePolicyEntryTypeUInt32
     * @type {Integer (Int32)}
     */
    static TypeUInt32 => 7

    /**
     * Native name: ImagePolicyEntryTypeInt64
     * @type {Integer (Int32)}
     */
    static Int64 => 8

    /**
     * Native name: ImagePolicyEntryTypeUInt64
     * @type {Integer (Int32)}
     */
    static TypeUInt64 => 9

    /**
     * Native name: ImagePolicyEntryTypeAnsiString
     * @type {Integer (Int32)}
     */
    static AnsiString => 10

    /**
     * Native name: ImagePolicyEntryTypeUnicodeString
     * @type {Integer (Int32)}
     */
    static UnicodeString => 11

    /**
     * Native name: ImagePolicyEntryTypeOverride
     * @type {Integer (Int32)}
     */
    static Override => 12

    /**
     * Native name: ImagePolicyEntryTypeMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 13
}
