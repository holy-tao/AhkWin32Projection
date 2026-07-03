#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_LOG_CATEGORYA.ahk" { FAX_LOG_CATEGORYA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXSETLOGGINGCATEGORIESA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSETLOGGINGCATEGORIESA) {
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
     * @param {Pointer<FAX_LOG_CATEGORYA>} Categories 
     * @param {Integer} NumberCategories 
     * @returns {BOOL} 
     */
    Call(FaxHandle, Categories, NumberCategories) {
        result := DllCall(this.value, HANDLE, FaxHandle, FAX_LOG_CATEGORYA.Ptr, Categories, UInt32, NumberCategories, BOOL)
        return result
    }

    /**
     * A PFAXSETLOGGINGCATEGORIESA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSETLOGGINGCATEGORIESA {
        /**
         * Creates a PFAXSETLOGGINGCATEGORIESA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, FAX_LOG_CATEGORYA, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, FAX_LOG_CATEGORYA.Ptr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
