#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Context.ahk" { MI_Context }
#Import ".\MI_Module_Self.ahk" { MI_Module_Self }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Module_Load {
    value : IntPtr

    __value {
        set {
            if (value is MI_Module_Load) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<MI_Module_Self>>} self 
     * @param {Pointer<MI_Context>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(self, _context) {
        selfMarshal := self is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, selfMarshal, self, MI_Context.Ptr, _context)
    }

    /**
     * A MI_Module_Load that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_Module_Load {
        /**
         * Creates a MI_Module_Load pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", MI_Context) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", MI_Context.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
