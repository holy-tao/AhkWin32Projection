#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines metadata specific to each WIM data source hosted on a volume.
 * @see https://learn.microsoft.com/windows/win32/api/wofapi/ns-wofapi-wim_entry_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct WIM_ENTRY_INFO {
    #StructPack 8

    /**
     * Specifies the size of the structure.  Should be initialized to sizeof(WIM_ENTRY_INFO).
     */
    WimEntryInfoSize : UInt32

    /**
     * Specifies the type of the WIM.  Valid values are WIM_BOOT_OS_WIM and zero, which implies the WIM is not an operating system WIM.
     */
    WimType : UInt32

    /**
     * Specifies a unique identifier for this data source.
     */
    DataSourceId : Int64

    /**
     * Specifies the GUID which is stored in the WIM file’s header.
     */
    WimGuid : Guid

    /**
     * Specifies a full path to the WIM file.
     */
    WimPath : PWSTR

    /**
     * Specifies the index within the WIM which is described by this data source.
     */
    WimIndex : UInt32

    /**
     * Specifies one or more flags for this data source.  Can include WIM_ENTRY_FLAG_NOT_ACTIVE, indicating a data source which is removed or where the WIM file is not found, or WIM_ENTRY_FLAG_SUSPENDED indicating that the data source is not currently in use but could become in use on demand.  If neither flag is present, the WIM is in active use.
     */
    Flags : UInt32

}
