#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class MPR_IPINIP_INTERFACE_0 extends Win32Struct {
    static sizeof => 532

    static packingSize => 4

    /**
     * @type {String}
     */
    wszFriendlyName {
        get => StrGet(this.ptr + 0, 256, "UTF-16")
        set => StrPut(value, this.ptr + 0, 256, "UTF-16")
    }

    /**
     * @type {Guid}
     */
    Guid {
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := Guid(516, this)
            return this.__Guid
        }
    }
}
