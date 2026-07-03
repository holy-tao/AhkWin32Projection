#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSTEM_FIRMWARE_TABLE_INFORMATION.ahk" { SYSTEM_FIRMWARE_TABLE_INFORMATION }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFNFTH {
    value : IntPtr

    __value {
        set {
            if (value is PFNFTH) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SYSTEM_FIRMWARE_TABLE_INFORMATION>} SystemFirmwareTableInfo 
     * @returns {NTSTATUS} 
     */
    Call(SystemFirmwareTableInfo) {
        result := DllCall(this.value, SYSTEM_FIRMWARE_TABLE_INFORMATION.Ptr, SystemFirmwareTableInfo, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFNFTH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFTH {
        /**
         * Creates a PFNFTH pointer that invokes the given AHK function when called.
         * @param {Func(SYSTEM_FIRMWARE_TABLE_INFORMATION) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [SYSTEM_FIRMWARE_TABLE_INFORMATION.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
