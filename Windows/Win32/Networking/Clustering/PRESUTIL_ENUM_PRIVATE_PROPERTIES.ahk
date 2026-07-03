#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_ENUM_PRIVATE_PROPERTIES {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_ENUM_PRIVATE_PROPERTIES) {
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
     * @param {Integer} pszOutProperties 
     * @param {Integer} cbOutPropertiesSize 
     * @param {Pointer<Integer>} pcbBytesReturned 
     * @param {Pointer<Integer>} pcbRequired 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pszOutProperties, cbOutPropertiesSize, pcbBytesReturned, pcbRequired) {
        pcbBytesReturnedMarshal := pcbBytesReturned is VarRef ? "uint*" : "ptr"
        pcbRequiredMarshal := pcbRequired is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, IntPtr, pszOutProperties, UInt32, cbOutPropertiesSize, pcbBytesReturnedMarshal, pcbBytesReturned, pcbRequiredMarshal, pcbRequired, UInt32)
        return result
    }

    /**
     * A PRESUTIL_ENUM_PRIVATE_PROPERTIES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_ENUM_PRIVATE_PROPERTIES {
        /**
         * Creates a PRESUTIL_ENUM_PRIVATE_PROPERTIES pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, IntPtr, UInt32, "uint*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, IntPtr, UInt32, "uint*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
