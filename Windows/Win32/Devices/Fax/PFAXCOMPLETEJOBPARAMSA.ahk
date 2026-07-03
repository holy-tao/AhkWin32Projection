#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_COVERPAGE_INFOA.ahk" { FAX_COVERPAGE_INFOA }
#Import ".\FAX_JOB_PARAMA.ahk" { FAX_JOB_PARAMA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXCOMPLETEJOBPARAMSA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXCOMPLETEJOBPARAMSA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<FAX_JOB_PARAMA>>} JobParams 
     * @param {Pointer<Pointer<FAX_COVERPAGE_INFOA>>} CoverpageInfo 
     * @returns {BOOL} 
     */
    Call(JobParams, CoverpageInfo) {
        JobParamsMarshal := JobParams is VarRef ? "ptr*" : "ptr"
        CoverpageInfoMarshal := CoverpageInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, JobParamsMarshal, JobParams, CoverpageInfoMarshal, CoverpageInfo, BOOL)
        return result
    }

    /**
     * A PFAXCOMPLETEJOBPARAMSA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXCOMPLETEJOBPARAMSA {
        /**
         * Creates a PFAXCOMPLETEJOBPARAMSA pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "ptr*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
