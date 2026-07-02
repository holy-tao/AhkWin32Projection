#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_PROPERTY) {
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
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTableItem 
     * @param {Integer} pOutPropertyItem 
     * @param {Pointer<Integer>} pcbOutPropertyItemSize 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pPropertyTableItem, pOutPropertyItem, pcbOutPropertyItemSize) {
        pcbOutPropertyItemSizeMarshal := pcbOutPropertyItemSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTableItem, IntPtr, pOutPropertyItem, pcbOutPropertyItemSizeMarshal, pcbOutPropertyItemSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_PROPERTY {
        /**
         * Creates a PRESUTIL_GET_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, RESUTIL_PROPERTY_ITEM, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, RESUTIL_PROPERTY_ITEM.Ptr, IntPtr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
