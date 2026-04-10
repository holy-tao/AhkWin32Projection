#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWPM_NET_EVENT_HEADER2.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\FWP_IP_VERSION.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include ..\..\Security\SID.ahk
#Include .\FWP_AF.ahk
#Include .\FWPM_NET_EVENT_TYPE.ahk
#Include .\FWPM_NET_EVENT_IKEEXT_MM_FAILURE1.ahk
#Include .\FWPM_NET_EVENT_IKEEXT_QM_FAILURE0.ahk
#Include .\FWPM_NET_EVENT_IKEEXT_EM_FAILURE1.ahk
#Include .\FWPM_NET_EVENT_CLASSIFY_DROP2.ahk
#Include .\FWPM_NET_EVENT_IPSEC_KERNEL_DROP0.ahk
#Include .\FWPM_NET_EVENT_IPSEC_DOSP_DROP0.ahk
#Include .\FWPM_NET_EVENT_CLASSIFY_ALLOW0.ahk
#Include .\FWPM_NET_EVENT_CAPABILITY_DROP0.ahk
#Include .\FWPM_NET_EVENT_CAPABILITY_ALLOW0.ahk
#Include .\FWPM_NET_EVENT_CLASSIFY_DROP_MAC0.ahk

/**
 * Contains information about all event types. (FWPM_NET_EVENT2)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_NET_EVENT2 extends Win32Struct {
    static sizeof => 120

    static packingSize => 8

    /**
     * Type: **[FWPM_NET_EVENT_HEADER2](ns-fwpmtypes-fwpm_net_event_header2.md)**
     * 
     * Information common to all events.
     * @type {FWPM_NET_EVENT_HEADER2}
     */
    header {
        get {
            if(!this.HasProp("__header"))
                this.__header := FWPM_NET_EVENT_HEADER2(0, this)
            return this.__header
        }
    }

    /**
     * Type: **[FWPM_NET_EVENT_TYPE](ne-fwpmtypes-fwpm_net_event_type.md)**
     * 
     * The type of event.
     * @type {FWPM_NET_EVENT_TYPE}
     */
    type {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_MM_FAILURE1>}
     */
    ikeMmFailure {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_QM_FAILURE0>}
     */
    ikeQmFailure {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_EM_FAILURE1>}
     */
    ikeEmFailure {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CLASSIFY_DROP2>}
     */
    classifyDrop {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IPSEC_KERNEL_DROP0>}
     */
    ipsecDrop {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IPSEC_DOSP_DROP0>}
     */
    idpDrop {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CLASSIFY_ALLOW0>}
     */
    classifyAllow {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CAPABILITY_DROP0>}
     */
    capabilityDrop {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CAPABILITY_ALLOW0>}
     */
    capabilityAllow {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CLASSIFY_DROP_MAC0>}
     */
    classifyDropMac {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
