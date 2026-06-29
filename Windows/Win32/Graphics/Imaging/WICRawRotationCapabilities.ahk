#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the rotation capabilities of the codec.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicrawrotationcapabilities
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICRawRotationCapabilities {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Rotation is not supported.
     * @type {Integer (Int32)}
     */
    static WICRawRotationCapabilityNotSupported => 0

    /**
     * Set operations for rotation is not supported.
     * @type {Integer (Int32)}
     */
    static WICRawRotationCapabilityGetSupported => 1

    /**
     * 90 degree rotations are supported.
     * @type {Integer (Int32)}
     */
    static WICRawRotationCapabilityNinetyDegreesSupported => 2

    /**
     * All rotation angles are supported.
     * @type {Integer (Int32)}
     */
    static WICRawRotationCapabilityFullySupported => 3
}
