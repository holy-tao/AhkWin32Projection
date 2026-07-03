#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MapiRecipDesc.ahk" { MapiRecipDesc }

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPIDETAILS {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPIDETAILS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} lhSession 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<MapiRecipDesc>} lpRecip 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, lpRecip, flFlags, ulReserved) {
        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, MapiRecipDesc.Ptr, lpRecip, UInt32, flFlags, UInt32, ulReserved, UInt32)
        return result
    }

    /**
     * A LPMAPIDETAILS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPIDETAILS {
        /**
         * Creates a LPMAPIDETAILS pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, MapiRecipDesc, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, MapiRecipDesc.Ptr, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
