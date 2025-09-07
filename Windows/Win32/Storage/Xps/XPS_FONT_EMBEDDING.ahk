#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the option for embedding a font.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_FONT_EMBEDDING{

    /**
     * The embedded font is neither obfuscated nor restricted.
     * @type {Integer (Int32)}
     */
    static XPS_FONT_EMBEDDING_NORMAL => 1

    /**
     * The embedded font is obfuscated but not restricted.
     * @type {Integer (Int32)}
     */
    static XPS_FONT_EMBEDDING_OBFUSCATED => 2

    /**
     * The embedded font is obfuscated and restricted.
     * @type {Integer (Int32)}
     */
    static XPS_FONT_EMBEDDING_RESTRICTED => 3

    /**
     * The font is restricted but not obfuscated.
 * 
 * This value cannot be set by an application. It is set when the document being deserialized contains a restricted font that is not obfuscated. Restricted fonts should be obfuscated, so this value usually indicates an error in the application that created the XPS document being deserialized.
     * @type {Integer (Int32)}
     */
    static XPS_FONT_EMBEDDING_RESTRICTED_UNOBFUSCATED => 4
}
