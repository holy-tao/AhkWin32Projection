#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ne-winsvc-service_shared_directory_type
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_SHARED_DIRECTORY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ServiceSharedDirectoryPersistentState => 0
}
