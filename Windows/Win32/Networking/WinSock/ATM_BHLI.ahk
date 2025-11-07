#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ATM_BHLI structure is used to identify B-HLI information for an associated ATM socket.
 * @remarks
 * 
 * The following are the manifest constants associated with the 
 * <b>ATM_BHLI</b> structure:
 * 
 * 
 * ```cpp
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2atm/ns-ws2atm-atm_bhli
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ATM_BHLI extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Identifies the <b>high layer information type</b> field in the B-LLI information element. Note that the type <b>BHLI_HighLayerProfile</b> has been eliminated in UNI 3.1. A value of SAP_FIELD_ABSENT indicates that B-HLI is not present, and a value of SAP_FIELD_ANY means wildcard.
     * @type {Integer}
     */
    HighLayerInfoType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Identifies the number of bytes from one to eight in the <b>HighLayerInfo</b> array. Valid values include eight for the cases of BHLI_ISO and BHLI_UserSpecific, four for BHLI_HighLayerProfile, and seven for BHLI_VendorSpecificAppId.
     * @type {Integer}
     */
    HighLayerInfoLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Identifies the <b>high layer information</b> field in the B-LLI information element. In the case of <b>HighLayerInfoType</b> being BHLI_VendorSpecificAppId, the first 3 bytes consist of a globally-administered organizationally unique identifier (OUI), (according to IEEE standard 802-1990), followed by a 4-byte application identifier, which is administered by the vendor identified by the OUI. Value for the case of BHLI_UserSpecific is user defined and requires bilateral agreement between two end users.
     * @type {Array<Byte>}
     */
    HighLayerInfo{
        get {
            if(!this.HasProp("__HighLayerInfoProxyArray"))
                this.__HighLayerInfoProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "char")
            return this.__HighLayerInfoProxyArray
        }
    }
}
