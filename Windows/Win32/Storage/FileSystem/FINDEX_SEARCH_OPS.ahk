#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that are used with the FindFirstFileEx function to specify the type of filtering to perform.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ne-minwinbase-findex_search_ops
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FINDEX_SEARCH_OPS extends Win32Enum{

    /**
     * The search for a file that matches a specified file name.
     *       
     * 
     * The <i>lpSearchFilter</i> parameter of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfileexa">FindFirstFileEx</a> must be 
     *        <b>NULL</b> when this search operation is used.
     * @type {Integer (Int32)}
     */
    static FindExSearchNameMatch => 0

    /**
     * This is an advisory flag. 
     * If the file system supports directory filtering, the function searches for a file that matches the specified  name and is also a directory.
     * If the file system does not support directory filtering, this flag is silently ignored.
     * 
     * 
     * The <i>lpSearchFilter</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfileexa">FindFirstFileEx</a> function must be <b>NULL</b> when this search value is used.
     * 
     * If directory filtering is desired, this flag can be used on all file systems, but because it is  an advisory flag and  only affects file systems that support it, the application must examine the file attribute data stored in the <i>lpFindFileData</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfileexa">FindFirstFileEx</a> function to determine whether the function has  returned a handle to a directory.
     * @type {Integer (Int32)}
     */
    static FindExSearchLimitToDirectories => 1

    /**
     * This filtering type is not available.
     *       
     * 
     * For more information, see 
     *        <a href="https://docs.microsoft.com/windows-hardware/drivers/install/overview-of-device-interface-classes">Device Interface Classes</a>.
     * @type {Integer (Int32)}
     */
    static FindExSearchLimitToDevices => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FindExSearchMaxSearchOp => 3
}
