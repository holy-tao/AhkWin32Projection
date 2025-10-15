#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\alljoyn_interfacedescription.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_interfacedescription_member extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {alljoyn_interfacedescription}
     */
    iface{
        get {
            if(!this.HasProp("__iface"))
                this.__iface := alljoyn_interfacedescription(this.ptr + 0)
            return this.__iface
        }
    }

    /**
     * @type {Integer}
     */
    memberType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PSTR(this.ptr + 16)
            return this.__name
        }
    }

    /**
     * @type {PSTR}
     */
    signature{
        get {
            if(!this.HasProp("__signature"))
                this.__signature := PSTR(this.ptr + 24)
            return this.__signature
        }
    }

    /**
     * @type {PSTR}
     */
    returnSignature{
        get {
            if(!this.HasProp("__returnSignature"))
                this.__returnSignature := PSTR(this.ptr + 32)
            return this.__returnSignature
        }
    }

    /**
     * @type {PSTR}
     */
    argNames{
        get {
            if(!this.HasProp("__argNames"))
                this.__argNames := PSTR(this.ptr + 40)
            return this.__argNames
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    internal_member {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
