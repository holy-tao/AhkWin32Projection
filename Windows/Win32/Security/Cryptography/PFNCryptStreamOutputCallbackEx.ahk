#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\NCRYPT_DESCRIPTOR_HANDLE.ahk" { NCRYPT_DESCRIPTOR_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFNCryptStreamOutputCallbackEx {
    value : IntPtr

    __value {
        set {
            if (value is PFNCryptStreamOutputCallbackEx) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvCallbackCtxt 
     * @param {Integer} pbData 
     * @param {Pointer} cbData 
     * @param {NCRYPT_DESCRIPTOR_HANDLE} hDescriptor 
     * @param {BOOL} fFinal 
     * @returns {HRESULT} 
     */
    Call(pvCallbackCtxt, pbData, cbData, hDescriptor, fFinal) {
        pvCallbackCtxtMarshal := pvCallbackCtxt is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvCallbackCtxtMarshal, pvCallbackCtxt, IntPtr, pbData, IntPtr, cbData, NCRYPT_DESCRIPTOR_HANDLE, hDescriptor, BOOL, fFinal, "HRESULT")
        return result
    }

    /**
     * A PFNCryptStreamOutputCallbackEx that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCryptStreamOutputCallbackEx {
        /**
         * Creates a PFNCryptStreamOutputCallbackEx pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, IntPtr, NCRYPT_DESCRIPTOR_HANDLE, BOOL) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, IntPtr, NCRYPT_DESCRIPTOR_HANDLE, BOOL, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
