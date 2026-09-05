#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the inverse telecine (IVTC) capabilities of a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_itelecine_caps
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVAHD_ITELECINE_CAPS extends Win32Enum {

    /**
     * The video processor can reverse 3:2 pulldown.
     * Native name: DXVAHD_ITELECINE_CAPS_32
     * @type {Integer (Int32)}
     */
    static 32 => 1

    /**
     * The video processor can reverse 2:2 pulldown.
     * Native name: DXVAHD_ITELECINE_CAPS_22
     * @type {Integer (Int32)}
     */
    static 22 => 2

    /**
     * The video processor can reverse 2:2:2:4 pulldown.
     * Native name: DXVAHD_ITELECINE_CAPS_2224
     * @type {Integer (Int32)}
     */
    static 2224 => 4

    /**
     * The video processor can reverse 2:3:3:2 pulldown.
     * Native name: DXVAHD_ITELECINE_CAPS_2332
     * @type {Integer (Int32)}
     */
    static 2332 => 8

    /**
     * The video processor can reverse 3:2:3:2:2 pulldown.
     * Native name: DXVAHD_ITELECINE_CAPS_32322
     * @type {Integer (Int32)}
     */
    static 32322 => 16

    /**
     * The video processor can reverse 5:5 pulldown.
     * Native name: DXVAHD_ITELECINE_CAPS_55
     * @type {Integer (Int32)}
     */
    static 55 => 32

    /**
     * The video processor can reverse 6:4 pulldown.
     * Native name: DXVAHD_ITELECINE_CAPS_64
     * @type {Integer (Int32)}
     */
    static 64 => 64

    /**
     * The video processor can reverse 8:7 pulldown.
     * Native name: DXVAHD_ITELECINE_CAPS_87
     * @type {Integer (Int32)}
     */
    static 87 => 128

    /**
     * The video processor can reverse 2:2:2:2:2:2:2:2:2:2:2:3 pulldown.
     * Native name: DXVAHD_ITELECINE_CAPS_222222222223
     * @type {Integer (Int32)}
     */
    static 222222222223 => 256

    /**
     * The video processor can reverse other telecine modes not listed here.
     * Native name: DXVAHD_ITELECINE_CAPS_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => -2147483648
}
