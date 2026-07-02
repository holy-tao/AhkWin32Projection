#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecPkgInfoA.ahk" { SecPkgInfoA }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct ENUMERATE_SECURITY_PACKAGES_FN_A {
    value : IntPtr

    __value {
        set {
            if (value is ENUMERATE_SECURITY_PACKAGES_FN_A) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Pointer<SecPkgInfoA>>} param1 
     * @returns {HRESULT} 
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * A ENUMERATE_SECURITY_PACKAGES_FN_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ENUMERATE_SECURITY_PACKAGES_FN_A {
        /**
         * Creates a ENUMERATE_SECURITY_PACKAGES_FN_A pointer that invokes the given AHK function when called.
         * @param {Func("uint*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
