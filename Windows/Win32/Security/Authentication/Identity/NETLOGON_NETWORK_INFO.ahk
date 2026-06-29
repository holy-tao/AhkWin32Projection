#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\NETLOGON_LOGON_IDENTITY_INFO.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\CLEAR_BLOCK.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\LSA_STRING.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class NETLOGON_NETWORK_INFO extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {NETLOGON_LOGON_IDENTITY_INFO}
     */
    Identity {
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := NETLOGON_LOGON_IDENTITY_INFO(0, this)
            return this.__Identity
        }
    }

    /**
     * @type {CLEAR_BLOCK}
     */
    LmChallenge {
        get {
            if(!this.HasProp("__LmChallenge"))
                this.__LmChallenge := CLEAR_BLOCK(64, this)
            return this.__LmChallenge
        }
    }

    /**
     * @type {LSA_STRING}
     */
    NtChallengeResponse {
        get {
            if(!this.HasProp("__NtChallengeResponse"))
                this.__NtChallengeResponse := LSA_STRING(72, this)
            return this.__NtChallengeResponse
        }
    }

    /**
     * @type {LSA_STRING}
     */
    LmChallengeResponse {
        get {
            if(!this.HasProp("__LmChallengeResponse"))
                this.__LmChallengeResponse := LSA_STRING(88, this)
            return this.__LmChallengeResponse
        }
    }
}
