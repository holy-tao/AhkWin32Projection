#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a state type for a service registry key. (SERVICE_SHARED_REGISTRY_STATE_TYPE)
 * @remarks
 * All per-service registry state types have a lifetime that is scoped to the lifetime of the service installation.
 * Once the service is removed by calling [DeleteService](/windows/win32/api/winsvc/nf-winsvc-deleteservice) the registry state is deleted too.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ne-winsvc-service_shared_registry_state_type
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_SHARED_REGISTRY_STATE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Mutable, persistent service state. This state is readable and writeable by the service and by local administrators. This state persists across reboots and and OS updates.
     * @type {Integer (Int32)}
     */
    static ServiceSharedRegistryPersistentState => 0
}
