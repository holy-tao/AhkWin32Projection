#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCHANNEL_ALERT_TOKEN_ALERT_TYPE.ahk" { SCHANNEL_ALERT_TOKEN_ALERT_TYPE }

/**
 * Generates a Secure Sockets Layer Protocol (SSL) or Transport Layer Security Protocol (TLS) alert to be sent to the target of a call to either the InitializeSecurityContext (Schannel) function or the AcceptSecurityContext (Schannel) function.
 * @remarks
 * Add an alert message to a client context by using this structure as the value of the <i>pInput</i> parameter in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-schannel_alert_token
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCHANNEL_ALERT_TOKEN {
    #StructPack 4

    /**
     * Specifies the type of this structure. Set the value of this member to <b>SCHANNEL_ALERT</b>.
     */
    dwTokenType : UInt32

    dwAlertType : SCHANNEL_ALERT_TOKEN_ALERT_TYPE

    dwAlertNumber : UInt32

}
