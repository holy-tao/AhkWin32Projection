#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether the content of the XPS OM will be interleaved when it is written to a file or a stream.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_interleaving
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_INTERLEAVING{

    /**
     * The content of the XPS OM is not interleaved. The document parts are written as complete parts.
     * @type {Integer (Int32)}
     */
    static XPS_INTERLEAVING_OFF => 1

    /**
     * The content of the XPS OM is interleaved. The document parts are divided into smaller pieces before they are written.
     * @type {Integer (Int32)}
     */
    static XPS_INTERLEAVING_ON => 2
}
