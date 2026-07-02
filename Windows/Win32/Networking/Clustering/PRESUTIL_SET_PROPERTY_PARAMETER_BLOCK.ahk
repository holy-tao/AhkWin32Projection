#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK) {
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
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<Integer>} pInParams 
     * @param {Pointer<Void>} pInPropertyList 
     * @param {Integer} cbInPropertyListSize 
     * @param {Pointer<Integer>} pOutParams 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pPropertyTable, Reserved, pInParams, pInPropertyList, cbInPropertyListSize, pOutParams) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        pInParamsMarshal := pInParams is VarRef ? "char*" : "ptr"
        pInPropertyListMarshal := pInPropertyList is VarRef ? "ptr" : "ptr"
        pOutParamsMarshal := pOutParams is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTable, ReservedMarshal, Reserved, pInParamsMarshal, pInParams, pInPropertyListMarshal, pInPropertyList, UInt32, cbInPropertyListSize, pOutParamsMarshal, pOutParams, UInt32)
        return result
    }

    /**
     * A PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK {
        /**
         * Creates a PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, RESUTIL_PROPERTY_ITEM, "ptr", "char*", "ptr", UInt32, "char*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, RESUTIL_PROPERTY_ITEM.Ptr, "ptr", "char*", "ptr", UInt32, "char*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
