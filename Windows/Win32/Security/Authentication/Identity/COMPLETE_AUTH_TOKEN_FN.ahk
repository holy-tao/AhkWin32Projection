#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct COMPLETE_AUTH_TOKEN_FN {
    value : IntPtr

    __value {
        set {
            if (value is COMPLETE_AUTH_TOKEN_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SecHandle>} param0 
     * @param {Pointer<SecBufferDesc>} param1 
     * @returns {HRESULT} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, SecHandle.Ptr, param0, SecBufferDesc.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * A COMPLETE_AUTH_TOKEN_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends COMPLETE_AUTH_TOKEN_FN {
        /**
         * Creates a COMPLETE_AUTH_TOKEN_FN pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle, SecBufferDesc) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, SecBufferDesc.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
