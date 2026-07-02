#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecPkgInfoW.ahk" { SecPkgInfoW }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
export default struct QUERY_SECURITY_PACKAGE_INFO_FN_W {
    value : IntPtr

    __value {
        set {
            if (value is QUERY_SECURITY_PACKAGE_INFO_FN_W) {
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
     * @param {Pointer<Pointer<SecPkgInfoW>>} param1 
     * @returns {HRESULT} 
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "ushort*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * A QUERY_SECURITY_PACKAGE_INFO_FN_W that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends QUERY_SECURITY_PACKAGE_INFO_FN_W {
        /**
         * Creates a QUERY_SECURITY_PACKAGE_INFO_FN_W pointer that invokes the given AHK function when called.
         * @param {Func("ushort*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ushort*", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
