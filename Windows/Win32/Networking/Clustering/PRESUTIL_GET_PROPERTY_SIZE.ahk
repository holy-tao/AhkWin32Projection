#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_PROPERTY_SIZE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_PROPERTY_SIZE) {
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
     * @param {Pointer<Integer>} pcbOutPropertyListSize 
     * @param {Pointer<Integer>} pnPropertyCount 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pPropertyTableItem, pcbOutPropertyListSize, pnPropertyCount) {
        pcbOutPropertyListSizeMarshal := pcbOutPropertyListSize is VarRef ? "uint*" : "ptr"
        pnPropertyCountMarshal := pnPropertyCount is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTableItem, pcbOutPropertyListSizeMarshal, pcbOutPropertyListSize, pnPropertyCountMarshal, pnPropertyCount, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_PROPERTY_SIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_PROPERTY_SIZE {
        /**
         * Creates a PRESUTIL_GET_PROPERTY_SIZE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, RESUTIL_PROPERTY_ITEM, "uint*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, RESUTIL_PROPERTY_ITEM.Ptr, "uint*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
