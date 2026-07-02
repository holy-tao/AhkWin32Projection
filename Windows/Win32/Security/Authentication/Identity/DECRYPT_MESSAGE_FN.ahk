#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct DECRYPT_MESSAGE_FN {
    value : IntPtr

    __value {
        set {
            if (value is DECRYPT_MESSAGE_FN) {
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
     * @param {Integer} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3) {
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, SecHandle.Ptr, param0, SecBufferDesc.Ptr, param1, UInt32, param2, param3Marshal, param3, "HRESULT")
        return result
    }

    /**
     * A DECRYPT_MESSAGE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DECRYPT_MESSAGE_FN {
        /**
         * Creates a DECRYPT_MESSAGE_FN pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle, SecBufferDesc, UInt32, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, SecBufferDesc.Ptr, UInt32, "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
