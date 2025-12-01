#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include .\CLUS_PARTITION_INFO_EX.ahk

/**
 * The CLUSPROP_PARTITION_INFO_EX structure contains information relevant to storage class resources.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_partition_info_ex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_PARTITION_INFO_EX extends Win32Struct
{
    static sizeof => 1168

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
     * @type {CLUS_PARTITION_INFO_EX}
     */
    Base2{
        get {
            if(!this.HasProp("__Base2"))
                this.__Base2 := CLUS_PARTITION_INFO_EX(16, this)
            return this.__Base2
        }
    }
}
