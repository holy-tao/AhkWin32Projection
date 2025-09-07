#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include .\CLUS_PARTITION_INFO_EX.ahk
#Include .\CLUSPROP_PARTITION_INFO_EX.ahk
#Include .\CLUS_PARTITION_INFO_EX2.ahk

/**
 * A value list entry that contains partition information for a storage class resource. This structure is as a input, and a as a return value for the CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX2 control code.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_partition_info_ex2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_PARTITION_INFO_EX2 extends Win32Struct
{
    static sizeof => 1704

    static packingSize => 8

    /**
     * @type {CLUSPROP_PARTITION_INFO_EX}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_PARTITION_INFO_EX(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * @type {CLUS_PARTITION_INFO_EX2}
     */
    Base2{
        get {
            if(!this.HasProp("__Base2"))
                this.__Base2 := CLUS_PARTITION_INFO_EX2(this.ptr + 1168)
            return this.__Base2
        }
    }
}
