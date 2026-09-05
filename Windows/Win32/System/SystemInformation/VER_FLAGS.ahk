#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
class VER_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: VER_MINORVERSION
     * @type {Integer (UInt32)}
     */
    static MINORVERSION => 1

    /**
     * Native name: VER_MAJORVERSION
     * @type {Integer (UInt32)}
     */
    static MAJORVERSION => 2

    /**
     * Native name: VER_BUILDNUMBER
     * @type {Integer (UInt32)}
     */
    static BUILDNUMBER => 4

    /**
     * Native name: VER_PLATFORMID
     * @type {Integer (UInt32)}
     */
    static PLATFORMID => 8

    /**
     * Native name: VER_SERVICEPACKMINOR
     * @type {Integer (UInt32)}
     */
    static SERVICEPACKMINOR => 16

    /**
     * Native name: VER_SERVICEPACKMAJOR
     * @type {Integer (UInt32)}
     */
    static SERVICEPACKMAJOR => 32

    /**
     * Native name: VER_SUITENAME
     * @type {Integer (UInt32)}
     */
    static SUITENAME => 64

    /**
     * Native name: VER_PRODUCT_TYPE
     * @type {Integer (UInt32)}
     */
    static PRODUCT_TYPE => 128
}
