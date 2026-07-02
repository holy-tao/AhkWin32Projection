#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\FAX_COVERPAGE_INFOW.ahk" { FAX_COVERPAGE_INFOW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_JOB_PARAMW.ahk" { FAX_JOB_PARAMW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXSENDDOCUMENTW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSENDDOCUMENTW) {
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
     * @param {PWSTR} FileName 
     * @param {Pointer<FAX_JOB_PARAMW>} JobParams 
     * @param {Pointer<FAX_COVERPAGE_INFOW>} CoverpageInfo 
     * @param {Pointer<Integer>} FaxJobId 
     * @returns {BOOL} 
     */
    Call(FaxHandle, FileName, JobParams, CoverpageInfo, FaxJobId) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, "ptr", FileName, FAX_JOB_PARAMW.Ptr, JobParams, FAX_COVERPAGE_INFOW.Ptr, CoverpageInfo, FaxJobIdMarshal, FaxJobId, BOOL)
        return result
    }

    /**
     * A PFAXSENDDOCUMENTW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSENDDOCUMENTW {
        /**
         * Creates a PFAXSENDDOCUMENTW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, FAX_JOB_PARAMW, FAX_COVERPAGE_INFOW, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, FAX_JOB_PARAMW.Ptr, FAX_COVERPAGE_INFOW.Ptr, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
