#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_JOB_ENTRYW.ahk" { FAX_JOB_ENTRYW }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXSETJOBW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSETJOBW) {
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
     * @param {Integer} Command 
     * @param {Pointer<FAX_JOB_ENTRYW>} JobEntry 
     * @returns {BOOL} 
     */
    Call(FaxHandle, JobId, Command, JobEntry) {
        result := DllCall(this.value, HANDLE, FaxHandle, UInt32, JobId, UInt32, Command, FAX_JOB_ENTRYW.Ptr, JobEntry, BOOL)
        return result
    }

    /**
     * A PFAXSETJOBW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSETJOBW {
        /**
         * Creates a PFAXSETJOBW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, UInt32, FAX_JOB_ENTRYW) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, UInt32, FAX_JOB_ENTRYW.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
