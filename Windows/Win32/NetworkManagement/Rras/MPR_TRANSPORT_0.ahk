#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The MPR_TRANSPORT_0 structure contains information for a particular transport.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_transport_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_TRANSPORT_0 extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * A <b>DWORD</b> value that identifies the transport protocol type. Supported transport protocol types are listed on <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">Transport Identifiers</a>.
     * @type {Integer}
     */
    dwTransportId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Handle to the transport.
     * @type {HANDLE}
     */
    hTransport{
        get {
            if(!this.HasProp("__hTransport"))
                this.__hTransport := HANDLE(this.ptr + 8)
            return this.__hTransport
        }
    }

    /**
     * A Unicode string that contains the name of the transport.
     * @type {String}
     */
    wszTransportName {
        get => StrGet(this.ptr + 16, 40, "UTF-16")
        set => StrPut(value, this.ptr + 16, 40, "UTF-16")
    }
}
