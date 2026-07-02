#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct ACCEPT_SECURITY_CONTEXT_FN {
    value : IntPtr

    __value {
        set {
            if (value is ACCEPT_SECURITY_CONTEXT_FN) {
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
     * @param {Pointer<SecHandle>} param1 
     * @param {Pointer<SecBufferDesc>} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Pointer<SecHandle>} param5 
     * @param {Pointer<SecBufferDesc>} param6 
     * @param {Pointer<Integer>} param7 
     * @param {Pointer<Integer>} param8 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8) {
        param7Marshal := param7 is VarRef ? "uint*" : "ptr"
        param8Marshal := param8 is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, SecHandle.Ptr, param0, SecHandle.Ptr, param1, SecBufferDesc.Ptr, param2, UInt32, param3, UInt32, param4, SecHandle.Ptr, param5, SecBufferDesc.Ptr, param6, param7Marshal, param7, param8Marshal, param8, "HRESULT")
        return result
    }

    /**
     * A ACCEPT_SECURITY_CONTEXT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ACCEPT_SECURITY_CONTEXT_FN {
        /**
         * Creates a ACCEPT_SECURITY_CONTEXT_FN pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle, SecHandle, SecBufferDesc, UInt32, UInt32, SecHandle, SecBufferDesc, "uint*", "int64*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, SecHandle.Ptr, SecBufferDesc.Ptr, UInt32, UInt32, SecHandle.Ptr, SecBufferDesc.Ptr, "uint*", "int64*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
