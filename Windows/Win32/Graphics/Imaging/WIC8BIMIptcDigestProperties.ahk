#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the identifiers of the metadata items in an 8BIM IPTC digest metadata block.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wic8bimiptcdigestproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WIC8BIMIptcDigestProperties extends Win32Enum{

    /**
     * [VT_LPSTR] A name that identifies the 8BIM block.
     * @type {Integer (Int32)}
     */
    static WIC8BIMIptcDigestPString => 1

    /**
     * [VT_BLOB] The embedded IPTC digest value.
     * @type {Integer (Int32)}
     */
    static WIC8BIMIptcDigestIptcDigest => 2
}
