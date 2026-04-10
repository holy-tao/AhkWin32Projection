#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_GENERAL_ERROR_CODE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_GENERAL_ERROR_PAGE_FAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_GENERAL_ERROR_INVALID_INSTRUCTION => 1
}
