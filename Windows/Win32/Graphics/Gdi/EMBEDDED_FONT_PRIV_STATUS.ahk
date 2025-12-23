#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMBEDDED_FONT_PRIV_STATUS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static EMBED_PREVIEWPRINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMBED_EDITABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EMBED_INSTALLABLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EMBED_NOEMBEDDING => 4
}
