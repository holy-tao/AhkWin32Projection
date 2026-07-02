#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\RASDIALDLG.ahk" { RASDIALDLG }

/**
 * The RasCustomDialDlg function is an application-defined function that is exported by a third-party custom-dialing DLL. This function allows third-party vendors to implement custom RAS connection dialog boxes.
 * @remarks
 * RAS calls this entry point from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasdialdlga">RasDialDlg</a>, if the <b>szCustomDialDll</b> member of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure for the entry being dialed specifies a custom-dialing DLL.
 * 
 * If this entry point calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>, the <i>lpRasDialExtensions</i> parameter must not be <b>NULL</b>, and the <b>dwfOptions</b> member of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377029(v=vs.85)">RASDIALEXTENSIONS</a> structure must have the <b>RDEOPT_CustomDial</b> flag set.
 * 
 * The custom-dial dialog must support 
 * <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> messages where 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms632659(v=vs.85)">LOWORD</a>(<i>wParam</i>) equals IDCANCEL.
 * 
 * If the custom-dial DLL does not support this entry point, RAS returns <b>ERROR_CANNOT_DO_CUSTOMDIAL</b> to the caller of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasdialdlga">RasDialDlg</a>.
 * @see https://learn.microsoft.com/windows/win32/api/rasdlg/nc-rasdlg-rascustomdialdlgfn
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RasCustomDialDlgFn {
    value : IntPtr

    __value {
        set {
            if (value is RasCustomDialDlgFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HINSTANCE} hInstDll Handle to the instance of the custom-dialing DLL that was loaded.
     * @param {Integer} dwFlags A set of bit flags that specify <b>RasCustomDialDlg</b> options. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RCD_Logon"></a><a id="rcd_logon"></a><a id="RCD_LOGON"></a><dl>
     * <dt><b>RCD_Logon</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set to one, the connection was dialed from a Windows Logon context. <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> uses this information to get the appropriate user preferences for the connection entry. If <b>RasDial</b> is called from this entry point, the <i>dwfOptions</i> member of the <i>lpRasDialExtension</i> parameter must have the <b>RDEOPT_NoUser</b> flag set to indicate the connection was dialed from a Windows Logon context.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>This parameter is reserved and should not be used.
     * @param {PWSTR} lpszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {PWSTR} lpszEntry Pointer to a <b>null</b>-terminated string that contains the name of the phone-book entry to dial.
     * @param {PWSTR} lpszPhoneNumber Pointer to a <b>null</b>-terminated string that contains a phone number that overrides the numbers stored in the phone-book entry. If this parameter is <b>NULL</b>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasdialdlga">RasDialDlg</a> uses the numbers in the phone-book entry.
     * @param {Pointer<RASDIALDLG>} lpInfo Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377023(v=vs.85)">RASDIALDLG</a> structure that contains additional input and output parameters. On input, the <b>dwSize</b> member of this structure must specify sizeof(
     * <b>RASDIALDLG</b>). If an error occurs, the <b>dwError</b> member returns an error code; otherwise, it returns zero.
     * @param {Pointer<Void>} pvInfo Reserved for internal use. This parameter will always be <b>NULL</b>.
     * @returns {BOOL} If the user creates, copies, or edits a phone-book entry, the return value should be <b>TRUE</b>. Otherwise, the function should return <b>FALSE</b>.
     * 
     * If an error occurs, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nc-rasdlg-rascustomentrydlgfn">RasCustomEntryDlg</a> should set the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure to a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     */
    Call(hInstDll, dwFlags, lpszPhonebook, lpszEntry, lpszPhoneNumber, lpInfo, pvInfo) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntry := lpszEntry is String ? StrPtr(lpszEntry) : lpszEntry
        lpszPhoneNumber := lpszPhoneNumber is String ? StrPtr(lpszPhoneNumber) : lpszPhoneNumber

        pvInfoMarshal := pvInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HINSTANCE, hInstDll, UInt32, dwFlags, "ptr", lpszPhonebook, "ptr", lpszEntry, "ptr", lpszPhoneNumber, RASDIALDLG.Ptr, lpInfo, pvInfoMarshal, pvInfo, BOOL)
        return result
    }

    /**
     * A RasCustomDialDlgFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RasCustomDialDlgFn {
        /**
         * Creates a RasCustomDialDlgFn pointer that invokes the given AHK function when called.
         * @param {Func(HINSTANCE, UInt32, PWSTR, PWSTR, PWSTR, RASDIALDLG, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HINSTANCE, UInt32, PWSTR, PWSTR, PWSTR, RASDIALDLG.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
