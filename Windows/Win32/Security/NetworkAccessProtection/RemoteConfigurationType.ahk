#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the type of remote configuration possible for a component.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-remoteconfigurationtype
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct RemoteConfigurationType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The component allows  remote configuration directly on the machine.
     * @type {Integer (Int32)}
     */
    static remoteConfigTypeMachine => 1

    /**
     * The component allows remote configuration via a binary large object (BLOB) loaded in memory.
     * @type {Integer (Int32)}
     */
    static remoteConfigTypeConfigBlob => 2
}
