#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Context.ahk" { MI_Context }
#Import ".\MI_Filter.ahk" { MI_Filter }
#Import ".\MI_Instance.ahk" { MI_Instance }
#Import ".\MI_PropertySet.ahk" { MI_PropertySet }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ProviderFT_AssociatorInstances {
    value : IntPtr

    __value {
        set {
            if (value is MI_ProviderFT_AssociatorInstances) {
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
     * @param {Pointer<MI_Instance>} instanceName 
     * @param {Pointer<Integer>} resultClass 
     * @param {Pointer<Integer>} role 
     * @param {Pointer<Integer>} resultRole 
     * @param {Pointer<MI_PropertySet>} propertySet 
     * @param {Integer} keysOnly 
     * @param {Pointer<MI_Filter>} filter 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(self, _context, nameSpace, className, instanceName, resultClass, role, resultRole, propertySet, keysOnly, filter) {
        selfMarshal := self is VarRef ? "ptr" : "ptr"
        nameSpaceMarshal := nameSpace is VarRef ? "ushort*" : "ptr"
        classNameMarshal := className is VarRef ? "ushort*" : "ptr"
        resultClassMarshal := resultClass is VarRef ? "ushort*" : "ptr"
        roleMarshal := role is VarRef ? "ushort*" : "ptr"
        resultRoleMarshal := resultRole is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, selfMarshal, self, MI_Context.Ptr, _context, nameSpaceMarshal, nameSpace, classNameMarshal, className, MI_Instance.Ptr, instanceName, resultClassMarshal, resultClass, roleMarshal, role, resultRoleMarshal, resultRole, MI_PropertySet.Ptr, propertySet, Int8, keysOnly, MI_Filter.Ptr, filter)
    }

    /**
     * A MI_ProviderFT_AssociatorInstances that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_ProviderFT_AssociatorInstances {
        /**
         * Creates a MI_ProviderFT_AssociatorInstances pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MI_Context, "ushort*", "ushort*", MI_Instance, "ushort*", "ushort*", "ushort*", MI_PropertySet, Int8, MI_Filter) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MI_Context.Ptr, "ushort*", "ushort*", MI_Instance.Ptr, "ushort*", "ushort*", "ushort*", MI_PropertySet.Ptr, Int8, MI_Filter.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
