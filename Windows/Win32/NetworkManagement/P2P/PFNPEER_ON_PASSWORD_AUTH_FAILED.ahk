#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @deprecated
 */
export default struct PFNPEER_ON_PASSWORD_AUTH_FAILED {
    value : IntPtr

    __value {
        set {
            if (value is PFNPEER_ON_PASSWORD_AUTH_FAILED) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hGraph 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    Call(hGraph, pvContext) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, hGraphMarshal, hGraph, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * A PFNPEER_ON_PASSWORD_AUTH_FAILED that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNPEER_ON_PASSWORD_AUTH_FAILED {
        /**
         * Creates a PFNPEER_ON_PASSWORD_AUTH_FAILED pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
