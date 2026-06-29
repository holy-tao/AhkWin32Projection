#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines metadata specific to files provided by WOF_PROVIDER_WIM.
 * @see https://learn.microsoft.com/windows/win32/api/wofapi/ns-wofapi-wim_external_file_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct WIM_EXTERNAL_FILE_INFO {
    #StructPack 8

    /**
     * Specifies the data source from which the file’s data is being provided.
     */
    DataSourceId : Int64

    /**
     * Specifies the identifier of the file within the WIM file.
     */
    ResourceHash : Int8[20]

    /**
     * Specifies one or more flags for this data file.  When creating a new backed file, this member should be zero.  When querying the state of an existing file, this member can include WIM_ENTRY_FLAG_NOT_ACTIVE, indicating the data source is removed or the WIM file is not found, or WIM_ENTRY_FLAG_SUSPENDED indicating that the data source is not currently in use but could become in use on demand.
     */
    Flags : UInt32

}
