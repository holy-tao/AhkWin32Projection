#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Context.ahk" { MI_Context }
#Import ".\MI_Instance.ahk" { MI_Instance }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ProviderFT_CreateInstance {
    value : IntPtr

    __value {
        set {
            if (value is MI_ProviderFT_CreateInstance) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} self 
     * @param {Pointer<MI_Context>} _context 
     * @param {Pointer<Integer>} nameSpace 
     * @param {Pointer<Integer>} className 
     * @param {Pointer<MI_Instance>} newInstance 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(self, _context, nameSpace, className, newInstance) {
        selfMarshal := self is VarRef ? "ptr" : "ptr"
        nameSpaceMarshal := nameSpace is VarRef ? "ushort*" : "ptr"
        classNameMarshal := className is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, selfMarshal, self, MI_Context.Ptr, _context, nameSpaceMarshal, nameSpace, classNameMarshal, className, MI_Instance.Ptr, newInstance)
    }

    /**
     * A MI_ProviderFT_CreateInstance that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_ProviderFT_CreateInstance {
        /**
         * Creates a MI_ProviderFT_CreateInstance pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MI_Context, "ushort*", "ushort*", MI_Instance) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MI_Context.Ptr, "ushort*", "ushort*", MI_Instance.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
