#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKVGPU_ESCAPE_INITIALIZE extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    VmGuid {
        get {
            if(!this.HasProp("__VmGuid"))
                this.__VmGuid := Guid(8, this)
            return this.__VmGuid
        }
    }
}
