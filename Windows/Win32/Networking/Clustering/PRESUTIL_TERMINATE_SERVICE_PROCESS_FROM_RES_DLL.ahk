#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\PLOG_EVENT_ROUTINE.ahk" { PLOG_EVENT_ROUTINE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_TERMINATE_SERVICE_PROCESS_FROM_RES_DLL {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_TERMINATE_SERVICE_PROCESS_FROM_RES_DLL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwServicePid 
     * @param {BOOL} bOffline 
     * @param {Pointer<Integer>} pdwResourceState 
     * @param {Pointer<PLOG_EVENT_ROUTINE>} pfnLogEvent 
     * @param {Pointer} hResourceHandle 
     * @returns {Integer} 
     */
    Call(dwServicePid, bOffline, pdwResourceState, pfnLogEvent, hResourceHandle) {
        pdwResourceStateMarshal := pdwResourceState is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, dwServicePid, BOOL, bOffline, pdwResourceStateMarshal, pdwResourceState, PLOG_EVENT_ROUTINE, pfnLogEvent, IntPtr, hResourceHandle, UInt32)
        return result
    }

    /**
     * A PRESUTIL_TERMINATE_SERVICE_PROCESS_FROM_RES_DLL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_TERMINATE_SERVICE_PROCESS_FROM_RES_DLL {
        /**
         * Creates a PRESUTIL_TERMINATE_SERVICE_PROCESS_FROM_RES_DLL pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, BOOL, "uint*", PLOG_EVENT_ROUTINE, IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, BOOL, "uint*", PLOG_EVENT_ROUTINE, IntPtr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
