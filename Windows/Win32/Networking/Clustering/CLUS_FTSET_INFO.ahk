#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an FT (fault tolerant) set. This structure is used by the CLUSPROP_FTSET_INFO structure to create an entry in a value list.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_ftset_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_FTSET_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The root signature of the FT set.
     * @type {Integer}
     */
    dwRootSignature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of fault tolerance that is supported by the FT set.
     * @type {Integer}
     */
    dwFtType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
