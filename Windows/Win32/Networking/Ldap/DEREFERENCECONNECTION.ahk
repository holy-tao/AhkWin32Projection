#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LDAP.ahk" { LDAP }

/**
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct DEREFERENCECONNECTION {
    value : IntPtr

    __value {
        set {
            if (value is DEREFERENCECONNECTION) {
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
     * @param {Pointer<LDAP>} ConnectionToDereference 
     * @returns {Integer} 
     */
    Call(PrimaryConnection, ConnectionToDereference) {
        result := DllCall(this.value, LDAP.Ptr, PrimaryConnection, LDAP.Ptr, ConnectionToDereference, UInt32)
        return result
    }

    /**
     * A DEREFERENCECONNECTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DEREFERENCECONNECTION {
        /**
         * Creates a DEREFERENCECONNECTION pointer that invokes the given AHK function when called.
         * @param {Func(LDAP, LDAP) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [LDAP.Ptr, LDAP.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
