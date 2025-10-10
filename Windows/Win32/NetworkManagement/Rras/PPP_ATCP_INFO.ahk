#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PPP_ATCP_INFO structure contains the result of a PPP AppleTalk projection operation.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ppp_atcp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_ATCP_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * Specifies the result of the PPP control protocol negotiation. A value of zero indicates success. A nonzero value indicates failure, and is the actual fatal error that occurred during the control protocol negotiation.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a Unicode string that holds the client's AppleTalk address on the RAS connection.
     * @type {String}
     */
    wszAddress {
        get => StrGet(this.ptr + 4, 32, "UTF-16")
        set => StrPut(value, this.ptr + 4, 32, "UTF-16")
    }
}
