#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_FIND_FILETIME_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_FIND_FILETIME_PROPERTY) {
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
     * @param {Pointer<FILETIME>} pftPropertyValue 
     * @returns {Integer} 
     */
    Call(pPropertyList, cbPropertyListSize, pszPropertyName, pftPropertyValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall(this.value, IntPtr, pPropertyList, UInt32, cbPropertyListSize, "ptr", pszPropertyName, FILETIME.Ptr, pftPropertyValue, UInt32)
        return result
    }

    /**
     * A PRESUTIL_FIND_FILETIME_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_FIND_FILETIME_PROPERTY {
        /**
         * Creates a PRESUTIL_FIND_FILETIME_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, PWSTR, FILETIME) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, PWSTR, FILETIME.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
