#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the identifiers of the metadata items in an 8BIM IPTC block.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wic8bimiptcproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WIC8BIMIptcProperties {
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
    static WIC8BIMIptcPString => 0

    /**
     * @type {Integer (Int32)}
     */
    static WIC8BIMIptcEmbeddedIPTC => 1
}
