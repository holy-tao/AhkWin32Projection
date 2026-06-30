#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTION_ENLISTMENT_PAIR extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Guid}
     */
    EnlistmentId {
        get {
            if(!this.HasProp("__EnlistmentId"))
                this.__EnlistmentId := Guid(0, this)
            return this.__EnlistmentId
        }
    }

    /**
     * @type {Guid}
     */
    ResourceManagerId {
        get {
            if(!this.HasProp("__ResourceManagerId"))
                this.__ResourceManagerId := Guid(16, this)
            return this.__ResourceManagerId
        }
    }
}
