#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_CONTEXT_INFOW.ahk" { FAX_CONTEXT_INFOW }
#Import ".\FAX_PRINT_INFOW.ahk" { FAX_PRINT_INFOW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXSTARTPRINTJOBW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSTARTPRINTJOBW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} PrinterName 
     * @param {Pointer<FAX_PRINT_INFOW>} PrintInfo 
     * @param {Pointer<Integer>} FaxJobId 
     * @param {Pointer<FAX_CONTEXT_INFOW>} FaxContextInfo 
     * @returns {BOOL} 
     */
    Call(PrinterName, PrintInfo, FaxJobId, FaxContextInfo) {
        PrinterName := PrinterName is String ? StrPtr(PrinterName) : PrinterName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", PrinterName, FAX_PRINT_INFOW.Ptr, PrintInfo, FaxJobIdMarshal, FaxJobId, FAX_CONTEXT_INFOW.Ptr, FaxContextInfo, BOOL)
        return result
    }

    /**
     * A PFAXSTARTPRINTJOBW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSTARTPRINTJOBW {
        /**
         * Creates a PFAXSTARTPRINTJOBW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, FAX_PRINT_INFOW, "uint*", FAX_CONTEXT_INFOW) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, FAX_PRINT_INFOW.Ptr, "uint*", FAX_CONTEXT_INFOW.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
