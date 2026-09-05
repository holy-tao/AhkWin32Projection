#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class GPT_ATTRIBUTES extends Win32BitflagEnum {

    /**
     * Native name: GPT_ATTRIBUTE_PLATFORM_REQUIRED
     * @type {Integer (UInt64)}
     */
    static ATTRIBUTE_PLATFORM_REQUIRED => 1

    /**
     * Native name: GPT_BASIC_DATA_ATTRIBUTE_NO_DRIVE_LETTER
     * @type {Integer (UInt64)}
     */
    static BASIC_DATA_ATTRIBUTE_NO_DRIVE_LETTER => 9223372036854775808

    /**
     * Native name: GPT_BASIC_DATA_ATTRIBUTE_HIDDEN
     * @type {Integer (UInt64)}
     */
    static BASIC_DATA_ATTRIBUTE_HIDDEN => 4611686018427387904

    /**
     * Native name: GPT_BASIC_DATA_ATTRIBUTE_SHADOW_COPY
     * @type {Integer (UInt64)}
     */
    static BASIC_DATA_ATTRIBUTE_SHADOW_COPY => 2305843009213693952

    /**
     * Native name: GPT_BASIC_DATA_ATTRIBUTE_READ_ONLY
     * @type {Integer (UInt64)}
     */
    static BASIC_DATA_ATTRIBUTE_READ_ONLY => 1152921504606846976
}
