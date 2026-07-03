#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import ".\MQMSGPROPS.ahk" { MQMSGPROPS }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct PMQRECEIVECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PMQRECEIVECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @param {Pointer} hSource 
     * @param {Integer} dwTimeout 
     * @param {Integer} dwAction 
     * @param {Pointer<MQMSGPROPS>} pMessageProps 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {HANDLE} _hCursor 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hrStatus, hSource, dwTimeout, dwAction, pMessageProps, lpOverlapped, _hCursor) {
        DllCall(this.value, "int", hrStatus, IntPtr, hSource, UInt32, dwTimeout, UInt32, dwAction, MQMSGPROPS.Ptr, pMessageProps, OVERLAPPED.Ptr, lpOverlapped, HANDLE, _hCursor)
    }

    /**
     * A PMQRECEIVECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMQRECEIVECALLBACK {
        /**
         * Creates a PMQRECEIVECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("int", IntPtr, UInt32, UInt32, MQMSGPROPS, OVERLAPPED, HANDLE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int", IntPtr, UInt32, UInt32, MQMSGPROPS.Ptr, OVERLAPPED.Ptr, HANDLE, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
