#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\FWP_BYTE_ARRAY6.ahk
#Include .\FWPM_NET_EVENT_HEADER1.ahk

/**
 * Contains information about all event types. (FWPM_NET_EVENT1)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT1 extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * An [FWPM_NET_EVENT_HEADER1](ns-fwpmtypes-fwpm_net_event_header1.md) structure that contains information common to all events.
     * @type {FWPM_NET_EVENT_HEADER1}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := FWPM_NET_EVENT_HEADER1(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * An [FWPM_NET_EVENT_TYPE](ne-fwpmtypes-fwpm_net_event_type.md) value that specifies the type of event.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_MM_FAILURE1>}
     */
    ikeMmFailure {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_QM_FAILURE0>}
     */
    ikeQmFailure {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IKEEXT_EM_FAILURE1>}
     */
    ikeEmFailure {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_CLASSIFY_DROP1>}
     */
    classifyDrop {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IPSEC_KERNEL_DROP0>}
     */
    ipsecDrop {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<FWPM_NET_EVENT_IPSEC_DOSP_DROP0>}
     */
    idpDrop {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
