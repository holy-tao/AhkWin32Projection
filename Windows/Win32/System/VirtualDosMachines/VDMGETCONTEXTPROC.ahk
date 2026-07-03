#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\VDMCONTEXT.ahk" { VDMCONTEXT }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @architecture X64, Arm64
 */
export default struct VDMGETCONTEXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGETCONTEXTPROC) {
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
     * @param {Pointer<VDMCONTEXT>} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, HANDLE, param0, HANDLE, param1, VDMCONTEXT.Ptr, param2, BOOL)
        return result
    }

    /**
     * A VDMGETCONTEXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGETCONTEXTPROC {
        /**
         * Creates a VDMGETCONTEXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, VDMCONTEXT) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, VDMCONTEXT.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
