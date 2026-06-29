#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the identifiers of the metadata items in an 8BIM IPTC digest metadata block.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wic8bimiptcdigestproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WIC8BIMIptcDigestProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
