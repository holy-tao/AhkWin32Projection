#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a per-service directory path.
 * @remarks
 * 
  * All per-service state directory types have a lifetime that is scoped to the lifetime of the service installation.
  * Once the service is removed by calling [DeleteService](/windows/win32/api/winsvc/ne-winsvc-DeleteService) the state directories are deleted too.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsvc/ne-winsvc-service_directory_type
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_DIRECTORY_TYPE{

    /**
     * Mutable, persistent service state. This state is both readable and writeable by the service, and is inaccessible outside of the service. This state persists across reboots and and OS updates.
     * @type {Integer (Int32)}
     */
    static ServiceDirectoryPersistentState => 0

    /**
     * Reserved. Represents the maximum value of the enumeration.
     * @type {Integer (Int32)}
     */
    static ServiceDirectoryTypeMax => 1
}
