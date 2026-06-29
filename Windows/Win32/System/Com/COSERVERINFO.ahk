#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\COAUTHINFO.ahk" { COAUTHINFO }

/**
 * The COSERVERINFO (objidlbase.h) structure identifies a remote computer resource to the activation functions.
 * @remarks
 * The <b>COSERVERINFO</b> structure is used primarily to identify a remote system in object creation functions. Computer resources are named using the naming scheme of the network transport. By default, all UNC ("&#92;&#92;<i>server</i>" or "<i>server</i>") and DNS names ("<i>domain</i>.com", "<i>example</i>.microsoft.com", or "135.5.33.19") names are allowed. 
 * 
 * 
 * 
 * If <b>pAuthInfo</b> is set to <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/com/snego">Snego</a> will be used to negotiate an authentication service that will work between the client and server. However, a non-<b>NULL</b><a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ns-wtypesbase-coauthinfo">COAUTHINFO</a> structure can be specified for <b>pAuthInfo</b> to meet any one of the following needs:
 * 
 * <ul>
 * <li>To specify a different client identity for computer remote activations. The specified identity will be used for the launch permission check on the server rather than the real client identity.
 * </li>
 * <li>To specify that Kerberos, rather than NTLMSSP, is used for machine remote activation. A nondefault client identity may or may not be specified. 
 * </li>
 * <li>To request unsecure activation.
 * </li>
 * <li>To specify a proprietary authentication service.</li>
 * </ul>
 * If <b>pAuthInfo</b> is not <b>NULL</b>, those values will be used to specify the authentication settings for the remote call. These settings will be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetauthinfoexa">RpcBindingSetAuthInfoEx</a> function.
 * 
 * If the <i>pAuthInfo</i> parameter is <b>NULL</b>, then <i>dwAuthnLevel</i> can be overridden by the authentication level set by the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> function. If the <b>CoInitializeSecurity</b> function isn't called, then the authentication level specified under the <a href="https://docs.microsoft.com/windows/desktop/com/appid-key">AppID</a> registry key is used, if it exists.
 * 
 * Starting with Windows XP with Service Pack 2 (SP2), <i>dwAuthnLevel</i> is the maximum of RPC_C_AUTHN_LEVEL_CONNECT and the process-wide authentication level of the client process that is issuing the activation request. For earlier versions of the operating system, this is RPC_C_AUTHN_LEVEL_CONNECT.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ns-objidlbase-coserverinfo
 * @namespace Windows.Win32.System.Com
 */
export default struct COSERVERINFO {
    #StructPack 8

    /**
     * This member is reserved and must be 0.
     */
    dwReserved1 : UInt32

    /**
     * The name of the computer.
     */
    pwszName : PWSTR

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ns-wtypesbase-coauthinfo">COAUTHINFO</a> structure to override the default activation security for machine remote activations. Otherwise, set to <b>NULL</b> to indicate that default values should be used. For more information, see the Remarks section.
     */
    pAuthInfo : COAUTHINFO.Ptr

    /**
     * This member is reserved and must be 0.
     */
    dwReserved2 : UInt32

}
