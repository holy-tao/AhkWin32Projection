#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_COVERPAGE_INFOW.ahk" { FAX_COVERPAGE_INFOW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_CONTEXT_INFOW.ahk" { FAX_CONTEXT_INFOW }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXPRINTCOVERPAGEW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXPRINTCOVERPAGEW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FAX_CONTEXT_INFOW>} FaxContextInfo 
     * @param {Pointer<FAX_COVERPAGE_INFOW>} CoverPageInfo 
     * @returns {BOOL} 
     */
    Call(FaxContextInfo, CoverPageInfo) {
        result := DllCall(this.value, FAX_CONTEXT_INFOW.Ptr, FaxContextInfo, FAX_COVERPAGE_INFOW.Ptr, CoverPageInfo, BOOL)
        return result
    }

    /**
     * A PFAXPRINTCOVERPAGEW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXPRINTCOVERPAGEW {
        /**
         * Creates a PFAXPRINTCOVERPAGEW pointer that invokes the given AHK function when called.
         * @param {Func(FAX_CONTEXT_INFOW, FAX_COVERPAGE_INFOW) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FAX_CONTEXT_INFOW.Ptr, FAX_COVERPAGE_INFOW.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
