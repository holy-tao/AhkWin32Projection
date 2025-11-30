#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class VER_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static VER_MINORVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VER_MAJORVERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VER_BUILDNUMBER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PLATFORMID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SERVICEPACKMINOR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SERVICEPACKMAJOR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITENAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PRODUCT_TYPE => 128
}
