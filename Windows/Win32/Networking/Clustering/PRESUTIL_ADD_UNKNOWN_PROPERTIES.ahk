#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_ADD_UNKNOWN_PROPERTIES {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_ADD_UNKNOWN_PROPERTIES) {
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
     * @param {Pointer<Void>} pOutPropertyList 
     * @param {Integer} pcbOutPropertyListSize 
     * @param {Pointer<Integer>} pcbBytesReturned 
     * @param {Pointer<Integer>} pcbRequired 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pPropertyTable, pOutPropertyList, pcbOutPropertyListSize, pcbBytesReturned, pcbRequired) {
        pOutPropertyListMarshal := pOutPropertyList is VarRef ? "ptr" : "ptr"
        pcbBytesReturnedMarshal := pcbBytesReturned is VarRef ? "uint*" : "ptr"
        pcbRequiredMarshal := pcbRequired is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTable, pOutPropertyListMarshal, pOutPropertyList, UInt32, pcbOutPropertyListSize, pcbBytesReturnedMarshal, pcbBytesReturned, pcbRequiredMarshal, pcbRequired, UInt32)
        return result
    }

    /**
     * A PRESUTIL_ADD_UNKNOWN_PROPERTIES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_ADD_UNKNOWN_PROPERTIES {
        /**
         * Creates a PRESUTIL_ADD_UNKNOWN_PROPERTIES pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, RESUTIL_PROPERTY_ITEM, "ptr", UInt32, "uint*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, RESUTIL_PROPERTY_ITEM.Ptr, "ptr", UInt32, "uint*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
