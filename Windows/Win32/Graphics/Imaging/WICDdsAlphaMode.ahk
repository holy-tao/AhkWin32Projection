#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the the meaning of pixel color component values contained in the DDS image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicddsalphamode
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICDdsAlphaMode extends Win32Enum {

    /**
     * Alpha behavior is unspecified and must be determined by the reader.
     * Native name: WICDdsAlphaModeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The alpha data is straight.
     * Native name: WICDdsAlphaModeStraight
     * @type {Integer (Int32)}
     */
    static Straight => 1

    /**
     * The alpha data is premultiplied.
     * Native name: WICDdsAlphaModePremultiplied
     * @type {Integer (Int32)}
     */
    static Premultiplied => 2

    /**
     * The alpha data is opaque (UNORM value of 1). This can be used by a compliant reader as a performance optimization. For example, blending operations can be converted to copies.
     * Native name: WICDdsAlphaModeOpaque
     * @type {Integer (Int32)}
     */
    static Opaque => 3

    /**
     * The alpha channel contains custom data that is not alpha.
     * Native name: WICDdsAlphaModeCustom
     * @type {Integer (Int32)}
     */
    static Custom => 4
}
