#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESENUMEX.ahk" { HRESENUMEX }
#Import ".\CLUSTER_RESOURCE_ENUM_ITEM.ahk" { CLUSTER_RESOURCE_ENUM_ITEM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_RESOURCE_ENUM_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_RESOURCE_ENUM_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESENUMEX} hResourceEnumEx 
     * @param {Integer} dwIndex 
     * @param {Pointer<CLUSTER_RESOURCE_ENUM_ITEM>} pItem 
     * @param {Pointer<Integer>} cbItem 
     * @returns {Integer} 
     */
    Call(hResourceEnumEx, dwIndex, pItem, cbItem) {
        cbItemMarshal := cbItem is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HRESENUMEX, hResourceEnumEx, UInt32, dwIndex, CLUSTER_RESOURCE_ENUM_ITEM.Ptr, pItem, cbItemMarshal, cbItem, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_RESOURCE_ENUM_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_RESOURCE_ENUM_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_RESOURCE_ENUM_EX pointer that invokes the given AHK function when called.
         * @param {Func(HRESENUMEX, UInt32, CLUSTER_RESOURCE_ENUM_ITEM, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESENUMEX, UInt32, CLUSTER_RESOURCE_ENUM_ITEM.Ptr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
