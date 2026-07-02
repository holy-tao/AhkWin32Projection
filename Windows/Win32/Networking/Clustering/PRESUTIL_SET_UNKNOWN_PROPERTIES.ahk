#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_SET_UNKNOWN_PROPERTIES {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_SET_UNKNOWN_PROPERTIES) {
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
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable 
     * @param {Integer} pInPropertyList 
     * @param {Integer} cbInPropertyListSize 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pPropertyTable, pInPropertyList, cbInPropertyListSize) {
        result := DllCall(this.value, HKEY, hkeyClusterKey, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTable, IntPtr, pInPropertyList, UInt32, cbInPropertyListSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_SET_UNKNOWN_PROPERTIES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_SET_UNKNOWN_PROPERTIES {
        /**
         * Creates a PRESUTIL_SET_UNKNOWN_PROPERTIES pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, RESUTIL_PROPERTY_ITEM, IntPtr, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, RESUTIL_PROPERTY_ITEM.Ptr, IntPtr, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
