#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NET_IF_MEDIA_DUPLEX_STATE enumeration type specifies the NDIS network interface duplex state.
 * @remarks
 * 
 * The NDIS_MEDIA_DUPLEX_STATE, enumeration type, used to describe NDIS interface providers in the
 *     OID_GEN_MEDIA_DUPLEX_STATE, OID, is equivalent to this enumeration.
 * 
 * 
 * ```
 * typedef NET_IF_MEDIA_DUPLEX_STATE NDIS_MEDIA_DUPLEX_STATE, *PNDIS_MEDIA_DUPLEX_STATE;
 * ```
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ifdef/ne-ifdef-net_if_media_duplex_state
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NET_IF_MEDIA_DUPLEX_STATE{

    /**
     * The duplex state of the miniport adapter is unknown.
     * @type {Integer (Int32)}
     */
    static MediaDuplexStateUnknown => 0

    /**
     * The miniport adapter can transmit or receive but not both simultaneously.
     * @type {Integer (Int32)}
     */
    static MediaDuplexStateHalf => 1

    /**
     * The miniport adapter can transmit and receive simultaneously.
     * @type {Integer (Int32)}
     */
    static MediaDuplexStateFull => 2
}
