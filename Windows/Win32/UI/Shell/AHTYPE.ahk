#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class AHTYPE extends Win32BitflagEnum {

    /**
     * Native name: AHTYPE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: AHTYPE_USER_APPLICATION
     * @type {Integer (Int32)}
     */
    static USER_APPLICATION => 8

    /**
     * Native name: AHTYPE_ANY_APPLICATION
     * @type {Integer (Int32)}
     */
    static ANY_APPLICATION => 16

    /**
     * Native name: AHTYPE_MACHINEDEFAULT
     * @type {Integer (Int32)}
     */
    static MACHINEDEFAULT => 32

    /**
     * Native name: AHTYPE_PROGID
     * @type {Integer (Int32)}
     */
    static PROGID => 64

    /**
     * Native name: AHTYPE_APPLICATION
     * @type {Integer (Int32)}
     */
    static APPLICATION => 128

    /**
     * Native name: AHTYPE_CLASS_APPLICATION
     * @type {Integer (Int32)}
     */
    static CLASS_APPLICATION => 256

    /**
     * Native name: AHTYPE_ANY_PROGID
     * @type {Integer (Int32)}
     */
    static ANY_PROGID => 512
}
