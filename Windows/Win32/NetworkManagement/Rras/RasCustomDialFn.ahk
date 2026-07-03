#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HRASCONN.ahk" { HRASCONN }
#Import ".\RASDIALEXTENSIONS.ahk" { RASDIALEXTENSIONS }
#Import ".\RASDIALPARAMSA.ahk" { RASDIALPARAMSA }

/**
 * The RasCustomDial function is an application-defined function that is exported by a third-party custom-dialing DLL. This function allows third-party vendors to implement custom remote-access dialing routines.
 * @remarks
 * RAS calls this entry point from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>, if the <b>szCustomDialDll</b> member of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure for the entry being dialed specifies a custom-dialing DLL.
 * 
 * If this entry point calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>, the <i>lpRasDialExtensions</i> parameter must not be <b>NULL</b>, and the <b>dwFlags</b> member of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377029(v=vs.85)">RASDIALEXTENSIONS</a> structure must have the RDEOPT_CustomDial flag set.
 * 
 * If the custom-dial DLL does not support this entry point, RAS returns ERROR_CANNOT_DO_CUSTOMDIAL to the caller of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-rascustomdialfn
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RasCustomDialFn {
    value : IntPtr

    __value {
        set {
            if (value is RasCustomDialFn) {
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
     * @param {Pointer<RASDIALEXTENSIONS>} lpRasDialExtensions Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377029(v=vs.85)">RASDIALEXTENSIONS</a> structure that specifies a set of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> extended features to enable. Set this parameter to <b>NULL</b> if there is no need to enable the extensions.
     * @param {PWSTR} lpszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {Pointer<RASDIALPARAMSA>} lpRasDialParams Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> structure that specifies calling parameters for the RAS connection. 
     * 
     * 
     * 
     * 
     * The caller must set the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> structure's <b>dwSize</b> member to sizeof(<b>RASDIALPARAMS</b>) to identify the version of the structure being passed.
     * @param {Integer} dwNotifierType This parameter is the same as the <i>dwNotifierType</i> parameter for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function. See the 
     * <b>RasDial</b> reference page for more information.
     * @param {Pointer<Void>} lpvNotifier This parameter is the same as the <i>lpvNotifier</i> parameter for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function. See the 
     * <b>RasDial</b> reference page for more information.
     * @param {Pointer<HRASCONN>} lphRasConn Pointer to a variable of type <b>HRASCONN</b>. Set the <b>HRASCONN</b> variable to <b>NULL</b> before calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>. If 
     * <b>RasDial</b> succeeds, it stores a handle to the RAS connection into <i>*lphRasConn</i>.
     * @param {Integer} dwFlags This parameter reserved for future use.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and a handle to the RAS connection in the variable pointed to by the <i>lphRasConn</i> parameter is returned.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hInstDll, lpRasDialExtensions, lpszPhonebook, lpRasDialParams, dwNotifierType, lpvNotifier, lphRasConn, dwFlags) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook

        lpvNotifierMarshal := lpvNotifier is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HINSTANCE, hInstDll, RASDIALEXTENSIONS.Ptr, lpRasDialExtensions, "ptr", lpszPhonebook, RASDIALPARAMSA.Ptr, lpRasDialParams, UInt32, dwNotifierType, lpvNotifierMarshal, lpvNotifier, HRASCONN.Ptr, lphRasConn, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A RasCustomDialFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RasCustomDialFn {
        /**
         * Creates a RasCustomDialFn pointer that invokes the given AHK function when called.
         * @param {Func(HINSTANCE, RASDIALEXTENSIONS, PWSTR, RASDIALPARAMSA, UInt32, "ptr", HRASCONN, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HINSTANCE, RASDIALEXTENSIONS.Ptr, PWSTR, RASDIALPARAMSA.Ptr, UInt32, "ptr", HRASCONN.Ptr, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
