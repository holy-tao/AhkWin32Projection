#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class LOAD_PICTURE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LP_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LP_MONOCHROME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LP_VGACOLOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LP_COLOR => 4
}
