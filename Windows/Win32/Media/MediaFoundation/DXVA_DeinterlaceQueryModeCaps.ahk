#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA_Frequency.ahk
#Include .\DXVA_VideoDesc.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_DeinterlaceQueryModeCaps extends Win32Struct
{
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
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {DXVA_VideoDesc}
     */
    VideoDesc{
        get {
            if(!this.HasProp("__VideoDesc"))
                this.__VideoDesc := DXVA_VideoDesc(this.ptr + 16)
            return this.__VideoDesc
        }
    }
}
