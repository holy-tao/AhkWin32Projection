#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NET_IF_MEDIA_CONNECT_STATE enumeration type specifies the NDIS network interface connection state.
 * @remarks
 * The NDIS_MEDIA_CONNECT_STATE enumeration type, used to describe NDIS interface providers in the
 *     OID_GEN_MEDIA_CONNECT_STATUS_EX OID, is equivalent to this enumeration.
 * 
 * 
 * ```
 * typedef NET_IF_MEDIA_CONNECT_STATE NDIS_MEDIA_CONNECT_STATE, *PNDIS_MEDIA_CONNECT_STATE;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ne-ifdef-net_if_media_connect_state
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NET_IF_MEDIA_CONNECT_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The connection state of the interface is unknown.
     * @type {Integer (Int32)}
     */
    static MediaConnectStateUnknown => 0

    /**
     * The interface is connected to the network.
     * @type {Integer (Int32)}
     */
    static MediaConnectStateConnected => 1

    /**
     * The interface is not connected to the network.
     * @type {Integer (Int32)}
     */
    static MediaConnectStateDisconnected => 2
}
