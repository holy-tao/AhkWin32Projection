#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_JOB_ENTRYA.ahk" { FAX_JOB_ENTRYA }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXGETJOBA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXGETJOBA) {
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
     * @param {Integer} JobId 
     * @param {Pointer<Pointer<FAX_JOB_ENTRYA>>} JobEntry 
     * @returns {BOOL} 
     */
    Call(FaxHandle, JobId, JobEntry) {
        JobEntryMarshal := JobEntry is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, UInt32, JobId, JobEntryMarshal, JobEntry, BOOL)
        return result
    }

    /**
     * A PFAXGETJOBA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXGETJOBA {
        /**
         * Creates a PFAXGETJOBA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
