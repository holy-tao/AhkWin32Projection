#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_INTERFACE_CHANGE_NOTIFICATION extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Guid}
     */
    Event {
        get {
            if(!this.HasProp("__Event"))
                this.__Event := Guid(4, this)
            return this.__Event
        }
    }

    /**
     * @type {Guid}
     */
    InterfaceClassGuid {
        get {
            if(!this.HasProp("__InterfaceClassGuid"))
                this.__InterfaceClassGuid := Guid(20, this)
            return this.__InterfaceClassGuid
        }
    }

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    SymbolicLinkName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
