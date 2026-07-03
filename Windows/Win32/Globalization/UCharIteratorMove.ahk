#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UCharIterator.ahk" { UCharIterator }
#Import ".\UCharIteratorOrigin.ahk" { UCharIteratorOrigin }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCharIteratorMove {
    value : IntPtr

    __value {
        set {
            if (value is UCharIteratorMove) {
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
     * @param {Integer} delta 
     * @param {UCharIteratorOrigin} origin 
     * @returns {Integer} 
     */
    Call(iter, delta, origin) {
        result := DllCall(this.value, UCharIterator.Ptr, iter, Int32, delta, UCharIteratorOrigin, origin, Int32)
        return result
    }

    /**
     * A UCharIteratorMove that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UCharIteratorMove {
        /**
         * Creates a UCharIteratorMove pointer that invokes the given AHK function when called.
         * @param {Func(UCharIterator, Int32, UCharIteratorOrigin) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UCharIterator.Ptr, Int32, UCharIteratorOrigin, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
