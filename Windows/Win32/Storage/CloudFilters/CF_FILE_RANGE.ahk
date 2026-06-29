#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of data in a placeholder file.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_file_range
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_FILE_RANGE {
    #StructPack 8

    /**
     * The offset of the starting point of the data.
     */
    StartingOffset : Int64

    /**
     * The length of the data, in bytes.
     */
    Length : Int64

}
