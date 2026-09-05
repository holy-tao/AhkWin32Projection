#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the rotation capabilities of the codec.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicrawrotationcapabilities
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICRawRotationCapabilities extends Win32Enum {

    /**
     * Rotation is not supported.
     * Native name: WICRawRotationCapabilityNotSupported
     * @type {Integer (Int32)}
     */
    static CapabilityNotSupported => 0

    /**
     * Set operations for rotation is not supported.
     * Native name: WICRawRotationCapabilityGetSupported
     * @type {Integer (Int32)}
     */
    static CapabilityGetSupported => 1

    /**
     * 90 degree rotations are supported.
     * Native name: WICRawRotationCapabilityNinetyDegreesSupported
     * @type {Integer (Int32)}
     */
    static CapabilityNinetyDegreesSupported => 2

    /**
     * All rotation angles are supported.
     * Native name: WICRawRotationCapabilityFullySupported
     * @type {Integer (Int32)}
     */
    static CapabilityFullySupported => 3
}
