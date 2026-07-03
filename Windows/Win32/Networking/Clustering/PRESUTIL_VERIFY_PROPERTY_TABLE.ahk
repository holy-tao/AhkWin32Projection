#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_VERIFY_PROPERTY_TABLE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_VERIFY_PROPERTY_TABLE) {
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
     * @param {BOOL} bAllowUnknownProperties 
     * @param {Integer} pInPropertyList 
     * @param {Integer} cbInPropertyListSize 
     * @param {Pointer<Integer>} pOutParams 
     * @returns {Integer} 
     */
    Call(pPropertyTable, bAllowUnknownProperties, pInPropertyList, cbInPropertyListSize, pOutParams) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        pOutParamsMarshal := pOutParams is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTable, "ptr", Reserved, BOOL, bAllowUnknownProperties, IntPtr, pInPropertyList, UInt32, cbInPropertyListSize, pOutParamsMarshal, pOutParams, UInt32)
        return result
    }

    /**
     * A PRESUTIL_VERIFY_PROPERTY_TABLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_VERIFY_PROPERTY_TABLE {
        /**
         * Creates a PRESUTIL_VERIFY_PROPERTY_TABLE pointer that invokes the given AHK function when called.
         * @param {Func(RESUTIL_PROPERTY_ITEM, BOOL, IntPtr, UInt32, "char*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RESUTIL_PROPERTY_ITEM.Ptr, BOOL, IntPtr, UInt32, "char*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
