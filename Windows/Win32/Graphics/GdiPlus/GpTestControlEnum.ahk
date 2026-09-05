#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class GpTestControlEnum extends Win32Enum {

    /**
     * Native name: TestControlForceBilinear
     * @type {Integer (Int32)}
     */
    static ForceBilinear => 0

    /**
     * Native name: TestControlNoICM
     * @type {Integer (Int32)}
     */
    static NoICM => 1

    /**
     * Native name: TestControlGetBuildNumber
     * @type {Integer (Int32)}
     */
    static GetBuildNumber => 2
}
