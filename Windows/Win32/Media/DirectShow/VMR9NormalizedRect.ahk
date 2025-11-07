#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VMR9NormalizedRect structure is used with the VMR-9 filter in mixing operations to specify or retrieve the location of a video rectangle in composition space.
 * @remarks
 * 
 * This structure is used in methods involving "composition space," which refers to the visible video rectangle, as well as the "offscreen" space necessary to contain rectangles from secondary streams. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/using-the-video-mixing-renderer">Using the Video Mixing Renderer</a> for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ns-vmr9-vmr9normalizedrect
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9NormalizedRect extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies left.
     * @type {Float}
     */
    left {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Specifies top.
     * @type {Float}
     */
    top {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Specifies right.
     * @type {Float}
     */
    right {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Specifies bottom.
     * @type {Float}
     */
    bottom {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
