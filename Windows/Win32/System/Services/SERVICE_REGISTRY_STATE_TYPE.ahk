#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a state type for a service registry key.
 * @remarks
 * 
  * All per-service registry state types have a lifetime that is scoped to the lifetime of the service installation.
  * Once the service is removed by calling [DeleteService](/windows/win32/api/winsvc/ne-winsvc-DeleteService) the registry state is deleted too.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsvc/ne-winsvc-service_registry_state_type
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_REGISTRY_STATE_TYPE{

    /**
     * Immutable service state, populated by INF to the Parameters subkey.
     * @type {Integer (Int32)}
     */
    static ServiceRegistryStateParameters => 0

    /**
     * Mutable, persistent service state. This state is both readable and writeable by the service, and is inaccessible outside of the service. This state persists across reboots and and OS updates.
     * @type {Integer (Int32)}
     */
    static ServiceRegistryStatePersistent => 1

    /**
     * Reserved. Represents the maximum value of the enumeration.
     * @type {Integer (Int32)}
     */
    static MaxServiceRegistryStateType => 2
}
