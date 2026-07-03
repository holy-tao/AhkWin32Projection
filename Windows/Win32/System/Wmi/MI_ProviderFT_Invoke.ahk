#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Context.ahk" { MI_Context }
#Import ".\MI_Instance.ahk" { MI_Instance }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ProviderFT_Invoke {
    value : IntPtr

    __value {
        set {
            if (value is MI_ProviderFT_Invoke) {
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
     * @param {Pointer<Integer>} methodName 
     * @param {Pointer<MI_Instance>} instanceName 
     * @param {Pointer<MI_Instance>} inputParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(self, _context, nameSpace, className, methodName, instanceName, inputParameters) {
        selfMarshal := self is VarRef ? "ptr" : "ptr"
        nameSpaceMarshal := nameSpace is VarRef ? "ushort*" : "ptr"
        classNameMarshal := className is VarRef ? "ushort*" : "ptr"
        methodNameMarshal := methodName is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, selfMarshal, self, MI_Context.Ptr, _context, nameSpaceMarshal, nameSpace, classNameMarshal, className, methodNameMarshal, methodName, MI_Instance.Ptr, instanceName, MI_Instance.Ptr, inputParameters)
    }

    /**
     * A MI_ProviderFT_Invoke that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_ProviderFT_Invoke {
        /**
         * Creates a MI_ProviderFT_Invoke pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MI_Context, "ushort*", "ushort*", "ushort*", MI_Instance, MI_Instance) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MI_Context.Ptr, "ushort*", "ushort*", "ushort*", MI_Instance.Ptr, MI_Instance.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
