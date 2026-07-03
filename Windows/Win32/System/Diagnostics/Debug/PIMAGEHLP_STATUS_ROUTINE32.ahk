#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IMAGEHLP_STATUS_REASON.ahk" { IMAGEHLP_STATUS_REASON }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PIMAGEHLP_STATUS_ROUTINE32 {
    value : IntPtr

    __value {
        set {
            if (value is PIMAGEHLP_STATUS_ROUTINE32) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IMAGEHLP_STATUS_REASON} Reason 
     * @param {PSTR} ImageName 
     * @param {PSTR} DllName 
     * @param {Integer} Va 
     * @param {Pointer} Parameter 
     * @returns {BOOL} 
     */
    Call(Reason, ImageName, DllName, Va, Parameter) {
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName
        DllName := DllName is String ? StrPtr(DllName) : DllName

        result := DllCall(this.value, IMAGEHLP_STATUS_REASON, Reason, "ptr", ImageName, "ptr", DllName, UInt32, Va, IntPtr, Parameter, BOOL)
        return result
    }

    /**
     * A PIMAGEHLP_STATUS_ROUTINE32 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIMAGEHLP_STATUS_ROUTINE32 {
        /**
         * Creates a PIMAGEHLP_STATUS_ROUTINE32 pointer that invokes the given AHK function when called.
         * @param {Func(IMAGEHLP_STATUS_REASON, PSTR, PSTR, UInt32, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IMAGEHLP_STATUS_REASON, PSTR, PSTR, UInt32, IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
