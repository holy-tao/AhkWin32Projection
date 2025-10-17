#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_MOVE_RECT extends Win32Struct
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
