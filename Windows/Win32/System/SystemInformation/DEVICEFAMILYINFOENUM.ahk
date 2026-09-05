#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
class DEVICEFAMILYINFOENUM extends Win32Enum {

    /**
     * Native name: DEVICEFAMILYINFOENUM_UAP
     * @type {Integer (UInt32)}
     */
    static UAP => 0

    /**
     * Native name: DEVICEFAMILYINFOENUM_WINDOWS_8X
     * @type {Integer (UInt32)}
     */
    static WINDOWS_8X => 1

    /**
     * Native name: DEVICEFAMILYINFOENUM_WINDOWS_PHONE_8X
     * @type {Integer (UInt32)}
     */
    static WINDOWS_PHONE_8X => 2

    /**
     * Native name: DEVICEFAMILYINFOENUM_DESKTOP
     * @type {Integer (UInt32)}
     */
    static DESKTOP => 3

    /**
     * Native name: DEVICEFAMILYINFOENUM_MOBILE
     * @type {Integer (UInt32)}
     */
    static MOBILE => 4

    /**
     * Native name: DEVICEFAMILYINFOENUM_XBOX
     * @type {Integer (UInt32)}
     */
    static XBOX => 5

    /**
     * Native name: DEVICEFAMILYINFOENUM_TEAM
     * @type {Integer (UInt32)}
     */
    static TEAM => 6

    /**
     * Native name: DEVICEFAMILYINFOENUM_IOT
     * @type {Integer (UInt32)}
     */
    static IOT => 7

    /**
     * Native name: DEVICEFAMILYINFOENUM_IOT_HEADLESS
     * @type {Integer (UInt32)}
     */
    static IOT_HEADLESS => 8

    /**
     * Native name: DEVICEFAMILYINFOENUM_SERVER
     * @type {Integer (UInt32)}
     */
    static SERVER => 9

    /**
     * Native name: DEVICEFAMILYINFOENUM_HOLOGRAPHIC
     * @type {Integer (UInt32)}
     */
    static HOLOGRAPHIC => 10

    /**
     * Native name: DEVICEFAMILYINFOENUM_XBOXSRA
     * @type {Integer (UInt32)}
     */
    static XBOXSRA => 11

    /**
     * Native name: DEVICEFAMILYINFOENUM_XBOXERA
     * @type {Integer (UInt32)}
     */
    static XBOXERA => 12

    /**
     * Native name: DEVICEFAMILYINFOENUM_SERVER_NANO
     * @type {Integer (UInt32)}
     */
    static SERVER_NANO => 13

    /**
     * Native name: DEVICEFAMILYINFOENUM_8828080
     * @type {Integer (UInt32)}
     */
    static 8828080 => 14

    /**
     * Native name: DEVICEFAMILYINFOENUM_7067329
     * @type {Integer (UInt32)}
     */
    static 7067329 => 15

    /**
     * Native name: DEVICEFAMILYINFOENUM_WINDOWS_CORE
     * @type {Integer (UInt32)}
     */
    static WINDOWS_CORE => 16

    /**
     * Native name: DEVICEFAMILYINFOENUM_WINDOWS_CORE_HEADLESS
     * @type {Integer (UInt32)}
     */
    static WINDOWS_CORE_HEADLESS => 17

    /**
     * Native name: DEVICEFAMILYINFOENUM_MAX
     * @type {Integer (UInt32)}
     */
    static MAX => 17
}
