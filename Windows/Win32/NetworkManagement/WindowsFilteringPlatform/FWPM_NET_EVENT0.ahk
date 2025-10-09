#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\FWPM_NET_EVENT_HEADER0.ahk

/**
 * Contains information about all event types. (FWPM_NET_EVENT0)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT0 extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * A [FWPM_NET_EVENT_HEADER0](ns-fwpmtypes-fwpm_net_event_header0.md) structure that contains information common to all events.
     * @type {FWPM_NET_EVENT_HEADER0}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := FWPM_NET_EVENT_HEADER0(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * A [FWPM_NET_EVENT_TYPE](ne-fwpmtypes-fwpm_net_event_type.md) value that specifies the type of event.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_MM_FAILURE0>}
     */
    ikeMmFailure {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_QM_FAILURE0>}
     */
    ikeQmFailure {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_EM_FAILURE0>}
     */
    ikeEmFailure {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CLASSIFY_DROP0>}
     */
    classifyDrop {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IPSEC_KERNEL_DROP0>}
     */
    ipsecDrop {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IPSEC_DOSP_DROP0>}
     */
    idpDrop {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
