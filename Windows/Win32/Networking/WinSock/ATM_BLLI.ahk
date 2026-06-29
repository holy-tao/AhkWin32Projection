#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ATM_BLLI structure is used to identify B-LLI information for an associated ATM socket.
 * @remarks
 * The following are the manifest constants associated with the 
 * <b>ATM_BLLI</b> structure:
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/ws2atm/ns-ws2atm-atm_blli
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_BLLI {
    #StructPack 4

    /**
     * Identifies the layer-two protocol. Corresponds to the <i>User information layer 2 protocol</i> field in the B-LLI information element. A value of SAP_FIELD_ABSENT indicates that this field is not used, and a value of SAP_FIELD_ANY means wildcard.
     */
    Layer2Protocol : UInt32

    /**
     * Identifies the user-specified layer-two protocol. Only used if the <b>Layer2Protocol</b> parameter is set to BLLI_L2_USER_SPECIFIED. The valid values range from zero–127. Corresponds to the <i>User specified layer 2 protocol information</i> field in the B-LLI information element.
     */
    Layer2UserSpecifiedProtocol : UInt32

    /**
     * Identifies the layer-three protocol. Corresponds to the <i>User information layer 3 protocol</i> field in the B-LLI information element. A value of SAP_FIELD_ABSENT indicates that this field is not used, and a value of SAP_FIELD_ANY means wildcard.
     */
    Layer3Protocol : UInt32

    /**
     * Identifies the user-specified layer-three protocol. Only used if the <b>Layer3Protocol</b> parameter is set to BLLI_L3_USER_SPECIFIED. The valid values range from zero–127. Corresponds to the <i>User specified layer 3 protocol information</i> field in the B-LLI information element.
     */
    Layer3UserSpecifiedProtocol : UInt32

    /**
     * Identifies the layer-three Initial Protocol Identifier. Only used if the <b>Layer3Protocol</b> parameter is set to BLLI_L3_ISO_TR9577. Corresponds to the <i>ISO/IEC TR 9577 Initial Protocol Identifier</i> field in the B-LLI information element.
     */
    Layer3IPI : UInt32

    /**
     * Identifies the 802.1 SNAP identifier. Only used if the <b>Layer3Protocol</b> parameter is set to BLLI_L3_ISO_TR9577 and <b>Layer3IPI</b> is set to BLLI_L3_IPI_SNAP, indicating an IEEE 802.1 SNAP identifier. Corresponds to the <i>OUI</i> and <i>PID</i> fields in the B-LLI information element.
     */
    SnapID : Int8[5]

}
