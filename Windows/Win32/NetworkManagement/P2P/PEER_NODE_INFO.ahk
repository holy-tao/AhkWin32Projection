#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_ADDRESS.ahk" { PEER_ADDRESS }

/**
 * The PEER_NODE_INFO structure contains information that is specific to a particular node in a peer graph.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_node_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_NODE_INFO {
    #StructPack 8

    /**
     * Specifies the size of the data structure. Set the value to   sizeof(<b>PEER_NODE_INFO</b>). This member is required and has no default value.
     */
    dwSize : UInt32

    /**
     * Specifies a unique ID that identifies an application's  connection to its neighbor. An application cannot set the value of this member, it is created by the Peer Graphing Infrastructure.
     */
    ullNodeId : Int64

    /**
     * Specifies the ID of this peer. This value is set for the application by the Peer Graphing Infrastructure. when the application creates or opens a peer graph.
     */
    pwzPeerId : PWSTR

    /**
     * Specifies the number of addresses in <b>pAddresses</b>. This member is required and has no default value.
     */
    cAddresses : UInt32

    /**
     * Points to  an array of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structures that indicate which addresses and  ports this instance is listening to for group traffic. This member is required and has no default value.
     * @deprecated
     */
    pAddresses : PEER_ADDRESS.Ptr

    /**
     * Points to a string  that contains the  attributes that describe this particular node. This string is a free-form text string that is specific to the application. This parameter is optional; the default value is <b>NULL</b>.
     */
    pwzAttributes : PWSTR

}
