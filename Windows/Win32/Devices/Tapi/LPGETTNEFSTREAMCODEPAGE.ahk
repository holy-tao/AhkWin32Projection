#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IStream.ahk" { IStream }

/**
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LPGETTNEFSTREAMCODEPAGE {
    value : IntPtr

    __value {
        set {
            if (value is LPGETTNEFSTREAMCODEPAGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IStream} lpStream 
     * @param {Pointer<Integer>} lpulCodepage 
     * @param {Pointer<Integer>} lpulSubCodepage 
     * @returns {HRESULT} 
     */
    Call(lpStream, lpulCodepage, lpulSubCodepage) {
        lpulCodepageMarshal := lpulCodepage is VarRef ? "uint*" : "ptr"
        lpulSubCodepageMarshal := lpulSubCodepage is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpStream, lpulCodepageMarshal, lpulCodepage, lpulSubCodepageMarshal, lpulSubCodepage, "HRESULT")
        return result
    }

    /**
     * A LPGETTNEFSTREAMCODEPAGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPGETTNEFSTREAMCODEPAGE {
        /**
         * Creates a LPGETTNEFSTREAMCODEPAGE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
