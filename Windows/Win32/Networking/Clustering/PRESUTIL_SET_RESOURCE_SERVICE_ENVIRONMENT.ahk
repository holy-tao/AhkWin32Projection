#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_SET_RESOURCE_SERVICE_ENVIRONMENT {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_SET_RESOURCE_SERVICE_ENVIRONMENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszServiceName 
     * @param {HRESOURCE} _hResource 
     * @param {Pointer<PLOG_EVENT_ROUTINE>} pfnLogEvent 
     * @param {Pointer} hResourceHandle 
     * @returns {Integer} 
     */
    Call(pszServiceName, _hResource, pfnLogEvent, hResourceHandle) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName

        result := DllCall(this.value, "ptr", pszServiceName, HRESOURCE, _hResource, "ptr", pfnLogEvent, IntPtr, hResourceHandle, UInt32)
        return result
    }

    /**
     * A PRESUTIL_SET_RESOURCE_SERVICE_ENVIRONMENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_SET_RESOURCE_SERVICE_ENVIRONMENT {
        /**
         * Creates a PRESUTIL_SET_RESOURCE_SERVICE_ENVIRONMENT pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, HRESOURCE, "ptr", IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, HRESOURCE, "ptr", IntPtr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
