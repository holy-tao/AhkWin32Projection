#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\NETLOGON_LOGON_IDENTITY_INFO.ahk
#Include ..\..\..\System\PasswordManagement\CYPHER_BLOCK.ahk
#Include ..\..\..\System\PasswordManagement\LM_OWF_PASSWORD.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class NETLOGON_INTERACTIVE_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {NETLOGON_LOGON_IDENTITY_INFO}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := NETLOGON_LOGON_IDENTITY_INFO(0, this)
            return this.__Identity
        }
    }

    /**
     * @type {LM_OWF_PASSWORD}
     */
    LmOwfPassword{
        get {
            if(!this.HasProp("__LmOwfPassword"))
                this.__LmOwfPassword := LM_OWF_PASSWORD(64, this)
            return this.__LmOwfPassword
        }
    }

    /**
     * @type {LM_OWF_PASSWORD}
     */
    NtOwfPassword{
        get {
            if(!this.HasProp("__NtOwfPassword"))
                this.__NtOwfPassword := LM_OWF_PASSWORD(80, this)
            return this.__NtOwfPassword
        }
    }
}
