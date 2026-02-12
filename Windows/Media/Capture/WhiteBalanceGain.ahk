#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents the red, green, and blue values of a white balance gain setting.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.whitebalancegain
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class WhiteBalanceGain extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The red value of a white balance gain setting.
     * @type {Float}
     */
    R {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The green value of a white balance gain setting.
     * @type {Float}
     */
    G {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The blue value of a white balance gain setting.
     * @type {Float}
     */
    B {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }
}
