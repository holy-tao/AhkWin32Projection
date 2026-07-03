#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNCERTSRVBACKUPREAD {
    value : IntPtr

    __value {
        set {
            if (value is FNCERTSRVBACKUPREAD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hbc 
     * @param {Pointer<Void>} pvBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} 
     */
    Call(hbc, pvBuffer, cbBuffer, pcbRead) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
        pvBufferMarshal := pvBuffer is VarRef ? "ptr" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, hbcMarshal, hbc, pvBufferMarshal, pvBuffer, UInt32, cbBuffer, pcbReadMarshal, pcbRead, "HRESULT")
        return result
    }

    /**
     * A FNCERTSRVBACKUPREAD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNCERTSRVBACKUPREAD {
        /**
         * Creates a FNCERTSRVBACKUPREAD pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32, "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
