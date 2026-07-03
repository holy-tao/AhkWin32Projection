#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COR_PRF_FILTER_DATA.ahk" { COR_PRF_FILTER_DATA }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct EventPipeProviderCallback {
    value : IntPtr

    __value {
        set {
            if (value is EventPipeProviderCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} source_id 
     * @param {Integer} is_enabled 
     * @param {Integer} level 
     * @param {Integer} match_any_keywords 
     * @param {Integer} match_all_keywords 
     * @param {Pointer<COR_PRF_FILTER_DATA>} filter_data 
     * @param {Pointer<Void>} callback_data 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(source_id, is_enabled, level, match_any_keywords, match_all_keywords, filter_data, callback_data) {
        source_idMarshal := source_id is VarRef ? "char*" : "ptr"
        callback_dataMarshal := callback_data is VarRef ? "ptr" : "ptr"

        DllCall(this.value, source_idMarshal, source_id, UInt32, is_enabled, Int8, level, Int64, match_any_keywords, Int64, match_all_keywords, COR_PRF_FILTER_DATA.Ptr, filter_data, callback_dataMarshal, callback_data)
    }

    /**
     * A EventPipeProviderCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EventPipeProviderCallback {
        /**
         * Creates a EventPipeProviderCallback pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32, Int8, Int64, Int64, COR_PRF_FILTER_DATA, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, Int8, Int64, Int64, COR_PRF_FILTER_DATA.Ptr, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
