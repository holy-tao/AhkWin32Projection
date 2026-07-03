#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_FIND_BINARY_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_FIND_BINARY_PROPERTY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} pPropertyList 
     * @param {Integer} cbPropertyListSize 
     * @param {PWSTR} pszPropertyName 
     * @param {Pointer<Pointer<Integer>>} pbPropertyValue 
     * @param {Pointer<Integer>} pcbPropertyValueSize 
     * @returns {Integer} 
     */
    Call(pPropertyList, cbPropertyListSize, pszPropertyName, pbPropertyValue, pcbPropertyValueSize) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        pbPropertyValueMarshal := pbPropertyValue is VarRef ? "ptr*" : "ptr"
        pcbPropertyValueSizeMarshal := pcbPropertyValueSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, pPropertyList, UInt32, cbPropertyListSize, "ptr", pszPropertyName, pbPropertyValueMarshal, pbPropertyValue, pcbPropertyValueSizeMarshal, pcbPropertyValueSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_FIND_BINARY_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_FIND_BINARY_PROPERTY {
        /**
         * Creates a PRESUTIL_FIND_BINARY_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, PWSTR, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, PWSTR, "ptr*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
