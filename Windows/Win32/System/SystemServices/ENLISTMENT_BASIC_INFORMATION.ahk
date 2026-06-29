#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class ENLISTMENT_BASIC_INFORMATION extends Win32Struct {
    static sizeof => 48

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
    TransactionId {
        get {
            if(!this.HasProp("__TransactionId"))
                this.__TransactionId := Guid(16, this)
            return this.__TransactionId
        }
    }

    /**
     * @type {Guid}
     */
    ResourceManagerId {
        get {
            if(!this.HasProp("__ResourceManagerId"))
                this.__ResourceManagerId := Guid(32, this)
            return this.__ResourceManagerId
        }
    }
}
