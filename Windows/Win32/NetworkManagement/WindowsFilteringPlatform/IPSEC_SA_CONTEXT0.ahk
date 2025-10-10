#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Encapsulates an inbound and outbound SA pair.
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_sa_context0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_CONTEXT0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Identifies the SA context.
     * @type {Integer}
     */
    saContextId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An [IPSEC_SA_DETAILS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details0) structure that contains information about the inbound SA.
     * @type {Pointer<IPSEC_SA_DETAILS0>}
     */
    inboundSa {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An [IPSEC_SA_DETAILS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details0) structure that contains information about the outbound SA.
     * @type {Pointer<IPSEC_SA_DETAILS0>}
     */
    outboundSa {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
