#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\FWP_CONDITION_VALUE0.ahk

/**
 * Contains information that describes an IKE/AuthIP Quick Mode (QM) failure.
 * @remarks
 * 
  * <b>FWPM_NET_EVENT_IKEEXT_QM_FAILURE0</b> is a specific implementation of FWPM_NET_EVENT_IKEEXT_QM_FAILURE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_net_event_ikeext_qm_failure0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_IKEEXT_QM_FAILURE0 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Windows error code for the failure.
     * @type {Integer}
     */
    failureErrorCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An [IPSEC_FAILURE_POINT](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_failure_point) value that indicates the IPsec state when the failure occurred.
     * @type {Integer}
     */
    failurePoint {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * An [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type) value that specifies the type of keying module.
     * @type {Integer}
     */
    keyingModuleType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * An [IKEEXT_QM_SA_STATE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_qm_sa_state) value that specifies the QM state when the failure occurred.
     * @type {Integer}
     */
    qmState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * An [IKEEXT_SA_ROLE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_sa_role) value that specifies the SA role when the failure occurred.
     * @type {Integer}
     */
    saRole {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * An [IPSEC_TRAFFIC_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type) value that specifies the type of traffic.
     * @type {Integer}
     */
    saTrafficType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {FWP_CONDITION_VALUE0}
     */
    localSubNet{
        get {
            if(!this.HasProp("__localSubNet"))
                this.__localSubNet := FWP_CONDITION_VALUE0(this.ptr + 24)
            return this.__localSubNet
        }
    }

    /**
     * @type {FWP_CONDITION_VALUE0}
     */
    remoteSubNet{
        get {
            if(!this.HasProp("__remoteSubNet"))
                this.__remoteSubNet := FWP_CONDITION_VALUE0(this.ptr + 40)
            return this.__remoteSubNet
        }
    }

    /**
     * Quick Mode filter ID.
     * @type {Integer}
     */
    qmFilterId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
