#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_COVERPAGE_INFOA.ahk" { FAX_COVERPAGE_INFOA }
#Import ".\FAX_CONTEXT_INFOA.ahk" { FAX_CONTEXT_INFOA }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXPRINTCOVERPAGEA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXPRINTCOVERPAGEA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FAX_CONTEXT_INFOA>} FaxContextInfo 
     * @param {Pointer<FAX_COVERPAGE_INFOA>} CoverPageInfo 
     * @returns {BOOL} 
     */
    Call(FaxContextInfo, CoverPageInfo) {
        result := DllCall(this.value, FAX_CONTEXT_INFOA.Ptr, FaxContextInfo, FAX_COVERPAGE_INFOA.Ptr, CoverPageInfo, BOOL)
        return result
    }

    /**
     * A PFAXPRINTCOVERPAGEA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXPRINTCOVERPAGEA {
        /**
         * Creates a PFAXPRINTCOVERPAGEA pointer that invokes the given AHK function when called.
         * @param {Func(FAX_CONTEXT_INFOA, FAX_COVERPAGE_INFOA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FAX_CONTEXT_INFOA.Ptr, FAX_COVERPAGE_INFOA.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
