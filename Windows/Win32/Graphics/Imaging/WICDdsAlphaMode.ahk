#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the the meaning of pixel color component values contained in the DDS image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicddsalphamode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICDdsAlphaMode{

    /**
     * Alpha behavior is unspecified and must be determined by the reader.
     * @type {Integer (Int32)}
     */
    static WICDdsAlphaModeUnknown => 0

    /**
     * The alpha data is straight.
     * @type {Integer (Int32)}
     */
    static WICDdsAlphaModeStraight => 1

    /**
     * The alpha data is premultiplied.
     * @type {Integer (Int32)}
     */
    static WICDdsAlphaModePremultiplied => 2

    /**
     * The alpha data is opaque (UNORM value of 1). This can be used by a compliant reader as a performance optimization. For example, blending operations can be converted to copies.
     * @type {Integer (Int32)}
     */
    static WICDdsAlphaModeOpaque => 3

    /**
     * The alpha channel contains custom data that is not alpha.
     * @type {Integer (Int32)}
     */
    static WICDdsAlphaModeCustom => 4
}
