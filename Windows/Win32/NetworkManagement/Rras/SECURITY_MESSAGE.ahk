#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURITY_MESSAGE_MSG_ID.ahk" { SECURITY_MESSAGE_MSG_ID }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The SECURITY_MESSAGE structure is used with the RasSecurityDialogComplete function to indicate the results of a RAS security DLL authentication transaction.
 * @see https://learn.microsoft.com/windows/win32/api/rasshost/ns-rasshost-security_message
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct SECURITY_MESSAGE {
    #StructPack 8

    dwMsgId : SECURITY_MESSAGE_MSG_ID

    /**
     * Specifies the port handle that the RAS server passed to the security DLL in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rasshost/nf-rasshost-rassecuritydialogbegin">RasSecurityDialogBegin</a> call for this authentication transaction.
     */
    hPort : IntPtr

    /**
     * Specifies an error code. If <b>dwMsgId</b> is SECURITYMSG_ERROR, set <b>dwError</b> to one of the nonzero error codes defined in Winerror.h or Raserror.h. The RAS server records this error code in the event log. If the <b>dwMsgId</b> member indicates success or failure, set <b>dwError</b> to zero.
     */
    dwError : UInt32

    /**
     * Specifies the name of the remote user if <b>dwMsgId</b> is SECURITYMSG_SUCCESS or SECURITYMSG_FAILURE. This string can be empty if <b>dwMsgId</b> is SECURITYMSG_ERROR.
     */
    UserName : CHAR[257]

    /**
     * Specifies the name of the logon domain for the remote user if <b>dwMsgId</b> is SECURITYMSG_SUCCESS or SECURITYMSG_FAILURE. This string can be empty if <b>dwMsgId</b> is SECURITYMSG_ERROR.
     */
    Domain : CHAR[16]

}
