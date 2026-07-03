#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct DBGPRINT {
    value : IntPtr

    __value {
        set {
            if (value is DBGPRINT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} Format 
     * @returns {Integer} 
     */
    Call(Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := DllCall(this.value, "ptr", Format, UInt32)
        return result
    }

    /**
     * A DBGPRINT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DBGPRINT {
        /**
         * Creates a DBGPRINT pointer that invokes the given AHK function when called.
         * @param {Func(PSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [PSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
