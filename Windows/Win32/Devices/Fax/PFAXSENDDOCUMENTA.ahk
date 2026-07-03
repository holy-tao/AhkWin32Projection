#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_COVERPAGE_INFOA.ahk" { FAX_COVERPAGE_INFOA }
#Import ".\FAX_JOB_PARAMA.ahk" { FAX_JOB_PARAMA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXSENDDOCUMENTA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSENDDOCUMENTA) {
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
     * @param {PSTR} FileName 
     * @param {Pointer<FAX_JOB_PARAMA>} JobParams 
     * @param {Pointer<FAX_COVERPAGE_INFOA>} CoverpageInfo 
     * @param {Pointer<Integer>} FaxJobId 
     * @returns {BOOL} 
     */
    Call(FaxHandle, FileName, JobParams, CoverpageInfo, FaxJobId) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, "ptr", FileName, FAX_JOB_PARAMA.Ptr, JobParams, FAX_COVERPAGE_INFOA.Ptr, CoverpageInfo, FaxJobIdMarshal, FaxJobId, BOOL)
        return result
    }

    /**
     * A PFAXSENDDOCUMENTA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSENDDOCUMENTA {
        /**
         * Creates a PFAXSENDDOCUMENTA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PSTR, FAX_JOB_PARAMA, FAX_COVERPAGE_INFOA, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PSTR, FAX_JOB_PARAMA.Ptr, FAX_COVERPAGE_INFOA.Ptr, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
