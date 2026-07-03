#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAILURE_TYPE.ahk" { FAILURE_TYPE }

/**
 * Reports that there was a failure in a resource instance. The PSIGNAL_FAILURE_ROUTINE type defines a pointer to this function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-psignal_failure_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSIGNAL_FAILURE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSIGNAL_FAILURE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ResourceHandle A handle to the resource instance.
     * @param {FAILURE_TYPE} FailureType A <a href="https://docs.microsoft.com/windows/desktop/api/resapi/ne-resapi-failure_type">FAILURE_TYPE</a> enumeration value that describes the failure type.
     * 
     * <b>Windows Server 2012:  </b>Not supported.
     * @param {Integer} ApplicationSpecificErrorCode An application error code.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (0), if the operation succeeds; otherwise returns a system error code.
     */
    Call(ResourceHandle, FailureType, ApplicationSpecificErrorCode) {
        result := DllCall(this.value, IntPtr, ResourceHandle, FAILURE_TYPE, FailureType, UInt32, ApplicationSpecificErrorCode, UInt32)
        return result
    }

    /**
     * A PSIGNAL_FAILURE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSIGNAL_FAILURE_ROUTINE {
        /**
         * Creates a PSIGNAL_FAILURE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, FAILURE_TYPE, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, FAILURE_TYPE, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
