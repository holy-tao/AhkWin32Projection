#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_NODE_INFO structure contains information that is specific to a particular node in a peer graph.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_node_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_NODE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies the size of the data structure. Set the value to   sizeof(<b>PEER_NODE_INFO</b>). This member is required and has no default value.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a unique ID that identifies an application's  connection to its neighbor. An application cannot set the value of this member, it is created by the Peer Graphing Infrastructure.
     * @type {Integer}
     */
    ullNodeId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the ID of this peer. This value is set for the application by the Peer Graphing Infrastructure. when the application creates or opens a peer graph.
     * @type {PWSTR}
     */
    pwzPeerId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the number of addresses in <b>pAddresses</b>. This member is required and has no default value.
     * @type {Integer}
     */
    cAddresses {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Points to  an array of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structures that indicate which addresses and  ports this instance is listening to for group traffic. This member is required and has no default value.
     * @deprecated 
     * @type {Pointer<PEER_ADDRESS>}
     */
    pAddresses {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to a string  that contains the  attributes that describe this particular node. This string is a free-form text string that is specific to the application. This parameter is optional; the default value is <b>NULL</b>.
     * @type {PWSTR}
     */
    pwzAttributes {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
