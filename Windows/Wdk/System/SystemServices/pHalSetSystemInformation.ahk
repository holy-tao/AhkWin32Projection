#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HAL_SET_INFORMATION_CLASS.ahk" { HAL_SET_INFORMATION_CLASS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalSetSystemInformation {
    value : IntPtr

    __value {
        set {
            if (value is pHalSetSystemInformation) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HAL_SET_INFORMATION_CLASS} InformationClass 
     * @param {Integer} BufferSize 
     * @param {Pointer<Void>} _Buffer 
     * @returns {NTSTATUS} 
     */
    Call(InformationClass, BufferSize, _Buffer) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HAL_SET_INFORMATION_CLASS, InformationClass, UInt32, BufferSize, _BufferMarshal, _Buffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A pHalSetSystemInformation that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalSetSystemInformation {
        /**
         * Creates a pHalSetSystemInformation pointer that invokes the given AHK function when called.
         * @param {Func(HAL_SET_INFORMATION_CLASS, UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HAL_SET_INFORMATION_CLASS, UInt32, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
