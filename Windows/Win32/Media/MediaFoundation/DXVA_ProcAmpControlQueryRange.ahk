#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA_ProcAmpControlProp.ahk
#Include .\DXVA_VideoDesc.ahk
#Include ..\..\Graphics\Direct3D9\D3DFORMAT.ahk
#Include .\DXVA_Frequency.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_ProcAmpControlQueryRange extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DXVA_ProcAmpControlProp}
     */
    ProcAmpControlProp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {DXVA_VideoDesc}
     */
    VideoDesc {
        get {
            if(!this.HasProp("__VideoDesc"))
                this.__VideoDesc := DXVA_VideoDesc(8, this)
            return this.__VideoDesc
        }
    }
}
