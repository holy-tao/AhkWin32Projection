#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the identifiers of the metadata items in an 8BIM IPTC block.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wic8bimiptcproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WIC8BIMIptcProperties{

    /**
     * [VT_LPSTR] A name that identifies the 8BIM block.
     * @type {Integer (Int32)}
     */
    static WIC8BIMIptcPString => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WIC8BIMIptcEmbeddedIPTC => 1
}
