#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that are used with the GetFileAttributesEx and GetFileAttributesTransacted functions to specify the information level of the returned data.
 * @see https://docs.microsoft.com/windows/win32/api//minwinbase/ne-minwinbase-get_fileex_info_levels
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class GET_FILEEX_INFO_LEVELS{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesexa">GetFileAttributesEx</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileattributestransacteda">GetFileAttributesTransacted</a> function 
 *       retrieves a standard set of attribute information. The data is returned in a 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/ns-fileapi-win32_file_attribute_data">WIN32_FILE_ATTRIBUTE_DATA</a> 
 *       structure.
     * @type {Integer (Int32)}
     */
    static GetFileExInfoStandard => 0

    /**
     * One greater than the maximum value. Valid values for this enumeration will be less than this value.
     * @type {Integer (Int32)}
     */
    static GetFileExMaxInfoLevel => 1
}
