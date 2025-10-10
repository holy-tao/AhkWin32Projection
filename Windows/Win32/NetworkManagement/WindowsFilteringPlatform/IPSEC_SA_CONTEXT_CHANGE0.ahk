#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an IPsec security association (SA) context change.
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_sa_context_change0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_CONTEXT_CHANGE0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: [IPSEC_SA_CONTEXT_EVENT_TYPE0](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_sa_context_event_type0)</b>
     * 
     * The type of IPsec SA context change event.
     * @type {Integer}
     */
    changeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>UINT64</b>
     * 
     * Identifier of the IPsec SA context that changed.
     * @type {Integer}
     */
    saContextId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
