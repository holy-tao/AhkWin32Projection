#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Context.ahk" { MI_Context }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ProviderFT_DisableIndications {
    value : IntPtr

    __value {
        set {
            if (value is MI_ProviderFT_DisableIndications) {
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
     * @param {Pointer<MI_Context>} indicationsContext 
     * @param {Pointer<Integer>} nameSpace 
     * @param {Pointer<Integer>} className 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(self, indicationsContext, nameSpace, className) {
        selfMarshal := self is VarRef ? "ptr" : "ptr"
        nameSpaceMarshal := nameSpace is VarRef ? "ushort*" : "ptr"
        classNameMarshal := className is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, selfMarshal, self, MI_Context.Ptr, indicationsContext, nameSpaceMarshal, nameSpace, classNameMarshal, className)
    }

    /**
     * A MI_ProviderFT_DisableIndications that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_ProviderFT_DisableIndications {
        /**
         * Creates a MI_ProviderFT_DisableIndications pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MI_Context, "ushort*", "ushort*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MI_Context.Ptr, "ushort*", "ushort*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
