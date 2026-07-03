#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UErrorCode.ahk" { UErrorCode }
#Import ".\UText.ahk" { UText }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTextExtract {
    value : IntPtr

    __value {
        set {
            if (value is UTextExtract) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UText>} ut 
     * @param {Integer} nativeStart 
     * @param {Integer} nativeLimit 
     * @param {Pointer<Integer>} dest 
     * @param {Integer} destCapacity 
     * @param {Pointer<UErrorCode>} _status 
     * @returns {Integer} 
     */
    Call(ut, nativeStart, nativeLimit, dest, destCapacity, _status) {
        destMarshal := dest is VarRef ? "ushort*" : "ptr"
        _statusMarshal := _status is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UText.Ptr, ut, Int64, nativeStart, Int64, nativeLimit, destMarshal, dest, Int32, destCapacity, _statusMarshal, _status, Int32)
        return result
    }

    /**
     * A UTextExtract that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTextExtract {
        /**
         * Creates a UTextExtract pointer that invokes the given AHK function when called.
         * @param {Func(UText, Int64, Int64, "ushort*", Int32, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UText.Ptr, Int64, Int64, "ushort*", Int32, "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
