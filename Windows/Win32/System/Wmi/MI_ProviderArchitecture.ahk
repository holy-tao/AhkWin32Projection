#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This enumeration defines the WMI provider architecture used on the server.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_providerarchitecture
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ProviderArchitecture {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use this value if the client calls a 32-bit provider on the remote machine.
     * @type {Integer (Int32)}
     */
    static MI_PROVIDER_ARCHITECTURE_32BIT => 0

    /**
     * Use this value if the client calls a 64-bit provider on the remote machine.
     * @type {Integer (Int32)}
     */
    static MI_PROVIDER_ARCHITECTURE_64BIT => 1
}
