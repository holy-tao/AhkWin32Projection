#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DIRTYRECT_INFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    FrameNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumDirtyRects {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {RECT}
     */
    DirtyRects {
        get {
            if(!this.HasProp("__DirtyRectsProxyArray"))
                this.__DirtyRectsProxyArray := Win32FixedArray(this.ptr + 8, 1, RECT, "")
            return this.__DirtyRectsProxyArray
        }
    }
}
