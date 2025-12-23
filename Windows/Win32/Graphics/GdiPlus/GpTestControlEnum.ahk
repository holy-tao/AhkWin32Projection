#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class GpTestControlEnum extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TestControlForceBilinear => 0

    /**
     * @type {Integer (Int32)}
     */
    static TestControlNoICM => 1

    /**
     * @type {Integer (Int32)}
     */
    static TestControlGetBuildNumber => 2
}
