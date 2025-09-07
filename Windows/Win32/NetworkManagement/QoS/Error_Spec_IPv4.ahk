#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk

/**
 * The Error_Spec_IPv4 structure stores error code information for RSVP transmissions.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-error_spec_ipv4
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class Error_Spec_IPv4 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * IP address of the node responsible for the error, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-in_addr">in_addr</a> structure.
     * @type {IN_ADDR}
     */
    errs_errnode{
        get {
            if(!this.HasProp("__errs_errnode"))
                this.__errs_errnode := IN_ADDR(this.ptr + 0)
            return this.__errs_errnode
        }
    }

    /**
     * Error flags. Must be one of the following:
     * 
     * <ul>
     * <li>ERROR_SPECF_InPlace</li>
     * <li>ERROR_SPECF_NotGuilty</li>
     * </ul>
     * @type {Integer}
     */
    errs_flags {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Error code. Must be one of the following:
     * 
     * <ul>
     * <li>ERR_FORWARD_OK</li>
     * <li>ERR_Usage_globl</li>
     * <li>ERR_Usage_local</li>
     * <li>ERR_Usage_serv</li>
     * <li>ERR_global_mask</li>
     * </ul>
     * @type {Integer}
     */
    errs_code {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Error value.
     * @type {Integer}
     */
    errs_value {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
