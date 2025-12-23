#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies whether reconnections are enabled for an authentication session created by calling either the InitializeSecurityContext (Schannel) function or the AcceptSecurityContext (Schannel) function.
 * @remarks
 * Add a session token to a client context by using this structure as the value of the <i>pInput</i> parameter in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
 * 
 * This API only applies to Session ID-based reconnects.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-schannel_session_token
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCHANNEL_SESSION_TOKEN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the type of this structure. Set the value of this member to <b>SCHANNEL_SESSION</b>.
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
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
