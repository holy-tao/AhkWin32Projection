#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\MOVE_RECT.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MOVEREGION_INFO extends Win32Struct
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
    NumMoveRegions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<MOVE_RECT>}
     */
    MoveRegions{
        get {
            if(!this.HasProp("__MoveRegionsProxyArray"))
                this.__MoveRegionsProxyArray := Win32FixedArray(this.ptr + 8, 1, MOVE_RECT, "")
            return this.__MoveRegionsProxyArray
        }
    }
}
