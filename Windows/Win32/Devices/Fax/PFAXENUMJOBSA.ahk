#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_JOB_ENTRYA.ahk" { FAX_JOB_ENTRYA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXENUMJOBSA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXENUMJOBSA) {
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
     * @param {Pointer<Pointer<FAX_JOB_ENTRYA>>} JobEntry 
     * @param {Pointer<Integer>} JobsReturned 
     * @returns {BOOL} 
     */
    Call(FaxHandle, JobEntry, JobsReturned) {
        JobEntryMarshal := JobEntry is VarRef ? "ptr*" : "ptr"
        JobsReturnedMarshal := JobsReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, JobEntryMarshal, JobEntry, JobsReturnedMarshal, JobsReturned, BOOL)
        return result
    }

    /**
     * A PFAXENUMJOBSA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXENUMJOBSA {
        /**
         * Creates a PFAXENUMJOBSA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
