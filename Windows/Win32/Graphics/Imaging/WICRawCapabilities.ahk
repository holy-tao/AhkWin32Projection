#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the capability support of a raw image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicrawcapabilities
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICRawCapabilities {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The capability is not supported.
     * @type {Integer (Int32)}
     */
    static WICRawCapabilityNotSupported => 0

    /**
     * The capability supports only get operations.
     * @type {Integer (Int32)}
     */
    static WICRawCapabilityGetSupported => 1

    /**
     * The capability supports get and set operations.
     * @type {Integer (Int32)}
     */
    static WICRawCapabilityFullySupported => 2
}
