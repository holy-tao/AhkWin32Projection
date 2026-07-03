#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_VERIFY_PRIVATE_PROPERTY_LIST {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_VERIFY_PRIVATE_PROPERTY_LIST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} pInPropertyList 
     * @param {Integer} cbInPropertyListSize 
     * @returns {Integer} 
     */
    Call(pInPropertyList, cbInPropertyListSize) {
        result := DllCall(this.value, IntPtr, pInPropertyList, UInt32, cbInPropertyListSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_VERIFY_PRIVATE_PROPERTY_LIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_VERIFY_PRIVATE_PROPERTY_LIST {
        /**
         * Creates a PRESUTIL_VERIFY_PRIVATE_PROPERTY_LIST pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
