#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents information about a Chkdsk operation.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_chkdsk_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_CHKDSK_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The ID of the partition on which the Chkdsk operation is being performed.
     * @type {Integer}
     */
    PartitionNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The state of the Chkdsk operation.
     * @type {Integer}
     */
    ChkdskState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of files that were identified by the Chkdsk operation.
     * @type {Integer}
     */
    FileIdCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A list of file IDs that were identified by the Chkdsk operation.
     * @type {Array<UInt64>}
     */
    FileIdList{
        get {
            if(!this.HasProp("__FileIdListProxyArray"))
                this.__FileIdListProxyArray := Win32FixedArray(this.ptr + 16, 8, Primitive, "uint")
            return this.__FileIdListProxyArray
        }
    }
}
