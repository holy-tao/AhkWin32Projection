#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The RasPBDlgFunc function is an application-defined callback function that receives notifications of user activity while the RasPhonebookDlg dialog box is open. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The rasdlg.h header defines RASPBDLGFUNC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/rasdlg/nc-rasdlg-raspbdlgfuncw
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 */
export default struct RASPBDLGFUNCW {
    value : IntPtr

    __value {
        set {
            if (value is RASPBDLGFUNCW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 
     * @param {Integer} param1 
     * @param {PWSTR} param2 
     * @param {Pointer<Void>} param3 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2, param3) {
        param2 := param2 is String ? StrPtr(param2) : param2

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, IntPtr, param0, UInt32, param1, "ptr", param2, param3Marshal, param3)
    }

    /**
     * A RASPBDLGFUNCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RASPBDLGFUNCW {
        /**
         * Creates a RASPBDLGFUNCW pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, PWSTR, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, PWSTR, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
