#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class ENLISTMENT_CRM_INFORMATION extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {Guid}
     */
    CrmTransactionManagerId {
        get {
            if(!this.HasProp("__CrmTransactionManagerId"))
                this.__CrmTransactionManagerId := Guid(0, this)
            return this.__CrmTransactionManagerId
        }
    }

    /**
     * @type {Guid}
     */
    CrmResourceManagerId {
        get {
            if(!this.HasProp("__CrmResourceManagerId"))
                this.__CrmResourceManagerId := Guid(16, this)
            return this.__CrmResourceManagerId
        }
    }

    /**
     * @type {Guid}
     */
    CrmEnlistmentId {
        get {
            if(!this.HasProp("__CrmEnlistmentId"))
                this.__CrmEnlistmentId := Guid(32, this)
            return this.__CrmEnlistmentId
        }
    }
}
