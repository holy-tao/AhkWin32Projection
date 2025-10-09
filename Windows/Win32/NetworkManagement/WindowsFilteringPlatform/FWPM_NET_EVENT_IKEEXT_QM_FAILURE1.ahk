#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_CONDITION_VALUE0.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_IKEEXT_QM_FAILURE1 extends Win32Struct
{
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
     * @type {Integer}
     */
    failurePoint {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    keyingModuleType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    qmState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    saRole {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
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
     * @type {Pointer<Guid>}
     */
    mmProviderContextKey {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
