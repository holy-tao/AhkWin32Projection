#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the option for embedding a font.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_FONT_EMBEDDING extends Win32Enum {

    /**
     * The embedded font is neither obfuscated nor restricted.
     * Native name: XPS_FONT_EMBEDDING_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 1

    /**
     * The embedded font is obfuscated but not restricted.
     * Native name: XPS_FONT_EMBEDDING_OBFUSCATED
     * @type {Integer (Int32)}
     */
    static OBFUSCATED => 2

    /**
     * The embedded font is obfuscated and restricted.
     * Native name: XPS_FONT_EMBEDDING_RESTRICTED
     * @type {Integer (Int32)}
     */
    static RESTRICTED => 3

    /**
     * The font is restricted but not obfuscated.
     * 
     * This value cannot be set by an application. It is set when the document being deserialized contains a restricted font that is not obfuscated. Restricted fonts should be obfuscated, so this value usually indicates an error in the application that created the XPS document being deserialized.
     * Native name: XPS_FONT_EMBEDDING_RESTRICTED_UNOBFUSCATED
     * @type {Integer (Int32)}
     */
    static RESTRICTED_UNOBFUSCATED => 4
}
