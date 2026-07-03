#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Services\SC_HANDLE.ahk" { SC_HANDLE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS_EX {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS_EX) {
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
     * @param {SC_HANDLE} schSCMHandle 
     * @param {Pointer<SC_HANDLE>} phService 
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<PLOG_EVENT_ROUTINE>} pfnLogEvent 
     * @param {Pointer} hResourceHandle 
     * @returns {Integer} 
     */
    Call(pszServiceName, schSCMHandle, phService, dwDesiredAccess, pfnLogEvent, hResourceHandle) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName

        result := DllCall(this.value, "ptr", pszServiceName, SC_HANDLE, schSCMHandle, SC_HANDLE.Ptr, phService, UInt32, dwDesiredAccess, "ptr", pfnLogEvent, IntPtr, hResourceHandle, UInt32)
        return result
    }

    /**
     * A PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS_EX {
        /**
         * Creates a PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS_EX pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, SC_HANDLE, SC_HANDLE, UInt32, "ptr", IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, SC_HANDLE, SC_HANDLE.Ptr, UInt32, "ptr", IntPtr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
