#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SECURITY_MESSAGE structure is used with the RasSecurityDialogComplete function to indicate the results of a RAS security DLL authentication transaction.
 * @see https://learn.microsoft.com/windows/win32/api/rasshost/ns-rasshost-security_message
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class SECURITY_MESSAGE extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwMsgId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the port handle that the RAS server passed to the security DLL in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rasshost/nf-rasshost-rassecuritydialogbegin">RasSecurityDialogBegin</a> call for this authentication transaction.
     * @type {Pointer}
     */
    hPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies an error code. If <b>dwMsgId</b> is SECURITYMSG_ERROR, set <b>dwError</b> to one of the nonzero error codes defined in Winerror.h or Raserror.h. The RAS server records this error code in the event log. If the <b>dwMsgId</b> member indicates success or failure, set <b>dwError</b> to zero.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the name of the remote user if <b>dwMsgId</b> is SECURITYMSG_SUCCESS or SECURITYMSG_FAILURE. This string can be empty if <b>dwMsgId</b> is SECURITYMSG_ERROR.
     * @type {String}
     */
    UserName {
        get => StrGet(this.ptr + 20, 256, "UTF-16")
        set => StrPut(value, this.ptr + 20, 256, "UTF-16")
    }

    /**
     * Specifies the name of the logon domain for the remote user if <b>dwMsgId</b> is SECURITYMSG_SUCCESS or SECURITYMSG_FAILURE. This string can be empty if <b>dwMsgId</b> is SECURITYMSG_ERROR.
     * @type {String}
     */
    Domain {
        get => StrGet(this.ptr + 534, 15, "UTF-16")
        set => StrPut(value, this.ptr + 534, 15, "UTF-16")
    }
}
