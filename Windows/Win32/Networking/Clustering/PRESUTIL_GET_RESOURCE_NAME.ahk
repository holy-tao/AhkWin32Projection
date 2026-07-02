#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_RESOURCE_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_RESOURCE_NAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESOURCE} _hResource 
     * @param {PWSTR} pszResourceName 
     * @param {Pointer<Integer>} pcchResourceNameInOut 
     * @returns {Integer} 
     */
    Call(_hResource, pszResourceName, pcchResourceNameInOut) {
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName

        pcchResourceNameInOutMarshal := pcchResourceNameInOut is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HRESOURCE, _hResource, "ptr", pszResourceName, pcchResourceNameInOutMarshal, pcchResourceNameInOut, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_RESOURCE_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_RESOURCE_NAME {
        /**
         * Creates a PRESUTIL_GET_RESOURCE_NAME pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, PWSTR, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
