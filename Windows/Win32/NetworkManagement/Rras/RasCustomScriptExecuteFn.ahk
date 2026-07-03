#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PFNRASFREEBUFFER.ahk" { PFNRASFREEBUFFER }
#Import ".\PFNRASGETBUFFER.ahk" { PFNRASGETBUFFER }
#Import ".\PFNRASRECEIVEBUFFER.ahk" { PFNRASRECEIVEBUFFER }
#Import ".\PFNRASRETRIEVEBUFFER.ahk" { PFNRASRETRIEVEBUFFER }
#Import ".\PFNRASSENDBUFFER.ahk" { PFNRASSENDBUFFER }
#Import ".\RASDIALPARAMSA.ahk" { RASDIALPARAMSA }

/**
 * RAS calls the RasCustomScriptExecute function when establishing a connection for a phone-book entry that has the RASEO_CustomScript option set.
 * @remarks
 * When RAS calls 
 * <b>RasCustomScriptExecute</b>, the <i>pRasDialParams</i> parameter will point to the Unicode 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> structure. That is, the structure contains only Unicode strings.
 * 
 * In some cases, the <b>szUserName</b> of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> structure will be an empty string. In these cases, the custom-scripting DLL should use the Unicode version of the 
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/iamtimelineobj-getusername">GetUserName</a> function to obtain the name of the current user.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-rascustomscriptexecutefn
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RasCustomScriptExecuteFn {
    value : IntPtr

    __value {
        set {
            if (value is RasCustomScriptExecuteFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hPort Handle to the port on which the connection is established. Use this handle when sending or receiving data on the port.
     * @param {PWSTR} lpszPhonebook Pointer to a Unicode string that contains the path to the phone book in which the entry for the connection resides.
     * @param {PWSTR} lpszEntryName Pointer to a Unicode string that contains the name of the entry that was dialed to establish the connection.
     * @param {Pointer<PFNRASGETBUFFER>} _pfnRasGetBuffer Pointer to a function of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasgetbuffer">PFNRASGETBUFFER</a>. The custom-scripting DLL should use this function to allocate memory to send data to the server.
     * @param {Pointer<PFNRASFREEBUFFER>} _pfnRasFreeBuffer Pointer to a function of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasfreebuffer">PFNRASFREEBUFFER</a>. The custom-scripting DLL should use this function to free memory allocated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasgetbuffer">pfnRasGetBuffer</a> function.
     * @param {Pointer<PFNRASSENDBUFFER>} _pfnRasSendBuffer Pointer to a function of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrassendbuffer">PFNRASSENDBUFFER</a>. The custom-scripting DLL uses this function to communicate with the server over the specified port.
     * @param {Pointer<PFNRASRECEIVEBUFFER>} _pfnRasReceiveBuffer Pointer to a function of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasreceivebuffer">PFNRASRECEIVEBUFFER</a>. The custom-scripting DLL uses this function to communicate with the server over the specified port.
     * @param {Pointer<PFNRASRETRIEVEBUFFER>} _pfnRasRetrieveBuffer Pointer to a function of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasretrievebuffer">PFNRASRETRIEVEBUFFER</a>. The custom-scripting DLL uses this function to communicate with the server over the specified port.
     * @param {HWND} _hWnd Handle to a window that the custom-scripting DLL can use to present a user interface to the user.
     * @param {Pointer<RASDIALPARAMSA>} pRasDialParams Pointer to a Unicode 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> structure. This structure contains the authentication credentials for the user. The custom-scripting DLL can modify the <b>szUserName</b>, <b>szPassword</b>, and <b>szDomain</b> members of this structure. The Point-to-Point Protocol (PPP) will use whatever is stored in these members when 
     * <b>RasCustomScriptExecute</b> returns.
     * @param {Pointer<Void>} pvReserved 
     * @returns {Integer} If the function succeeds, the return value should be <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value should be an appropriate error code from Winerror.h or Raserror.h.
     */
    Call(hPort, lpszPhonebook, lpszEntryName, _pfnRasGetBuffer, _pfnRasFreeBuffer, _pfnRasSendBuffer, _pfnRasReceiveBuffer, _pfnRasRetrieveBuffer, _hWnd, pRasDialParams, pvReserved) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntryName := lpszEntryName is String ? StrPtr(lpszEntryName) : lpszEntryName

        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, hPort, "ptr", lpszPhonebook, "ptr", lpszEntryName, PFNRASGETBUFFER, _pfnRasGetBuffer, PFNRASFREEBUFFER, _pfnRasFreeBuffer, PFNRASSENDBUFFER, _pfnRasSendBuffer, PFNRASRECEIVEBUFFER, _pfnRasReceiveBuffer, PFNRASRETRIEVEBUFFER, _pfnRasRetrieveBuffer, HWND, _hWnd, RASDIALPARAMSA.Ptr, pRasDialParams, pvReservedMarshal, pvReserved, UInt32)
        return result
    }

    /**
     * A RasCustomScriptExecuteFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RasCustomScriptExecuteFn {
        /**
         * Creates a RasCustomScriptExecuteFn pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, PWSTR, PFNRASGETBUFFER, PFNRASFREEBUFFER, PFNRASSENDBUFFER, PFNRASRECEIVEBUFFER, PFNRASRETRIEVEBUFFER, HWND, RASDIALPARAMSA, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, PWSTR, PFNRASGETBUFFER, PFNRASFREEBUFFER, PFNRASSENDBUFFER, PFNRASRECEIVEBUFFER, PFNRASRETRIEVEBUFFER, HWND, RASDIALPARAMSA.Ptr, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
