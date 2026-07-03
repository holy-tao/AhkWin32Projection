#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\STACK_SYM_FRAME_INFO.ahk" { STACK_SYM_FRAME_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_STACK_PROVIDER_FREESTACKSYMFRAMES {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_STACK_PROVIDER_FREESTACKSYMFRAMES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<STACK_SYM_FRAME_INFO>} StackSymFrames 
     * @returns {HRESULT} 
     */
    Call(StackSymFrames) {
        result := DllCall(this.value, STACK_SYM_FRAME_INFO.Ptr, StackSymFrames, "HRESULT")
        return result
    }

    /**
     * A PDEBUG_STACK_PROVIDER_FREESTACKSYMFRAMES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_STACK_PROVIDER_FREESTACKSYMFRAMES {
        /**
         * Creates a PDEBUG_STACK_PROVIDER_FREESTACKSYMFRAMES pointer that invokes the given AHK function when called.
         * @param {Func(STACK_SYM_FRAME_INFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [STACK_SYM_FRAME_INFO.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
