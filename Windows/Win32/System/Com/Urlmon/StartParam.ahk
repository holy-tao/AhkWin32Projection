#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IBindCtx.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class StartParam extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Guid}
     */
    iid {
        get {
            if(!this.HasProp("__iid"))
                this.__iid := Guid(0, this)
            return this.__iid
        }
    }

    /**
     * @type {IBindCtx}
     */
    pIBindCtx {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {IUnknown}
     */
    pItf {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
