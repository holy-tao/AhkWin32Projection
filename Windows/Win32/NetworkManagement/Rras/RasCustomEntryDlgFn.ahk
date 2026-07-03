#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RASENTRYDLGA.ahk" { RASENTRYDLGA }

/**
 * The RasCustomEntryDlg function is an application-defined function that is exported by a third-party custom-dialing DLL. This function allows third-party vendors to implement custom dialogs for managing phone-book entries.
 * @remarks
 * RAS  calls this entry point from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasentrydlga">RasEntryDlg</a>, if the <b>szCustomDialDll</b> member of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure for the entry being dialed specifies a custom-dialing DLL.
 * 
 * If the custom-dial DLL does not support this entry point, RAS returns ERROR_NO_CUSTOMENTRYDLG to the caller of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasentrydlga">RasEntryDlg</a>.
 * @see https://learn.microsoft.com/windows/win32/api/rasdlg/nc-rasdlg-rascustomentrydlgfn
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RasCustomEntryDlgFn {
    value : IntPtr

    __value {
        set {
            if (value is RasCustomEntryDlgFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HINSTANCE} hInstDll Handle to the instance of the custom-dial DLL that was loaded.
     * @param {PWSTR} lpszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {PWSTR} lpszEntry Pointer to a <b>null</b>-terminated string that contains the name of the phone-book entry to edit, copy, or create. 
     * 
     * 
     * 
     * 
     * If you are editing or copying an entry, this parameter is the name of an existing phone-book entry. If you are copying an entry, set the RASEDFLAG_CloneEntry flag in the <b>dwFlags</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure.
     * 
     * If you are creating an entry, this parameter is a default new entry name that the user can change. If this parameter is <b>NULL</b>, the function provides a default name. If you are creating an entry, set the RASEDFLAG_NewEntry flag in the <b>dwFlags</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure.
     * @param {Pointer<RASENTRYDLGA>} lpInfo Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure that contains additional input and output parameters. On input, the <b>dwSize</b> member of this structure must specify sizeof(
     * <b>RASENTRYDLG</b>). Use the <b>dwSize</b> member to indicate whether creating, editing, or copying an entry. If an error occurs, the <b>dwError</b> member returns an error code; otherwise, it returns zero.
     * @param {Integer} dwFlags Reserved for future use.
     * @returns {BOOL} If the user creates, copies, or edits a phone-book entry, the return value should be <b>TRUE</b>. Otherwise, the function should return <b>FALSE</b>.
     * 
     * If an error occurs, <b>RasCustomEntryDlg</b> should set the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure to a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     */
    Call(hInstDll, lpszPhonebook, lpszEntry, lpInfo, dwFlags) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntry := lpszEntry is String ? StrPtr(lpszEntry) : lpszEntry

        result := DllCall(this.value, HINSTANCE, hInstDll, "ptr", lpszPhonebook, "ptr", lpszEntry, RASENTRYDLGA.Ptr, lpInfo, UInt32, dwFlags, BOOL)
        return result
    }

    /**
     * A RasCustomEntryDlgFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RasCustomEntryDlgFn {
        /**
         * Creates a RasCustomEntryDlgFn pointer that invokes the given AHK function when called.
         * @param {Func(HINSTANCE, PWSTR, PWSTR, RASENTRYDLGA, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HINSTANCE, PWSTR, PWSTR, RASENTRYDLGA.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
