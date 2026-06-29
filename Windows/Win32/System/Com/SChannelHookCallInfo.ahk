#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class SChannelHookCallInfo extends Win32Struct {
    static sizeof => 56

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
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Guid}
     */
    uCausality {
        get {
            if(!this.HasProp("__uCausality"))
                this.__uCausality := Guid(20, this)
            return this.__uCausality
        }
    }

    /**
     * @type {Integer}
     */
    dwServerPid {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    iMethod {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    pObject {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 56
    }
}
