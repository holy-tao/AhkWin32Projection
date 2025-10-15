#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\DS_REPL_NEIGHBORW.ahk

/**
 * The DS_REPL_NEIGHBORS structure is used with the DsReplicaGetInfo and DsReplicaGetInfo2 functions to provide inbound replication state data for naming context and source server pairs.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_repl_neighborsw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_NEIGHBORSW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains  the number of elements in the <b>rgNeighbor</b> array.
     * @type {Integer}
     */
    cNumNeighbors {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_neighborw">DS_REPL_NEIGHBOR</a> structures that contain the requested replication data. The <b>cNumNeighbors</b> member contains the number of elements in this array.
     * @type {Array<DS_REPL_NEIGHBORW>}
     */
    rgNeighbor{
        get {
            if(!this.HasProp("__rgNeighborProxyArray"))
                this.__rgNeighborProxyArray := Win32FixedArray(this.ptr + 8, 1, DS_REPL_NEIGHBORW, "")
            return this.__rgNeighborProxyArray
        }
    }
}
