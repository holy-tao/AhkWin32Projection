#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class EXpsFontRestriction extends Win32Enum {

    /**
     * Native name: Xps_Restricted_Font_Installable
     * @type {Integer (Int32)}
     */
    static Restricted_Font_Installable => 0

    /**
     * Native name: Xps_Restricted_Font_NoEmbedding
     * @type {Integer (Int32)}
     */
    static Restricted_Font_NoEmbedding => 2

    /**
     * Native name: Xps_Restricted_Font_PreviewPrint
     * @type {Integer (Int32)}
     */
    static Restricted_Font_PreviewPrint => 4

    /**
     * Native name: Xps_Restricted_Font_Editable
     * @type {Integer (Int32)}
     */
    static Restricted_Font_Editable => 8
}
