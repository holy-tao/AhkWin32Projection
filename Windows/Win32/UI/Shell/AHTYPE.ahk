#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class AHTYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_USER_APPLICATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_ANY_APPLICATION => 16

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_MACHINEDEFAULT => 32

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_PROGID => 64

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_APPLICATION => 128

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_CLASS_APPLICATION => 256

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_ANY_PROGID => 512
}
