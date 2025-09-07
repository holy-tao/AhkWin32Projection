#Requires AutoHotkey v2.0.0 64-bit

/**
 * This enumeration defines the WMI provider architecture used on the server.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_providerarchitecture
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ProviderArchitecture{

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
