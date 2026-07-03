#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Context.ahk" { MI_Context }
#Import ".\MI_Module_Self.ahk" { MI_Module_Self }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ProviderFT_Load {
    value : IntPtr

    __value {
        set {
            if (value is MI_ProviderFT_Load) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} self 
     * @param {Pointer<MI_Module_Self>} selfModule 
     * @param {Pointer<MI_Context>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(self, selfModule, _context) {
        selfMarshal := self is VarRef ? "ptr*" : "ptr"
        selfModuleMarshal := selfModule is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, selfMarshal, self, selfModuleMarshal, selfModule, MI_Context.Ptr, _context)
    }

    /**
     * A MI_ProviderFT_Load that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_ProviderFT_Load {
        /**
         * Creates a MI_ProviderFT_Load pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", MI_Module_Self, MI_Context) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", MI_Module_Self.Ptr, MI_Context.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
