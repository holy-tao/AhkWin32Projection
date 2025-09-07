#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FLOW_DESC structure contains flow descriptor information for RSVP.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-flow_desc
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class FLOW_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<SENDER_TSPEC>}
     */
    stspec {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<IS_FLOWSPEC>}
     */
    isflow {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<FILTER_SPEC>}
     */
    stemp {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<FILTER_SPEC>}
     */
    fspec {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
