#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LDAP.ahk" { LDAP }

/**
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct NOTIFYOFNEWCONNECTION {
    value : IntPtr

    __value {
        set {
            if (value is NOTIFYOFNEWCONNECTION) {
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
     * @param {Pointer<LDAP>} NewConnection 
     * @param {Integer} PortNumber 
     * @param {Pointer<Void>} SecAuthIdentity 
     * @param {Pointer<Void>} CurrentUser 
     * @param {Integer} ErrorCodeFromBind 
     * @returns {BOOLEAN} 
     */
    Call(PrimaryConnection, ReferralFromConnection, NewDN, HostName, NewConnection, PortNumber, SecAuthIdentity, CurrentUser, ErrorCodeFromBind) {
        NewDN := NewDN is String ? StrPtr(NewDN) : NewDN
        HostName := HostName is String ? StrPtr(HostName) : HostName

        SecAuthIdentityMarshal := SecAuthIdentity is VarRef ? "ptr" : "ptr"
        CurrentUserMarshal := CurrentUser is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, LDAP.Ptr, PrimaryConnection, LDAP.Ptr, ReferralFromConnection, "ptr", NewDN, "ptr", HostName, LDAP.Ptr, NewConnection, UInt32, PortNumber, SecAuthIdentityMarshal, SecAuthIdentity, CurrentUserMarshal, CurrentUser, UInt32, ErrorCodeFromBind, BOOLEAN)
        return result
    }

    /**
     * A NOTIFYOFNEWCONNECTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NOTIFYOFNEWCONNECTION {
        /**
         * Creates a NOTIFYOFNEWCONNECTION pointer that invokes the given AHK function when called.
         * @param {Func(LDAP, LDAP, PWSTR, PSTR, LDAP, UInt32, "ptr", "ptr", UInt32) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [LDAP.Ptr, LDAP.Ptr, PWSTR, PSTR, LDAP.Ptr, UInt32, "ptr", "ptr", UInt32, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
