#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\VDMLDT_ENTRY.ahk" { VDMLDT_ENTRY }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @architecture X64, Arm64
 */
export default struct VDMGETTHREADSELECTORENTRYPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGETTHREADSELECTORENTRYPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {HANDLE} param1 
     * @param {Integer} param2 
     * @param {Pointer<VDMLDT_ENTRY>} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, HANDLE, param0, HANDLE, param1, UInt32, param2, VDMLDT_ENTRY.Ptr, param3, BOOL)
        return result
    }

    /**
     * A VDMGETTHREADSELECTORENTRYPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGETTHREADSELECTORENTRYPROC {
        /**
         * Creates a VDMGETTHREADSELECTORENTRYPROC pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt32, VDMLDT_ENTRY) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt32, VDMLDT_ENTRY.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
