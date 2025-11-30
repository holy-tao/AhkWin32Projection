#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ne-p2p-peer_group_issue_credential_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GROUP_ISSUE_CREDENTIAL_FLAGS extends Win32Enum{

    /**
     * When the <b>PEER_GROUP_STORE_CREDENTIALS</b> flag is set, the user  credentials are stored within a group database to be retrieved when the user connects. If the flag is not set, any new credentials are returned in string form and must be passed to the user out-of-band.
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_STORE_CREDENTIALS => 1
}
