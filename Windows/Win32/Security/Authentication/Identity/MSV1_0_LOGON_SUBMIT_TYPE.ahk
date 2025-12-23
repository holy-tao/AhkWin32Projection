#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the kind of logon being requested.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-msv1_0_logon_submit_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_LOGON_SUBMIT_TYPE extends Win32Enum{

    /**
     * Requests an interactive user logon. This dispatch routine handles NTLM interactive logons initiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>.
     * @type {Integer (Int32)}
     */
    static MsV1_0InteractiveLogon => 2

    /**
     * Requests the second half of an NTLM 2.0 protocol logon. The first half of this type of logon is performed by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> with the <b>MsV1_0Lm20ChallengeRequest</b> message. For more information see, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type">MSV1_0_PROTOCOL_MESSAGE_TYPE</a>.
     * @type {Integer (Int32)}
     */
    static MsV1_0Lm20Logon => 3

    /**
     * Requests a network logon. The only difference between this dispatch routine and <b>MsV1_0Lm20Logon</b> is that <b>MsV1_0NetworkLogon</b> uses a <b>ParameterControl</b> member.
     * @type {Integer (Int32)}
     */
    static MsV1_0NetworkLogon => 4

    /**
     * Requests the second half of an NTLM 2.0 protocol logon using a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">subauthentication package</a>. When MSV1_0 initializes itself, it checks a registry key to determine whether it should load a subauthentication package. For more information about subauthentication packages used with MSV1_0, see the subauthentication sample included in the Platform SDK.
     * @type {Integer (Int32)}
     */
    static MsV1_0SubAuthLogon => 5

    /**
     * Requests a logon unlock of a workstation.
     * 
     * <b>Note</b>  Windows Server 2003Windows XPThis constant is not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0WorkstationUnlockLogon => 7

    /**
     * Requests a service for user (S4U) logon.
     * 
     * <b>Note</b>  Windows Server 2003 with SP2Windows VistaWindows Server 2003Windows XPThis constant is not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0S4ULogon => 12

    /**
     * Requests a logon from a remote session.
     * 
     * <b>Note</b>  Windows Server 2003 with SP2Windows VistaWindows Server 2003Windows XPThis constant is not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0VirtualLogon => 82

    /**
     * Requests a logon that doesn't allow for elevation of privileges.
     * 
     * <b>Note</b>  Windows Server 2008 R2Windows 7Windows Server 2003 with SP2Windows VistaWindows Server 2003Windows XPThis constant is not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0NoElevationLogon => 83

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MsV1_0LuidLogon => 84
}
