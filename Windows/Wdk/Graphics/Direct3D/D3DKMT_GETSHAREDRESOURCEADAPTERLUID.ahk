#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_GETSHAREDRESOURCEADAPTERLUID extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    hGlobalShare {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    hNtHandle {
        get {
            if(!this.HasProp("__hNtHandle"))
                this.__hNtHandle := HANDLE(8, this)
            return this.__hNtHandle
        }
    }

    /**
     * @type {Pointer}
     */
    AdapterLuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
