#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_BUS_SPECIFIC_RESET_INFO.ahk" { DEVICE_BUS_SPECIFIC_RESET_INFO }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_QUERY_BUS_SPECIFIC_RESET_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is DEVICE_QUERY_BUS_SPECIFIC_RESET_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} InterfaceContext 
     * @param {Pointer<Integer>} ResetInfoCount 
     * @param {Pointer<DEVICE_BUS_SPECIFIC_RESET_INFO>} ResetInfoSupported 
     * @returns {NTSTATUS} 
     */
    Call(InterfaceContext, ResetInfoCount, ResetInfoSupported) {
        InterfaceContextMarshal := InterfaceContext is VarRef ? "ptr" : "ptr"
        ResetInfoCountMarshal := ResetInfoCount is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, InterfaceContextMarshal, InterfaceContext, ResetInfoCountMarshal, ResetInfoCount, DEVICE_BUS_SPECIFIC_RESET_INFO.Ptr, ResetInfoSupported, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A DEVICE_QUERY_BUS_SPECIFIC_RESET_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DEVICE_QUERY_BUS_SPECIFIC_RESET_HANDLER {
        /**
         * Creates a DEVICE_QUERY_BUS_SPECIFIC_RESET_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*", DEVICE_BUS_SPECIFIC_RESET_INFO) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", DEVICE_BUS_SPECIFIC_RESET_INFO.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
