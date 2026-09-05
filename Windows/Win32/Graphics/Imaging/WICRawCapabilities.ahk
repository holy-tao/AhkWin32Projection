#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the capability support of a raw image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicrawcapabilities
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICRawCapabilities extends Win32Enum {

    /**
     * The capability is not supported.
     * Native name: WICRawCapabilityNotSupported
     * @type {Integer (Int32)}
     */
    static CapabilityNotSupported => 0

    /**
     * The capability supports only get operations.
     * Native name: WICRawCapabilityGetSupported
     * @type {Integer (Int32)}
     */
    static CapabilityGetSupported => 1

    /**
     * The capability supports get and set operations.
     * Native name: WICRawCapabilityFullySupported
     * @type {Integer (Int32)}
     */
    static CapabilityFullySupported => 2
}
