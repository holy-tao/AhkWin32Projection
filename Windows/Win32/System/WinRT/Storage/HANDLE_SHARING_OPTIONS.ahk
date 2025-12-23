#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the requested sharing mode of the file handle.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/ne-windowsstoragecom-handle_sharing_options
 * @namespace Windows.Win32.System.WinRT.Storage
 * @version v4.0.30319
 */
class HANDLE_SHARING_OPTIONS extends Win32BitflagEnum{

    /**
     * Prevents other processes from opening a file if they request delete, read, or write access.
     * @type {Integer (Int32)}
     */
    static HSO_SHARE_NONE => 0

    /**
     * Enables subsequent open operations on a file to request read access.
     * Otherwise, other processes cannot open the file if they request read access.
     * @type {Integer (Int32)}
     */
    static HSO_SHARE_READ => 1

    /**
     * Enables subsequent open operations on a file to request write access.
     * Otherwise, other processes cannot open the file if they request write access.
     * @type {Integer (Int32)}
     */
    static HSO_SHARE_WRITE => 2

    /**
     * Enables subsequent open operations on a file to request delete access.
     * Otherwise, other processes cannot open the file if they request delete access.
     * @type {Integer (Int32)}
     */
    static HSO_SHARE_DELETE => 4
}
