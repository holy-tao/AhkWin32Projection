#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UCharIterator.ahk" { UCharIterator }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCharIteratorCurrent {
    value : IntPtr

    __value {
        set {
            if (value is UCharIteratorCurrent) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UCharIterator>} iter 
     * @returns {Integer} 
     */
    Call(iter) {
        result := DllCall(this.value, UCharIterator.Ptr, iter, Int32)
        return result
    }

    /**
     * A UCharIteratorCurrent that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UCharIteratorCurrent {
        /**
         * Creates a UCharIteratorCurrent pointer that invokes the given AHK function when called.
         * @param {Func(UCharIterator) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UCharIterator.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
