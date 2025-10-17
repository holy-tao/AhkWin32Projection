#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include .\CLUS_SCSI_ADDRESS.ahk

/**
 * Describes an address for a SCSI device.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusprop_scsi_address
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_SCSI_ADDRESS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(0, this)
            return this.__Base
        }
    }

    /**
     * @type {CLUS_SCSI_ADDRESS}
     */
    Base2{
        get {
            if(!this.HasProp("__Base2"))
                this.__Base2 := CLUS_SCSI_ADDRESS(16, this)
            return this.__Base2
        }
    }
}
