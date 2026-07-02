#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UCharIteratorOrigin.ahk" { UCharIteratorOrigin }
#Import ".\UCharIterator.ahk" { UCharIterator }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCharIteratorGetIndex {
    value : IntPtr

    __value {
        set {
            if (value is UCharIteratorGetIndex) {
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
     * @param {UCharIteratorOrigin} origin 
     * @returns {Integer} 
     */
    Call(iter, origin) {
        result := DllCall(this.value, UCharIterator.Ptr, iter, UCharIteratorOrigin, origin, Int32)
        return result
    }

    /**
     * A UCharIteratorGetIndex that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UCharIteratorGetIndex {
        /**
         * Creates a UCharIteratorGetIndex pointer that invokes the given AHK function when called.
         * @param {Func(UCharIterator, UCharIteratorOrigin) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UCharIterator.Ptr, UCharIteratorOrigin, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
