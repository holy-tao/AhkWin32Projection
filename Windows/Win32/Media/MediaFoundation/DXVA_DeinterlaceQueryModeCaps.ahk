#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA_VideoDesc.ahk
#Include ..\..\Graphics\Direct3D9\D3DFORMAT.ahk
#Include .\DXVA_Frequency.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_DeinterlaceQueryModeCaps extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Guid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {DXVA_VideoDesc}
     */
    VideoDesc {
        get {
            if(!this.HasProp("__VideoDesc"))
                this.__VideoDesc := DXVA_VideoDesc(16, this)
            return this.__VideoDesc
        }
    }
}
