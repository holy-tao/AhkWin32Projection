#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the role of a provider, relative to the other provider in the synchronization session.
 * @remarks
 * Changes flow from the source provider to the destination provider in a synchronization session.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ne-winsync-sync_provider_role
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SYNC_PROVIDER_ROLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The provider is the source provider.
     * @type {Integer (Int32)}
     */
    static SPR_SOURCE => 0

    /**
     * The provider is the destination provider.
     * @type {Integer (Int32)}
     */
    static SPR_DESTINATION => 1
}
