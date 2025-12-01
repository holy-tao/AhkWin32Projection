#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\DS_REPL_VALUE_META_DATA.ahk

/**
 * The DS_REPL_ATTR_VALUE_META_DATA structure is used with the DsReplicaGetInfo2 function to provide metadata for a collection of attribute values.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_attr_value_meta_data
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_ATTR_VALUE_META_DATA extends Win32Struct
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
     * Contains the zero-based index of the next entry to retrieve if more entries are available. This value is passed for the <i>dwEnumerationContext</i> parameter in the next call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> to retrieve the next block of entries. If no more entries are available, this member contains -1.
     * @type {Integer}
     */
    dwEnumerationContext {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_value_meta_data">DS_REPL_VALUE_META_DATA</a> structures that contain the individual attribute replication values. The <b>cNumEntries</b> member contains the number of elements in this array.
     * @type {Array<DS_REPL_VALUE_META_DATA>}
     */
    rgMetaData{
        get {
            if(!this.HasProp("__rgMetaDataProxyArray"))
                this.__rgMetaDataProxyArray := Win32FixedArray(this.ptr + 8, 1, DS_REPL_VALUE_META_DATA, "")
            return this.__rgMetaDataProxyArray
        }
    }
}
