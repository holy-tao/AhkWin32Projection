#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a state type for a service registry key. (SERVICE_SHARED_REGISTRY_STATE_TYPE)
 * @remarks
 * All per-service registry state types have a lifetime that is scoped to the lifetime of the service installation.
  * Once the service is removed by calling [DeleteService](/windows/win32/api/winsvc/nf-winsvc-deleteservice) the registry state is deleted too.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ne-winsvc-service_shared_registry_state_type
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_SHARED_REGISTRY_STATE_TYPE{

    /**
     * Mutable, persistent service state. This state is readable and writeable by the service and by local administrators. This state persists across reboots and and OS updates.
     * @type {Integer (Int32)}
     */
    static ServiceSharedRegistryPersistentState => 0
}
