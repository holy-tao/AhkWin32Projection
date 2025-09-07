#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how ink is persisted.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkpersistenceformat
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkPersistenceFormat{

    /**
     * Ink is persisted using ink serialized format (ISF).
 * 
 * This is the most compact persistent representation of ink. It can be embedded within a binary document format or placed directly on the Clipboard.
     * @type {Integer (Int32)}
     */
    static IPF_InkSerializedFormat => 0

    /**
     * Ink is persisted by encoding the ISF as a base64 stream.
 * 
 * This format is provided so that ink can be encoded directly in an Extensible Markup Language (XML) or HTML file.
     * @type {Integer (Int32)}
     */
    static IPF_Base64InkSerializedFormat => 1

    /**
     * Ink is persisted by using a Graphics Interchange Format (GIF) file that contains ISF as metadata that is embedded within the file.
 * 
 * This allows ink to be viewed in applications that are not ink-enabled and maintain its full ink fidelity when it returns to an ink-enabled application. This format is ideal when transporting ink content within an HTML file and making it usable by ink-enabled and ink-unaware applications.
     * @type {Integer (Int32)}
     */
    static IPF_GIF => 2

    /**
     * Ink is persisted by using a base64 encoded fortified.
 * 
 * This GIF format is provided when ink is to be encoded directly in an XML or HTML file with later conversion into an image. A possible use of this would be in an XML format that is generated to contain all ink information and used as a way to generate HTML through Extensible Stylesheet Language Transformations (XSLT).
     * @type {Integer (Int32)}
     */
    static IPF_Base64GIF => 3
}
