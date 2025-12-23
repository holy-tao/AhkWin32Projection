#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MLCONVCHAR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_AUTODETECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_ENTITIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_NCR_ENTITIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_NAME_ENTITIZE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_USEDEFCHAR => 8

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_NOBESTFITCHARS => 16

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_DETECTJPN => 32
}
