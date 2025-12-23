#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class GPT_ATTRIBUTES extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_ATTRIBUTE_PLATFORM_REQUIRED => 1

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_NO_DRIVE_LETTER => 9223372036854775808

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_HIDDEN => 4611686018427387904

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_SHADOW_COPY => 2305843009213693952

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_READ_ONLY => 1152921504606846976
}
