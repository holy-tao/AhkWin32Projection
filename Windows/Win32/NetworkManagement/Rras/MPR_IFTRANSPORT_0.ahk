#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MPR_IFTRANSPORT_0 structure contains information for a particular interface transport.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_iftransport_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_IFTRANSPORT_0 extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Identifies the transport.
     * @type {Integer}
     */
    dwTransportId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Handle to the interface transport.
     * @type {Pointer<Void>}
     */
    hIfTransport {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a Unicode string that contains the name of the interface transport.
     * @type {String}
     */
    wszIfTransportName {
        get => StrGet(this.ptr + 16, 40, "UTF-16")
        set => StrPut(value, this.ptr + 16, 40, "UTF-16")
    }
}
