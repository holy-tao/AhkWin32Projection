#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEERDIST_CLIENT_BASIC_INFO structure indicates whether or not there are many clients simultaneously downloading the same content.
 * @remarks
 * 
 * Thie <b>PEERDIST_CLIENT_BASIC_INFO</b> structure is retrieved from the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientgetinformationbyhandle">PeerDistClientGetInformationHandle</a> function with PeerDistClientBasicInfo value specified for the <i>PeerDistClientInfoClass</i> parameter.
 * 
 * If true,  content that cannot be retrieved from the Peer Distribution APIs may soon be available for retrieval.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//peerdist/ns-peerdist-peerdist_client_basic_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEERDIST_CLIENT_BASIC_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Indicates that a "flash crowd" situation has been detected, where many clients in the branch office are simultaneously downloading the same content.
     * @type {BOOL}
     */
    fFlashCrowd {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
