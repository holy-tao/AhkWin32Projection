#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class DEVICEFAMILYINFOENUM extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_UAP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_WINDOWS_8X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_WINDOWS_PHONE_8X => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_DESKTOP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_MOBILE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_XBOX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_TEAM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_IOT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_IOT_HEADLESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_SERVER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_HOLOGRAPHIC => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_XBOXSRA => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_XBOXERA => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_SERVER_NANO => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_8828080 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_7067329 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_WINDOWS_CORE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_WINDOWS_CORE_HEADLESS => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEFAMILYINFOENUM_MAX => 17
}
