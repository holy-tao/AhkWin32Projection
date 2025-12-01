#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\FLOWSPEC.ahk

/**
 * The FLOWDESCRIPTOR structure specifies one or more filters for a given FLOWSPEC.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-flowdescriptor
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class FLOWDESCRIPTOR extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Flow specification (FLOWSPEC), provided as a <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure.
     * @type {FLOWSPEC}
     */
    FlowSpec{
        get {
            if(!this.HasProp("__FlowSpec"))
                this.__FlowSpec := FLOWSPEC(0, this)
            return this.__FlowSpec
        }
    }

    /**
     * Number of filters provided in <b>FilterList</b>.
     * @type {Integer}
     */
    NumFilters {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_filterspec">RSVP_FILTERSPEC</a> structure containing FILTERSPEC information.
     * @type {Pointer<RSVP_FILTERSPEC>}
     */
    FilterList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
