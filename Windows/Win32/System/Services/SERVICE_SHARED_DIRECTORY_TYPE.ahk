#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a per-service shared directory path.
 * @remarks
 * All per-service state directory types have a lifetime that is scoped to the lifetime of the service installation.
 * Once the service is removed by calling [DeleteService](/windows/win32/api/winsvc/nf-winsvc-deleteservice) the state directories are deleted too.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ne-winsvc-service_shared_directory_type
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_SHARED_DIRECTORY_TYPE extends Win32Enum{

    /**
     * Mutable, persistent service state. This state is both readable and writeable by the service and by local administrators. This state persists across reboots and OS updates.
     * @type {Integer (Int32)}
     */
    static ServiceSharedDirectoryPersistentState => 0
}
