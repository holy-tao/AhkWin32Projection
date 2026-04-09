#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_GETPROCESSDEVICEREMOVALSUPPORT extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    hProcess {
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(0, this)
            return this.__hProcess
        }
    }

    /**
     * @type {Pointer}
     */
    AdapterLuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    Support {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
