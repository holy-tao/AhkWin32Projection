#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the role of a provider, relative to the other provider in the synchronization session.
 * @remarks
 * 
  * Changes flow from the source provider to the destination provider in a synchronization session.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ne-winsync-sync_provider_role
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_PROVIDER_ROLE{

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
