#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_DetailFilterTech extends Win32Enum {

    /**
     * Native name: DXVA2_DetailFilterTech_Unsupported
     * @type {Integer (Int32)}
     */
    static Unsupported => 0

    /**
     * Native name: DXVA2_DetailFilterTech_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Native name: DXVA2_DetailFilterTech_Edge
     * @type {Integer (Int32)}
     */
    static Edge => 2

    /**
     * Native name: DXVA2_DetailFilterTech_Sharpening
     * @type {Integer (Int32)}
     */
    static Sharpening => 4

    /**
     * Native name: DXVA2_DetailFilterTech_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 7
}
