#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the rotation capabilities of the codec.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicrawrotationcapabilities
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICRawRotationCapabilities{

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
