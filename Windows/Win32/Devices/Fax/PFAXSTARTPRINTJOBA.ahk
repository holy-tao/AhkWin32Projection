#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_CONTEXT_INFOA.ahk" { FAX_CONTEXT_INFOA }
#Import ".\FAX_PRINT_INFOA.ahk" { FAX_PRINT_INFOA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXSTARTPRINTJOBA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSTARTPRINTJOBA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} PrinterName 
     * @param {Pointer<FAX_PRINT_INFOA>} PrintInfo 
     * @param {Pointer<Integer>} FaxJobId 
     * @param {Pointer<FAX_CONTEXT_INFOA>} FaxContextInfo 
     * @returns {BOOL} 
     */
    Call(PrinterName, PrintInfo, FaxJobId, FaxContextInfo) {
        PrinterName := PrinterName is String ? StrPtr(PrinterName) : PrinterName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", PrinterName, FAX_PRINT_INFOA.Ptr, PrintInfo, FaxJobIdMarshal, FaxJobId, FAX_CONTEXT_INFOA.Ptr, FaxContextInfo, BOOL)
        return result
    }

    /**
     * A PFAXSTARTPRINTJOBA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSTARTPRINTJOBA {
        /**
         * Creates a PFAXSTARTPRINTJOBA pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, FAX_PRINT_INFOA, "uint*", FAX_CONTEXT_INFOA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, FAX_PRINT_INFOA.Ptr, "uint*", FAX_CONTEXT_INFOA.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
