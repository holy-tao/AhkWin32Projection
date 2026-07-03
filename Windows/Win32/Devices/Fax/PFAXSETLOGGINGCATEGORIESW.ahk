#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_LOG_CATEGORYW.ahk" { FAX_LOG_CATEGORYW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXSETLOGGINGCATEGORIESW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSETLOGGINGCATEGORIESW) {
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
     * @param {Pointer<FAX_LOG_CATEGORYW>} Categories 
     * @param {Integer} NumberCategories 
     * @returns {BOOL} 
     */
    Call(FaxHandle, Categories, NumberCategories) {
        result := DllCall(this.value, HANDLE, FaxHandle, FAX_LOG_CATEGORYW.Ptr, Categories, UInt32, NumberCategories, BOOL)
        return result
    }

    /**
     * A PFAXSETLOGGINGCATEGORIESW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSETLOGGINGCATEGORIESW {
        /**
         * Creates a PFAXSETLOGGINGCATEGORIESW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, FAX_LOG_CATEGORYW, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, FAX_LOG_CATEGORYW.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
