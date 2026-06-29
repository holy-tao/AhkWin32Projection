#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCHANNEL_SESSION_TOKEN_FLAGS.ahk" { SCHANNEL_SESSION_TOKEN_FLAGS }

/**
 * Specifies whether reconnections are enabled for an authentication session created by calling either the InitializeSecurityContext (Schannel) function or the AcceptSecurityContext (Schannel) function.
 * @remarks
 * Add a session token to a client context by using this structure as the value of the <i>pInput</i> parameter in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
 * 
 * This API only applies to Session ID-based reconnects.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-schannel_session_token
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCHANNEL_SESSION_TOKEN {
    #StructPack 4

    /**
     * Specifies the type of this structure. Set the value of this member to <b>SCHANNEL_SESSION</b>.
     */
    dwTokenType : UInt32

    dwFlags : SCHANNEL_SESSION_TOKEN_FLAGS

}
