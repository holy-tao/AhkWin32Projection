#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_GROUP_ENUM_ITEM.ahk" { CLUSTER_GROUP_ENUM_ITEM }
#Import ".\HGROUPENUMEX.ahk" { HGROUPENUMEX }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_GROUP_ENUM_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_GROUP_ENUM_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUPENUMEX} _hGroupEnumEx 
     * @param {Integer} dwIndex 
     * @param {Pointer<CLUSTER_GROUP_ENUM_ITEM>} pItem 
     * @param {Pointer<Integer>} cbItem 
     * @returns {Integer} 
     */
    Call(_hGroupEnumEx, dwIndex, pItem, cbItem) {
        cbItemMarshal := cbItem is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HGROUPENUMEX, _hGroupEnumEx, UInt32, dwIndex, CLUSTER_GROUP_ENUM_ITEM.Ptr, pItem, cbItemMarshal, cbItem, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_GROUP_ENUM_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_GROUP_ENUM_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_GROUP_ENUM_EX pointer that invokes the given AHK function when called.
         * @param {Func(HGROUPENUMEX, UInt32, CLUSTER_GROUP_ENUM_ITEM, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUPENUMEX, UInt32, CLUSTER_GROUP_ENUM_ITEM.Ptr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
