#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HWND.ahk
#Include .\D3DKMT_VIDPNSOURCEOWNER_TYPE.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYVIDPNEXCLUSIVEOWNERSHIP extends Win32Struct {
    static sizeof => 40

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
     * @type {HWND}
     */
    hWindow {
        get {
            if(!this.HasProp("__hWindow"))
                this.__hWindow := HWND(8, this)
            return this.__hWindow
        }
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    AdapterLuid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {D3DKMT_VIDPNSOURCEOWNER_TYPE}
     */
    OwnerType {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
