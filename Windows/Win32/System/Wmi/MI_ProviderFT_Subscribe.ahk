#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Filter.ahk" { MI_Filter }
#Import ".\MI_Context.ahk" { MI_Context }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ProviderFT_Subscribe {
    value : IntPtr

    __value {
        set {
            if (value is MI_ProviderFT_Subscribe) {
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
     * @param {Pointer<MI_Filter>} filter 
     * @param {Pointer<Integer>} bookmark 
     * @param {Integer} subscriptionID 
     * @param {Pointer<Pointer<Void>>} subscriptionSelf 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(self, _context, nameSpace, className, filter, bookmark, subscriptionID, subscriptionSelf) {
        selfMarshal := self is VarRef ? "ptr" : "ptr"
        nameSpaceMarshal := nameSpace is VarRef ? "ushort*" : "ptr"
        classNameMarshal := className is VarRef ? "ushort*" : "ptr"
        bookmarkMarshal := bookmark is VarRef ? "ushort*" : "ptr"
        subscriptionSelfMarshal := subscriptionSelf is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, selfMarshal, self, MI_Context.Ptr, _context, nameSpaceMarshal, nameSpace, classNameMarshal, className, MI_Filter.Ptr, filter, bookmarkMarshal, bookmark, Int64, subscriptionID, subscriptionSelfMarshal, subscriptionSelf)
    }

    /**
     * A MI_ProviderFT_Subscribe that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_ProviderFT_Subscribe {
        /**
         * Creates a MI_ProviderFT_Subscribe pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MI_Context, "ushort*", "ushort*", MI_Filter, "ushort*", Int64, "ptr*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MI_Context.Ptr, "ushort*", "ushort*", MI_Filter.Ptr, "ushort*", Int64, "ptr*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
