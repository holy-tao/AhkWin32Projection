#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
export default struct INITIALIZE_SECURITY_CONTEXT_FN_W {
    value : IntPtr

    __value {
        set {
            if (value is INITIALIZE_SECURITY_CONTEXT_FN_W) {
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
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Integer} param5 
     * @param {Pointer<SecBufferDesc>} param6 
     * @param {Integer} param7 
     * @param {Pointer<SecHandle>} param8 
     * @param {Pointer<SecBufferDesc>} param9 
     * @param {Pointer<Integer>} param10 
     * @param {Pointer<Integer>} param11 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11) {
        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"
        param10Marshal := param10 is VarRef ? "uint*" : "ptr"
        param11Marshal := param11 is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, SecHandle.Ptr, param0, SecHandle.Ptr, param1, param2Marshal, param2, UInt32, param3, UInt32, param4, UInt32, param5, SecBufferDesc.Ptr, param6, UInt32, param7, SecHandle.Ptr, param8, SecBufferDesc.Ptr, param9, param10Marshal, param10, param11Marshal, param11, "HRESULT")
        return result
    }

    /**
     * A INITIALIZE_SECURITY_CONTEXT_FN_W that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends INITIALIZE_SECURITY_CONTEXT_FN_W {
        /**
         * Creates a INITIALIZE_SECURITY_CONTEXT_FN_W pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle, SecHandle, "ushort*", UInt32, UInt32, UInt32, SecBufferDesc, UInt32, SecHandle, SecBufferDesc, "uint*", "int64*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 12)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 12 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, SecHandle.Ptr, "ushort*", UInt32, UInt32, UInt32, SecBufferDesc.Ptr, UInt32, SecHandle.Ptr, SecBufferDesc.Ptr, "uint*", "int64*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
