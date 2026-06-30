#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines metadata specific to each WIM data source hosted on a volume.
 * @see https://learn.microsoft.com/windows/win32/api/wofapi/ns-wofapi-wim_entry_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
class WIM_ENTRY_INFO extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies the size of the structure.  Should be initialized to sizeof(WIM_ENTRY_INFO).
     * @type {Integer}
     */
    WimEntryInfoSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the type of the WIM.  Valid values are WIM_BOOT_OS_WIM and zero, which implies the WIM is not an operating system WIM.
     * @type {Integer}
     */
    WimType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies a unique identifier for this data source.
     * @type {Integer}
     */
    DataSourceId {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Specifies the GUID which is stored in the WIM file’s header.
     * @type {Guid}
     */
    WimGuid {
        get {
            if(!this.HasProp("__WimGuid"))
                this.__WimGuid := Guid(16, this)
            return this.__WimGuid
        }
    }

    /**
     * Specifies a full path to the WIM file.
     * @type {PWSTR}
     */
    WimPath {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies the index within the WIM which is described by this data source.
     * @type {Integer}
     */
    WimIndex {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies one or more flags for this data source.  Can include WIM_ENTRY_FLAG_NOT_ACTIVE, indicating a data source which is removed or where the WIM file is not found, or WIM_ENTRY_FLAG_SUSPENDED indicating that the data source is not currently in use but could become in use on demand.  If neither flag is present, the WIM is in active use.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
