#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HAL_QUERY_INFORMATION_CLASS.ahk" { HAL_QUERY_INFORMATION_CLASS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalQuerySystemInformation {
    value : IntPtr

    __value {
        set {
            if (value is pHalQuerySystemInformation) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HAL_QUERY_INFORMATION_CLASS} InformationClass 
     * @param {Integer} BufferSize 
     * @param {Integer} _Buffer 
     * @param {Pointer<Integer>} ReturnedLength 
     * @returns {NTSTATUS} 
     */
    Call(InformationClass, BufferSize, _Buffer, ReturnedLength) {
        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HAL_QUERY_INFORMATION_CLASS, InformationClass, UInt32, BufferSize, IntPtr, _Buffer, ReturnedLengthMarshal, ReturnedLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A pHalQuerySystemInformation that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalQuerySystemInformation {
        /**
         * Creates a pHalQuerySystemInformation pointer that invokes the given AHK function when called.
         * @param {Func(HAL_QUERY_INFORMATION_CLASS, UInt32, IntPtr, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HAL_QUERY_INFORMATION_CLASS, UInt32, IntPtr, "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
