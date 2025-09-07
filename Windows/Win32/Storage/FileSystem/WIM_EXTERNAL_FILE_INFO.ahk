#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines metadata specific to files provided by WOF_PROVIDER_WIM.
 * @see https://learn.microsoft.com/windows/win32/api/wofapi/ns-wofapi-wim_external_file_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class WIM_EXTERNAL_FILE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the data source from which the file’s data is being provided.
     * @type {Integer}
     */
    DataSourceId {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Specifies the identifier of the file within the WIM file.
     * @type {Array<Byte>}
     */
    ResourceHash{
        get {
            if(!this.HasProp("__ResourceHashProxyArray"))
                this.__ResourceHashProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__ResourceHashProxyArray
        }
    }

    /**
     * Specifies one or more flags for this data file.  When creating a new backed file, this member should be zero.  When querying the state of an existing file, this member can include WIM_ENTRY_FLAG_NOT_ACTIVE, indicating the data source is removed or the WIM file is not found, or WIM_ENTRY_FLAG_SUSPENDED indicating that the data source is not currently in use but could become in use on demand.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
