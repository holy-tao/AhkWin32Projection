#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the connection state of an item in the Offline Files cache.
 * @remarks
 * 
 * Transparently cached data is accessible only when the client is connected to the server.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/ne-cscobj-offlinefiles_connect_state
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_CONNECT_STATE extends Win32Enum{

    /**
     * Returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> if the method fails.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CONNECT_STATE_UNKNOWN => 0

    /**
     * Returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> if the item is offline. Pass this value to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-setconnectstate">IOfflineFilesConnectionInfo::SetConnectState</a> to transition the item to offline.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CONNECT_STATE_OFFLINE => 1

    /**
     * Returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> if the item is online. Pass this value to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-setconnectstate">IOfflineFilesConnectionInfo::SetConnectState</a> to transition the item to online.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CONNECT_STATE_ONLINE => 2

    /**
     * Returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> if the item is transparently cached.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported before Windows Server 2008 R2 and Windows 7.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CONNECT_STATE_TRANSPARENTLY_CACHED => 3

    /**
     * Returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> if the item contains both transparently cached data and data that can be made available offline.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported before Windows Server 2008 R2 and Windows 7.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CONNECT_STATE_PARTLY_TRANSPARENTLY_CACHED => 4
}
