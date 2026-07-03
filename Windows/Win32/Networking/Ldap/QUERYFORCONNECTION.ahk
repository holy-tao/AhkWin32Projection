#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LDAP.ahk" { LDAP }

/**
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct QUERYFORCONNECTION {
    value : IntPtr

    __value {
        set {
            if (value is QUERYFORCONNECTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LDAP>} PrimaryConnection 
     * @param {Pointer<LDAP>} ReferralFromConnection 
     * @param {PWSTR} NewDN 
     * @param {PSTR} HostName 
     * @param {Integer} PortNumber 
     * @param {Pointer<Void>} SecAuthIdentity 
     * @param {Pointer<Void>} CurrentUserToken 
     * @param {Pointer<Pointer<LDAP>>} ConnectionToUse 
     * @returns {Integer} 
     */
    Call(PrimaryConnection, ReferralFromConnection, NewDN, HostName, PortNumber, SecAuthIdentity, CurrentUserToken, ConnectionToUse) {
        NewDN := NewDN is String ? StrPtr(NewDN) : NewDN
        HostName := HostName is String ? StrPtr(HostName) : HostName

        SecAuthIdentityMarshal := SecAuthIdentity is VarRef ? "ptr" : "ptr"
        CurrentUserTokenMarshal := CurrentUserToken is VarRef ? "ptr" : "ptr"
        ConnectionToUseMarshal := ConnectionToUse is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, LDAP.Ptr, PrimaryConnection, LDAP.Ptr, ReferralFromConnection, "ptr", NewDN, "ptr", HostName, UInt32, PortNumber, SecAuthIdentityMarshal, SecAuthIdentity, CurrentUserTokenMarshal, CurrentUserToken, ConnectionToUseMarshal, ConnectionToUse, UInt32)
        return result
    }

    /**
     * A QUERYFORCONNECTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends QUERYFORCONNECTION {
        /**
         * Creates a QUERYFORCONNECTION pointer that invokes the given AHK function when called.
         * @param {Func(LDAP, LDAP, PWSTR, PSTR, UInt32, "ptr", "ptr", "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [LDAP.Ptr, LDAP.Ptr, PWSTR, PSTR, UInt32, "ptr", "ptr", "ptr*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
