#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\FWPM_NET_EVENT_HEADER3.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT4 extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {FWPM_NET_EVENT_HEADER3}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := FWPM_NET_EVENT_HEADER3(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_MM_FAILURE2>}
     */
    ikeMmFailure {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_QM_FAILURE1>}
     */
    ikeQmFailure {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_EM_FAILURE1>}
     */
    ikeEmFailure {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CLASSIFY_DROP2>}
     */
    classifyDrop {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IPSEC_KERNEL_DROP0>}
     */
    ipsecDrop {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IPSEC_DOSP_DROP0>}
     */
    idpDrop {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CLASSIFY_ALLOW0>}
     */
    classifyAllow {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CAPABILITY_DROP0>}
     */
    capabilityDrop {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CAPABILITY_ALLOW0>}
     */
    capabilityAllow {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CLASSIFY_DROP_MAC0>}
     */
    classifyDropMac {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }
}
