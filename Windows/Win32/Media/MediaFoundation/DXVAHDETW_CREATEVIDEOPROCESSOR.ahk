#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVAHDETW_CREATEVIDEOPROCESSOR extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    pObject {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    pD3D9Ex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    VPGuid {
        get {
            if(!this.HasProp("__VPGuid"))
                this.__VPGuid := Guid(16, this)
            return this.__VPGuid
        }
    }
}
