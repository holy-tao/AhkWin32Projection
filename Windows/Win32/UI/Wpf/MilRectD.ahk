#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/ns-mileffects-milrectd
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class MilRectD extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Float}
     */
    left {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * @type {Float}
     */
    top {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {Float}
     */
    right {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {Float}
     */
    bottom {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }
}
