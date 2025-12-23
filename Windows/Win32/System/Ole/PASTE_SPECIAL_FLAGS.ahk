#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PASTE_SPECIAL_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_SHOWHELP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_SELECTPASTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_SELECTPASTELINK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_CHECKDISPLAYASICON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_DISABLEDISPLAYASICON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_HIDECHANGEICON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_STAYONCLIPBOARDCHANGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_NOREFRESHDATAOBJECT => 128
}
