#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines animation parameters for the BP_PAINTPARAMS structure used by BeginBufferedPaint.
 * @see https://docs.microsoft.com/windows/win32/api//uxtheme/ns-uxtheme-bp_animationparams
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BP_ANIMATIONPARAMS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Reserved.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ne-uxtheme-bp_animationstyle">BP_ANIMATIONSTYLE</a></b>
     * 
     * Animation style.
     * @type {Integer}
     */
    style {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Length of the animation, in milliseconds.
     * @type {Integer}
     */
    dwDuration {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 16
    }
}
