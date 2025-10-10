#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Generates a Secure Sockets Layer Protocol (SSL) or Transport Layer Security Protocol (TLS) alert to be sent to the target of a call to either the InitializeSecurityContext (Schannel) function or the AcceptSecurityContext (Schannel) function.
 * @remarks
 * 
  * Add an alert message to a client context by using this structure as the value of the <i>pInput</i> parameter in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-schannel_alert_token
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCHANNEL_ALERT_TOKEN extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies the type of this structure. Set the value of this member to <b>SCHANNEL_ALERT</b>.
     * @type {Integer}
     */
    dwTokenType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwAlertType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwAlertNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
