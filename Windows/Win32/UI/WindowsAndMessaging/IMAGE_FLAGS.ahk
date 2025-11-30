#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class IMAGE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LR_CREATEDIBSECTION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LR_DEFAULTCOLOR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LR_DEFAULTSIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LR_LOADFROMFILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LR_LOADMAP3DCOLORS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LR_LOADTRANSPARENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LR_MONOCHROME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LR_SHARED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LR_VGACOLOR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LR_COPYDELETEORG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LR_COPYFROMRESOURCE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LR_COPYRETURNORG => 4
}
