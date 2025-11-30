#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the capability support of a raw image.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicrawcapabilities
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICRawCapabilities extends Win32Enum{

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
