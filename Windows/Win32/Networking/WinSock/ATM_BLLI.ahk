#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ATM_BLLI structure is used to identify B-LLI information for an associated ATM socket.
 * @remarks
 * 
  * The following are the manifest constants associated with the 
  * <b>ATM_BLLI</b> structure:
  * 
  * 
  * ```cpp
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2atm/ns-ws2atm-atm_blli
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ATM_BLLI extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Identifies the layer-two protocol. Corresponds to the <i>User information layer 2 protocol</i> field in the B-LLI information element. A value of SAP_FIELD_ABSENT indicates that this field is not used, and a value of SAP_FIELD_ANY means wildcard.
     * @type {Integer}
     */
    Layer2Protocol {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Identifies the user-specified layer-two protocol. Only used if the <b>Layer2Protocol</b> parameter is set to BLLI_L2_USER_SPECIFIED. The valid values range from zero–127. Corresponds to the <i>User specified layer 2 protocol information</i> field in the B-LLI information element.
     * @type {Integer}
     */
    Layer2UserSpecifiedProtocol {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Identifies the layer-three protocol. Corresponds to the <i>User information layer 3 protocol</i> field in the B-LLI information element. A value of SAP_FIELD_ABSENT indicates that this field is not used, and a value of SAP_FIELD_ANY means wildcard.
     * @type {Integer}
     */
    Layer3Protocol {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Identifies the user-specified layer-three protocol. Only used if the <b>Layer3Protocol</b> parameter is set to BLLI_L3_USER_SPECIFIED. The valid values range from zero–127. Corresponds to the <i>User specified layer 3 protocol information</i> field in the B-LLI information element.
     * @type {Integer}
     */
    Layer3UserSpecifiedProtocol {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Identifies the layer-three Initial Protocol Identifier. Only used if the <b>Layer3Protocol</b> parameter is set to BLLI_L3_ISO_TR9577. Corresponds to the <i>ISO/IEC TR 9577 Initial Protocol Identifier</i> field in the B-LLI information element.
     * @type {Integer}
     */
    Layer3IPI {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Identifies the 802.1 SNAP identifier. Only used if the <b>Layer3Protocol</b> parameter is set to BLLI_L3_ISO_TR9577 and <b>Layer3IPI</b> is set to BLLI_L3_IPI_SNAP, indicating an IEEE 802.1 SNAP identifier. Corresponds to the <i>OUI</i> and <i>PID</i> fields in the B-LLI information element.
     * @type {Array<Byte>}
     */
    SnapID{
        get {
            if(!this.HasProp("__SnapIDProxyArray"))
                this.__SnapIDProxyArray := Win32FixedArray(this.ptr + 20, 5, Primitive, "char")
            return this.__SnapIDProxyArray
        }
    }
}
