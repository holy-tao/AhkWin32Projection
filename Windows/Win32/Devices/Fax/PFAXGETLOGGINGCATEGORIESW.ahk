#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_LOG_CATEGORYW.ahk" { FAX_LOG_CATEGORYW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXGETLOGGINGCATEGORIESW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXGETLOGGINGCATEGORIESW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {Pointer<Pointer<FAX_LOG_CATEGORYW>>} Categories 
     * @param {Pointer<Integer>} NumberCategories 
     * @returns {BOOL} 
     */
    Call(FaxHandle, Categories, NumberCategories) {
        CategoriesMarshal := Categories is VarRef ? "ptr*" : "ptr"
        NumberCategoriesMarshal := NumberCategories is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, CategoriesMarshal, Categories, NumberCategoriesMarshal, NumberCategories, BOOL)
        return result
    }

    /**
     * A PFAXGETLOGGINGCATEGORIESW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXGETLOGGINGCATEGORIESW {
        /**
         * Creates a PFAXGETLOGGINGCATEGORIESW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
