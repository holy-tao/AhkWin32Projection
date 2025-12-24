#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_MOVE_RECT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {POINT}
     */
    SourcePoint{
        get {
            if(!this.HasProp("__SourcePoint"))
                this.__SourcePoint := POINT(0, this)
            return this.__SourcePoint
        }
    }

    /**
     * @type {RECT}
     */
    DestRect{
        get {
            if(!this.HasProp("__DestRect"))
                this.__DestRect := RECT(8, this)
            return this.__DestRect
        }
    }
}
