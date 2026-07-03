#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_SET_PRIVATE_PROPERTY_LIST {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_SET_PRIVATE_PROPERTY_LIST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HKEY} hkeyClusterKey 
     * @param {Integer} pInPropertyList 
     * @param {Integer} cbInPropertyListSize 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pInPropertyList, cbInPropertyListSize) {
        result := DllCall(this.value, HKEY, hkeyClusterKey, IntPtr, pInPropertyList, UInt32, cbInPropertyListSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_SET_PRIVATE_PROPERTY_LIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_SET_PRIVATE_PROPERTY_LIST {
        /**
         * Creates a PRESUTIL_SET_PRIVATE_PROPERTY_LIST pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, IntPtr, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, IntPtr, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
