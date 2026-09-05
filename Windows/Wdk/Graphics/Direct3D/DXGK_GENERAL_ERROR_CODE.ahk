#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_GENERAL_ERROR_CODE extends Win32Enum {

    /**
     * Native name: DXGK_GENERAL_ERROR_PAGE_FAULT
     * @type {Integer (Int32)}
     */
    static PAGE_FAULT => 0

    /**
     * Native name: DXGK_GENERAL_ERROR_INVALID_INSTRUCTION
     * @type {Integer (Int32)}
     */
    static INVALID_INSTRUCTION => 1
}
