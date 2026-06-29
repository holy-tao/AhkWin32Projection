#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the session is a reconnection and retrieves a value that identifies the session.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_sessioninfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_SessionInfo {
    #StructPack 4

    /**
     * Bit flags that specify the type of session. The following value is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SSL_SESSION_RECONNECT"></a><a id="ssl_session_reconnect"></a><dl>
     * <dt><b>SSL_SESSION_RECONNECT</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session is a reconnection.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * The size, in bytes, of the <b>rgbSessionId</b> array.
     */
    cbSessionId : UInt32

    /**
     * An array of up to 32 bytes that identifies the session.
     */
    rgbSessionId : Int8[32]

}
