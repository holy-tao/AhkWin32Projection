#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\APPLICATIONTYPE.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class OLE_TM_CONFIG_PARAMS_V2 extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwcConcurrencyHint {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {APPLICATIONTYPE}
     */
    applicationType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    clusterResourceId {
        get {
            if(!this.HasProp("__clusterResourceId"))
                this.__clusterResourceId := Guid(12, this)
            return this.__clusterResourceId
        }
    }
}
