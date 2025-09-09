#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DIRTYRECT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
     * @type {Array<RECT>}
     */
    DirtyRects{
        get {
            if(!this.HasProp("__DirtyRectsProxyArray"))
                this.__DirtyRectsProxyArray := Win32FixedArray(this.ptr + 8, 1, RECT, "")
            return this.__DirtyRectsProxyArray
        }
    }
}
