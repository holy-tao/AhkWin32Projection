#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_FAILURE_POINT.ahk
#Include .\IKEEXT_KEY_MODULE_TYPE.ahk
#Include .\IKEEXT_QM_SA_STATE.ahk
#Include .\IKEEXT_SA_ROLE.ahk
#Include .\IPSEC_TRAFFIC_TYPE.ahk
#Include .\FWP_CONDITION_VALUE0.ahk
#Include .\FWP_DATA_TYPE.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include ..\..\Security\SID.ahk
#Include .\FWP_TOKEN_INFORMATION.ahk
#Include .\FWP_BYTE_ARRAY6.ahk
#Include .\FWP_V4_ADDR_AND_MASK.ahk
#Include .\FWP_V6_ADDR_AND_MASK.ahk
#Include .\FWP_RANGE0.ahk

/**
 * Contains information that describes an IKE/AuthIP Quick Mode (QM) failure.
 * @remarks
 * <b>FWPM_NET_EVENT_IKEEXT_QM_FAILURE0</b> is a specific implementation of FWPM_NET_EVENT_IKEEXT_QM_FAILURE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ikeext_qm_failure0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_NET_EVENT_IKEEXT_QM_FAILURE0 extends Win32Struct {
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
     * @type {IPSEC_FAILURE_POINT}
     */
    failurePoint {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * An [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type) value that specifies the type of keying module.
     * @type {IKEEXT_KEY_MODULE_TYPE}
     */
    keyingModuleType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * An [IKEEXT_QM_SA_STATE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_qm_sa_state) value that specifies the QM state when the failure occurred.
     * @type {IKEEXT_QM_SA_STATE}
     */
    qmState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * An [IKEEXT_SA_ROLE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_sa_role) value that specifies the SA role when the failure occurred.
     * @type {IKEEXT_SA_ROLE}
     */
    saRole {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * An [IPSEC_TRAFFIC_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type) value that specifies the type of traffic.
     * @type {IPSEC_TRAFFIC_TYPE}
     */
    saTrafficType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {FWP_CONDITION_VALUE0}
     */
    localSubNet {
        get {
            if(!this.HasProp("__localSubNet"))
                this.__localSubNet := FWP_CONDITION_VALUE0(24, this)
            return this.__localSubNet
        }
    }

    /**
     * @type {FWP_CONDITION_VALUE0}
     */
    remoteSubNet {
        get {
            if(!this.HasProp("__remoteSubNet"))
                this.__remoteSubNet := FWP_CONDITION_VALUE0(40, this)
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
