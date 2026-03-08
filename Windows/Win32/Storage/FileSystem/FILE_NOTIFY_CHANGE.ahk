#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstchangenotificationa">FindFirstChangeNotification</see>, <see href="https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstchangenotificationw">FindFirstChangeNotification</see>, <see href="https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstchangenotificationa">FindFirstChangeNotificationA</see>, <see href="https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstchangenotificationw">FindFirstChangeNotificationA</see>, <see href="https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstchangenotificationa">FindFirstChangeNotificationW</see>, <see href="https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstchangenotificationw">FindFirstChangeNotificationW</see>, <see href="https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-readdirectorychangesexw">ReadDirectoryChangesExW</see>, <see href="https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-readdirectorychangesw">ReadDirectoryChangesW</see>.
 * @see 
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_NOTIFY_CHANGE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_FILE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_DIR_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_ATTRIBUTES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_LAST_WRITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_LAST_ACCESS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_CREATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_SECURITY => 256
}
