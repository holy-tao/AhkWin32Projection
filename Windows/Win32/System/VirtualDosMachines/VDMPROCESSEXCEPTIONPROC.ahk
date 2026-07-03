#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Diagnostics\Debug\DEBUG_EVENT.ahk" { DEBUG_EVENT }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMPROCESSEXCEPTIONPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMPROCESSEXCEPTIONPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEBUG_EVENT>} param0 
     * @returns {BOOL} 
     */
    Call(param0) {
        result := DllCall(this.value, DEBUG_EVENT.Ptr, param0, BOOL)
        return result
    }

    /**
     * A VDMPROCESSEXCEPTIONPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMPROCESSEXCEPTIONPROC {
        /**
         * Creates a VDMPROCESSEXCEPTIONPROC pointer that invokes the given AHK function when called.
         * @param {Func(DEBUG_EVENT) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEBUG_EVENT.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
