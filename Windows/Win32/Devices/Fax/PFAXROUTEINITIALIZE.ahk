#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_ROUTE_CALLBACKROUTINES.ahk" { FAX_ROUTE_CALLBACKROUTINES }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXROUTEINITIALIZE {
    value : IntPtr

    __value {
        set {
            if (value is PFAXROUTEINITIALIZE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {Pointer<FAX_ROUTE_CALLBACKROUTINES>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, HANDLE, param0, FAX_ROUTE_CALLBACKROUTINES.Ptr, param1, BOOL)
        return result
    }

    /**
     * A PFAXROUTEINITIALIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXROUTEINITIALIZE {
        /**
         * Creates a PFAXROUTEINITIALIZE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, FAX_ROUTE_CALLBACKROUTINES) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, FAX_ROUTE_CALLBACKROUTINES.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
