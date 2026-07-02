#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_PROPERTY_FORMATS {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_PROPERTY_FORMATS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable 
     * @param {Integer} pOutPropertyFormatList 
     * @param {Integer} cbPropertyFormatListSize 
     * @param {Pointer<Integer>} pcbBytesReturned 
     * @param {Pointer<Integer>} pcbRequired 
     * @returns {Integer} 
     */
    Call(pPropertyTable, pOutPropertyFormatList, cbPropertyFormatListSize, pcbBytesReturned, pcbRequired) {
        pcbBytesReturnedMarshal := pcbBytesReturned is VarRef ? "uint*" : "ptr"
        pcbRequiredMarshal := pcbRequired is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTable, IntPtr, pOutPropertyFormatList, UInt32, cbPropertyFormatListSize, pcbBytesReturnedMarshal, pcbBytesReturned, pcbRequiredMarshal, pcbRequired, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_PROPERTY_FORMATS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_PROPERTY_FORMATS {
        /**
         * Creates a PRESUTIL_GET_PROPERTY_FORMATS pointer that invokes the given AHK function when called.
         * @param {Func(RESUTIL_PROPERTY_ITEM, IntPtr, UInt32, "uint*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RESUTIL_PROPERTY_ITEM.Ptr, IntPtr, UInt32, "uint*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
