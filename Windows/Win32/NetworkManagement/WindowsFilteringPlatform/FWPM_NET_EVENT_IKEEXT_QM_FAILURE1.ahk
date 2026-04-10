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
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_NET_EVENT_IKEEXT_QM_FAILURE1 extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    failureErrorCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {IPSEC_FAILURE_POINT}
     */
    failurePoint {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {IKEEXT_KEY_MODULE_TYPE}
     */
    keyingModuleType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {IKEEXT_QM_SA_STATE}
     */
    qmState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {IKEEXT_SA_ROLE}
     */
    saRole {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
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
     * @type {Integer}
     */
    qmFilterId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    mmSaLuid {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer}
     */
    mmProviderContextKey {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
