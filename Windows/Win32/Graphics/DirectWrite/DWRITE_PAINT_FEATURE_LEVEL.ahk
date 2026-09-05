#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PAINT_FEATURE_LEVEL extends Win32Enum {

    /**
     * Native name: DWRITE_PAINT_FEATURE_LEVEL_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DWRITE_PAINT_FEATURE_LEVEL_COLR_V0
     * @type {Integer (Int32)}
     */
    static COLR_V0 => 1

    /**
     * Native name: DWRITE_PAINT_FEATURE_LEVEL_COLR_V1
     * @type {Integer (Int32)}
     */
    static COLR_V1 => 2
}
