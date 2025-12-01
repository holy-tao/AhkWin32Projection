#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS enumeration defines the possible client information values.
 * @remarks
 * A value from this enumeration is passed to the<a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientgetinformationbyhandle">PeerDistClientGetInformationByHandle</a> function as the <i>PeerDistClientInfoClass</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/peerdist/ne-peerdist-peerdist_client_info_by_handle_class
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS extends Win32Enum{

    /**
     * Indicates the information to retrieve is a <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/ns-peerdist-peerdist_client_basic_info">PEERDIST_CLIENT_BASIC_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PeerDistClientBasicInfo => 0

    /**
     * The maximum value for the enumeration that is used for error checking.  This value should not be sent to the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientgetinformationbyhandle">PeerDistClientGetInformationByHandle</a> function.
     * @type {Integer (Int32)}
     */
    static MaximumPeerDistClientInfoByHandlesClass => 1
}
