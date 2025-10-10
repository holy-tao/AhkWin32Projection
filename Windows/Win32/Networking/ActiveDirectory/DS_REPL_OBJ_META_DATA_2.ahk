#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\DS_REPL_ATTR_META_DATA_2.ahk

/**
 * The DS_REPL_OBJ_META_DATA_2 structure contains an array of DS_REPL_ATTR_META_DATA_2 structures, which in turn contain replication state data for the attributes (past and present) for a given object, as returned by the DsReplicaGetInfo2 function.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_repl_obj_meta_data_2
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_OBJ_META_DATA_2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the number of elements in the <b>rgMetaData</b> array.
     * @type {Integer}
     */
    cNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_attr_meta_data_2">DS_REPL_ATTR_META_DATA_2</a> structures. The <b>cNumEntries</b> member contains the number of elements in this array.
     * @type {Array<DS_REPL_ATTR_META_DATA_2>}
     */
    rgMetaData{
        get {
            if(!this.HasProp("__rgMetaDataProxyArray"))
                this.__rgMetaDataProxyArray := Win32FixedArray(this.ptr + 8, 1, DS_REPL_ATTR_META_DATA_2, "")
            return this.__rgMetaDataProxyArray
        }
    }
}
