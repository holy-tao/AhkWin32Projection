#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include .\CLUS_FTSET_INFO.ahk

/**
 * Contains information about an FT (fault tolerant) set. It is used as an entry in a value list and consists of a CLUSPROP_VALUE and a CLUS_FTSET_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_ftset_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_FTSET_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * @type {CLUS_FTSET_INFO}
     */
    Base2{
        get {
            if(!this.HasProp("__Base2"))
                this.__Base2 := CLUS_FTSET_INFO(this.ptr + 16)
            return this.__Base2
        }
    }
}
