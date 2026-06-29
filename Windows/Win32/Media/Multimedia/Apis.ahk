#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }
#Import ".\IAVIStream.ahk" { IAVIStream }
#Import "..\..\UI\Controls\Dialogs\OPENFILENAMEA.ahk" { OPENFILENAMEA }
#Import ".\JOYINFOEX.ahk" { JOYINFOEX }
#Import ".\HMMIO.ahk" { HMMIO }
#Import ".\AVISTREAMINFOW.ahk" { AVISTREAMINFOW as AVISTREAMINFOW_struct }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\MMIOINFO.ahk" { MMIOINFO }
#Import ".\HDRVR.ahk" { HDRVR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\AVICOMPRESSOPTIONS.ahk" { AVICOMPRESSOPTIONS }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\MMCKINFO.ahk" { MMCKINFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DRAWDIBTIME.ahk" { DRAWDIBTIME as DRAWDIBTIME_struct }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AVISTREAMINFOA.ahk" { AVISTREAMINFOA as AVISTREAMINFOA_struct }
#Import ".\HIC.ahk" { HIC }
#Import ".\ICINFO.ahk" { ICINFO as ICINFO_struct }
#Import ".\IGetFrame.ahk" { IGetFrame }
#Import ".\JOYINFO.ahk" { JOYINFO }
#Import ".\COMPVARS.ahk" { COMPVARS }
#Import "..\..\UI\Controls\Dialogs\OPENFILENAMEW.ahk" { OPENFILENAMEW }
#Import "..\..\Graphics\Gdi\HPALETTE.ahk" { HPALETTE }
#Import ".\IAVIFile.ahk" { IAVIFile }
#Import "..\..\Foundation\HTASK.ahk" { HTASK }
#Import "..\..\Graphics\Gdi\BITMAPINFO.ahk" { BITMAPINFO }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */

;@region Functions
/**
 * 
 * @param {Integer} mciId 
 * @param {Integer} uMsg 
 * @param {Pointer} dwParam1 
 * @param {Pointer} dwParam2 
 * @returns {Integer} 
 */
export mciSendCommandA(mciId, uMsg, dwParam1, dwParam2) {
    result := DllCall("WINMM.dll\mciSendCommandA", "uint", mciId, "uint", uMsg, "ptr", dwParam1, "ptr", dwParam2, UInt32)
    return result
}

/**
 * 
 * @param {Integer} mciId 
 * @param {Integer} uMsg 
 * @param {Pointer} dwParam1 
 * @param {Pointer} dwParam2 
 * @returns {Integer} 
 */
export mciSendCommandW(mciId, uMsg, dwParam1, dwParam2) {
    result := DllCall("WINMM.dll\mciSendCommandW", "uint", mciId, "uint", uMsg, "ptr", dwParam1, "ptr", dwParam2, UInt32)
    return result
}

/**
 * 
 * @param {PSTR} lpstrCommand 
 * @param {PSTR} lpstrReturnString 
 * @param {Integer} uReturnLength 
 * @param {HWND} hwndCallback 
 * @returns {Integer} 
 */
export mciSendStringA(lpstrCommand, lpstrReturnString, uReturnLength, hwndCallback) {
    lpstrCommand := lpstrCommand is String ? StrPtr(lpstrCommand) : lpstrCommand
    lpstrReturnString := lpstrReturnString is String ? StrPtr(lpstrReturnString) : lpstrReturnString

    result := DllCall("WINMM.dll\mciSendStringA", "ptr", lpstrCommand, "ptr", lpstrReturnString, "uint", uReturnLength, HWND, hwndCallback, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} lpstrCommand 
 * @param {PWSTR} lpstrReturnString 
 * @param {Integer} uReturnLength 
 * @param {HWND} hwndCallback 
 * @returns {Integer} 
 */
export mciSendStringW(lpstrCommand, lpstrReturnString, uReturnLength, hwndCallback) {
    lpstrCommand := lpstrCommand is String ? StrPtr(lpstrCommand) : lpstrCommand
    lpstrReturnString := lpstrReturnString is String ? StrPtr(lpstrReturnString) : lpstrReturnString

    result := DllCall("WINMM.dll\mciSendStringW", "ptr", lpstrCommand, "ptr", lpstrReturnString, "uint", uReturnLength, HWND, hwndCallback, UInt32)
    return result
}

/**
 * 
 * @param {PSTR} pszDevice 
 * @returns {Integer} 
 */
export mciGetDeviceIDA(pszDevice) {
    pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice

    result := DllCall("WINMM.dll\mciGetDeviceIDA", "ptr", pszDevice, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pszDevice 
 * @returns {Integer} 
 */
export mciGetDeviceIDW(pszDevice) {
    pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice

    result := DllCall("WINMM.dll\mciGetDeviceIDW", "ptr", pszDevice, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwElementID 
 * @param {PSTR} lpstrType 
 * @returns {Integer} 
 */
export mciGetDeviceIDFromElementIDA(dwElementID, lpstrType) {
    lpstrType := lpstrType is String ? StrPtr(lpstrType) : lpstrType

    result := DllCall("WINMM.dll\mciGetDeviceIDFromElementIDA", "uint", dwElementID, "ptr", lpstrType, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwElementID 
 * @param {PWSTR} lpstrType 
 * @returns {Integer} 
 */
export mciGetDeviceIDFromElementIDW(dwElementID, lpstrType) {
    lpstrType := lpstrType is String ? StrPtr(lpstrType) : lpstrType

    result := DllCall("WINMM.dll\mciGetDeviceIDFromElementIDW", "uint", dwElementID, "ptr", lpstrType, UInt32)
    return result
}

/**
 * 
 * @param {Integer} mcierr 
 * @param {PSTR} pszText 
 * @param {Integer} cchText 
 * @returns {BOOL} 
 */
export mciGetErrorStringA(mcierr, pszText, cchText) {
    pszText := pszText is String ? StrPtr(pszText) : pszText

    result := DllCall("WINMM.dll\mciGetErrorStringA", "uint", mcierr, "ptr", pszText, "uint", cchText, BOOL)
    return result
}

/**
 * 
 * @param {Integer} mcierr 
 * @param {PWSTR} pszText 
 * @param {Integer} cchText 
 * @returns {BOOL} 
 */
export mciGetErrorStringW(mcierr, pszText, cchText) {
    pszText := pszText is String ? StrPtr(pszText) : pszText

    result := DllCall("WINMM.dll\mciGetErrorStringW", "uint", mcierr, "ptr", pszText, "uint", cchText, BOOL)
    return result
}

/**
 * 
 * @param {Integer} mciId 
 * @param {Pointer<YIELDPROC>} fpYieldProc 
 * @param {Integer} dwYieldData 
 * @returns {BOOL} 
 */
export mciSetYieldProc(mciId, fpYieldProc, dwYieldData) {
    result := DllCall("WINMM.dll\mciSetYieldProc", "uint", mciId, "ptr", fpYieldProc, "uint", dwYieldData, BOOL)
    return result
}

/**
 * 
 * @param {Integer} mciId 
 * @returns {HTASK} 
 */
export mciGetCreatorTask(mciId) {
    result := DllCall("WINMM.dll\mciGetCreatorTask", "uint", mciId, HTASK)
    return result
}

/**
 * 
 * @param {Integer} mciId 
 * @param {Pointer<Integer>} pdwYieldData 
 * @returns {Pointer<YIELDPROC>} 
 */
export mciGetYieldProc(mciId, pdwYieldData) {
    pdwYieldDataMarshal := pdwYieldData is VarRef ? "uint*" : "ptr"

    result := DllCall("WINMM.dll\mciGetYieldProc", "uint", mciId, pdwYieldDataMarshal, pdwYieldData, IntPtr)
    return result
}

/**
 * 
 * @param {Integer} wDeviceID 
 * @returns {Pointer} 
 */
export mciGetDriverData(wDeviceID) {
    result := DllCall("WINMM.dll\mciGetDriverData", "uint", wDeviceID, IntPtr)
    return result
}

/**
 * 
 * @param {HANDLE} _hInstance 
 * @param {PWSTR} lpResName 
 * @param {Integer} wType 
 * @returns {Integer} 
 */
export mciLoadCommandResource(_hInstance, lpResName, wType) {
    lpResName := lpResName is String ? StrPtr(lpResName) : lpResName

    result := DllCall("WINMM.dll\mciLoadCommandResource", HANDLE, _hInstance, "ptr", lpResName, "uint", wType, UInt32)
    return result
}

/**
 * 
 * @param {Integer} wDeviceID 
 * @param {Pointer} dwData 
 * @returns {BOOL} 
 */
export mciSetDriverData(wDeviceID, dwData) {
    result := DllCall("WINMM.dll\mciSetDriverData", "uint", wDeviceID, "ptr", dwData, BOOL)
    return result
}

/**
 * 
 * @param {Integer} wDeviceID 
 * @returns {Integer} 
 */
export mciDriverYield(wDeviceID) {
    result := DllCall("WINMM.dll\mciDriverYield", "uint", wDeviceID, UInt32)
    return result
}

/**
 * 
 * @param {HANDLE} hwndCallback 
 * @param {Integer} wDeviceID 
 * @param {Integer} uStatus 
 * @returns {BOOL} 
 */
export mciDriverNotify(hwndCallback, wDeviceID, uStatus) {
    result := DllCall("WINMM.dll\mciDriverNotify", HANDLE, hwndCallback, "uint", wDeviceID, "uint", uStatus, BOOL)
    return result
}

/**
 * 
 * @param {Integer} wTable 
 * @returns {BOOL} 
 */
export mciFreeCommandResource(wTable) {
    result := DllCall("WINMM.dll\mciFreeCommandResource", "uint", wTable, BOOL)
    return result
}

/**
 * Closes an installable driver.
 * @remarks
 * The function passes the <i>lParam1</i> and <i>lParam2</i> parameters to the <a href="https://docs.microsoft.com/previous-versions/dd797918(v=vs.85)">DriverProc</a> function of the installable driver.
 * @param {HDRVR} hDriver Handle of an installable driver instance. The handle must have been previously created by using the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
 * @param {LPARAM} lParam1 32-bit driver-specific data.
 * @param {LPARAM} lParam2 32-bit driver-specific data.
 * @returns {LRESULT} Returns nonzero if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-closedriver
 * @since windows5.0
 */
export CloseDriver(hDriver, lParam1, lParam2) {
    result := DllCall("WINMM.dll\CloseDriver", HDRVR, hDriver, LPARAM, lParam1, LPARAM, lParam2, LRESULT)
    return result
}

/**
 * Opens an instance of an installable driver and initializes the instance using either the driver's default settings or a driver-specific value.
 * @param {PWSTR} szDriverName Address of a null-terminated, wide-character string that specifies the filename of an installable driver or the name of a registry value associated with the installable driver. (This value must have been previously set when the driver was installed.)
 * @param {PWSTR} szSectionName Address of a null-terminated, wide-character string that specifies the name of the registry key containing the registry value given by the <i>lpDriverName</i> parameter. If <i>lpSectionName</i> is <b>NULL</b>, the registry key is assumed to be <b>Drivers32</b>.
 * @param {LPARAM} lParam2 32-bit driver-specific value. This value is passed as the <i>lParam2</i> parameter to the <a href="https://docs.microsoft.com/previous-versions/dd797918(v=vs.85)">DriverProc</a> function of the installable driver.
 * @returns {HDRVR} Returns the handle of the installable driver instance if successful or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-opendriver
 * @since windows5.0
 */
export OpenDriver(szDriverName, szSectionName, lParam2) {
    szDriverName := szDriverName is String ? StrPtr(szDriverName) : szDriverName
    szSectionName := szSectionName is String ? StrPtr(szSectionName) : szSectionName

    result := DllCall("WINMM.dll\OpenDriver", "ptr", szDriverName, "ptr", szSectionName, LPARAM, lParam2, HDRVR)
    return result
}

/**
 * Sends the specified message to the installable driver.
 * @param {HDRVR} hDriver Handle of the installable driver instance. The handle must been previously created by using the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
 * @param {Integer} message Driver message value. It can be a custom message value or one of these standard message values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DRV_QUERYCONFIGURE"></a><a id="drv_queryconfigure"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-queryconfigure">DRV_QUERYCONFIGURE</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries an installable driver about whether it supports the <b>DRV_CONFIGURE</b> message and can display a configuration dialog box.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DRV_CONFIGURE"></a><a id="drv_configure"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-configure">DRV_CONFIGURE</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Notifies an installable driver that it should display a configuration dialog box. (This message should only be sent if the driver returns a nonzero value when the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-queryconfigure">DRV_QUERYCONFIGURE</a> message is processed.)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DRV_INSTALL"></a><a id="drv_install"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-install">DRV_INSTALL</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Notifies an installable driver that it has been successfully installed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DRV_REMOVE"></a><a id="drv_remove"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-remove">DRV_REMOVE</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Notifies an installable driver that it is about to be removed from the system.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {LPARAM} lParam1 32-bit message-dependent information.
 * @param {LPARAM} lParam2 32-bit message-dependent information.
 * @returns {LRESULT} Returns nonzero if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-senddrivermessage
 * @since windows5.0
 */
export SendDriverMessage(hDriver, message, lParam1, lParam2) {
    result := DllCall("WINMM.dll\SendDriverMessage", HDRVR, hDriver, "uint", message, LPARAM, lParam1, LPARAM, lParam2, LRESULT)
    return result
}

/**
 * Retrieves the instance handle of the module that contains the installable driver. This function is provided for compatibility with previous versions of Windows.
 * @param {HDRVR} hDriver Handle of the installable driver instance. The handle must have been previously created by using the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
 * @returns {HMODULE} Returns an instance handle of the driver module if successful or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-drvgetmodulehandle
 * @since windows5.0
 */
export DrvGetModuleHandle(hDriver) {
    result := DllCall("WINMM.dll\DrvGetModuleHandle", HDRVR, hDriver, HMODULE.Owned)
    return result
}

/**
 * Retrieves the instance handle of the module that contains the installable driver.
 * @param {HDRVR} hDriver Handle of the installable driver instance. The handle must have been previously created by using the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
 * @returns {HMODULE} Returns an instance handle of the driver module if successful or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-getdrivermodulehandle
 * @since windows5.0
 */
export GetDriverModuleHandle(hDriver) {
    result := DllCall("WINMM.dll\GetDriverModuleHandle", HDRVR, hDriver, HMODULE.Owned)
    return result
}

/**
 * Provides default processing for any messages not processed by an installable driver. This function is intended to be used only within the DriverProc function of an installable driver. (DefDriverProc)
 * @param {Pointer} dwDriverIdentifier Identifier of the installable driver.
 * @param {HDRVR} _hdrvr Handle of the installable driver instance.
 * @param {Integer} uMsg Driver message value.
 * @param {LPARAM} lParam1 32-bit message-dependent information.
 * @param {LPARAM} lParam2 32-bit message-dependent information.
 * @returns {LRESULT} Returns nonzero if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-defdriverproc
 * @since windows5.0
 */
export DefDriverProc(dwDriverIdentifier, _hdrvr, uMsg, lParam1, lParam2) {
    result := DllCall("WINMM.dll\DefDriverProc", "ptr", dwDriverIdentifier, HDRVR, _hdrvr, "uint", uMsg, LPARAM, lParam1, LPARAM, lParam2, LRESULT)
    return result
}

/**
 * Calls a callback function, sends a message to a window, or unblocks a thread. The action depends on the value of the notification flag. This function is intended to be used only within the DriverProc function of an installable driver.
 * @remarks
 * The client specifies how to notify it when the device is opened. The DCB_FUNCTION and DCB_WINDOW flags are equivalent to the high-order word of the corresponding flags CALLBACK_FUNCTION and CALLBACK_WINDOW specified in the <i>lParam2</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-open">DRV_OPEN</a> message when the device was opened.
 * 
 * If notification is accomplished with a callback function, <i>hdrvr</i>, <i>msg</i>, <i>dwUser</i>, <i>dwParam1</i>, and <i>dwParam2</i> are passed to the callback function. If notification is accomplished by means of a window, only <i>msg</i>, <i>hdrvr</i>, and <i>dwParam1</i> are passed to the window.
 * @param {Pointer} dwCallback Address of the callback function, a window handle, or a task handle, depending on the flag specified in the <i>dwFlags</i> parameter.
 * @param {Integer} dwFlags Notification flags. It can be one of these values:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DCB_NOSWITCH"></a><a id="dcb_noswitch"></a><dl>
 * <dt><b>DCB_NOSWITCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is prevented from switching stacks. This value is only used if enough stack space for the callback function is known to exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DCB_FUNCTION"></a><a id="dcb_function"></a><dl>
 * <dt><b>DCB_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>dwCallback</i> parameter is the address of an application-defined callback function. The system sends the callback message to the callback function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DCB_WINDOW"></a><a id="dcb_window"></a><dl>
 * <dt><b>DCB_WINDOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>dwCallback</i> parameter is the handle of an application-defined window. The system sends subsequent notifications to the window.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DCB_TASK"></a><a id="dcb_task"></a><dl>
 * <dt><b>DCB_TASK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>dwCallback</i> parameter is the handle of an application or task. The system sends subsequent notifications to the application or task.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {HDRVR} hDevice Handle of the installable driver instance.
 * @param {Integer} dwMsg Message value.
 * @param {Pointer} dwUser 32-bit user-instance data supplied by the application when the device was opened.
 * @param {Pointer} dwParam1 32-bit message-dependent parameter.
 * @param {Pointer} dwParam2 32-bit message-dependent parameter.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> if a parameter is invalid or the task's message queue is full.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-drivercallback
 * @since windows5.0
 */
export DriverCallback(dwCallback, dwFlags, hDevice, dwMsg, dwUser, dwParam1, dwParam2) {
    result := DllCall("WINMM.dll\DriverCallback", "ptr", dwCallback, "uint", dwFlags, HDRVR, hDevice, "uint", dwMsg, "ptr", dwUser, "ptr", dwParam1, "ptr", dwParam2, BOOL)
    return result
}

/**
 * Opens the specified sound event.
 * @param {PWSTR} EventName The name of the sound event.
 * @param {PWSTR} AppName The application associated with the sound event.
 * @param {Integer} Flags Flags for playing the sound. The following values are defined.
 * @param {Pointer<HANDLE>} FileHandle Receives the handle to the sound.
 * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-sndopensound
 * @since windows8.1
 */
export sndOpenSound(EventName, AppName, Flags, FileHandle) {
    EventName := EventName is String ? StrPtr(EventName) : EventName
    AppName := AppName is String ? StrPtr(AppName) : AppName

    result := DllCall("api-ms-win-mm-misc-l1-1-1.dll\sndOpenSound", "ptr", EventName, "ptr", AppName, "int", Flags, HANDLE.Ptr, FileHandle, Int32)
    return result
}

/**
 * 
 * @param {HDRVR} hDriver 
 * @param {PWSTR} wszDrvEntry 
 * @param {Pointer<DRIVERMSGPROC>} drvMessage 
 * @param {Integer} wFlags 
 * @returns {Integer} 
 */
export mmDrvInstall(hDriver, wszDrvEntry, drvMessage, wFlags) {
    wszDrvEntry := wszDrvEntry is String ? StrPtr(wszDrvEntry) : wszDrvEntry

    result := DllCall("WINMM.dll\mmDrvInstall", HDRVR, hDriver, "ptr", wszDrvEntry, "ptr", drvMessage, "uint", wFlags, UInt32)
    return result
}

/**
 * The mmioStringToFOURCC function converts a null-terminated string to a four-character code. (mmioStringToFOURCCA)
 * @remarks
 * This function copies the string to a four-character code and pads it with space characters or truncates it if necessary. It does not check whether the code it returns is valid.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The mmiscapi.h header defines mmioStringToFOURCC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} sz Pointer to a null-terminated string to convert to a four-character code.
 * @param {Integer} uFlags Flags for the conversion. The following value is defined:
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_TOUPPER</td>
 * <td>Converts all characters to uppercase.</td>
 * </tr>
 * </table>
 * @returns {Integer} Returns the four-character code created from the given string.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiostringtofourcca
 * @since windows5.0
 */
export mmioStringToFOURCCA(sz, uFlags) {
    sz := sz is String ? StrPtr(sz) : sz

    result := DllCall("WINMM.dll\mmioStringToFOURCCA", "ptr", sz, "uint", uFlags, UInt32)
    return result
}

/**
 * The mmioStringToFOURCCW (Unicode) function converts a null-terminated string to a four-character code. (mmioStringToFOURCCW)
 * @remarks
 * This function copies the string to a four-character code and pads it with space characters or truncates it if necessary. It does not check whether the code it returns is valid.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The mmiscapi.h header defines mmioStringToFOURCC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} sz Pointer to a null-terminated string to convert to a four-character code.
 * @param {Integer} uFlags Flags for the conversion. The following value is defined:
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_TOUPPER</td>
 * <td>Converts all characters to uppercase.</td>
 * </tr>
 * </table>
 * @returns {Integer} Returns the four-character code created from the given string.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiostringtofourccw
 * @since windows5.0
 */
export mmioStringToFOURCCW(sz, uFlags) {
    sz := sz is String ? StrPtr(sz) : sz

    result := DllCall("WINMM.dll\mmioStringToFOURCCW", "ptr", sz, "uint", uFlags, UInt32)
    return result
}

/**
 * The mmioInstallIOProc function installs or removes a custom I/O procedure. This function also locates an installed I/O procedure, using its corresponding four-character code. (mmioInstallIOProcA)
 * @remarks
 * > [!NOTE]
 * > The mmiscapi.h header defines mmioInstallIOProc as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} fccIOProc Four-character code identifying the I/O procedure to install, remove, or locate. All characters in this code should be uppercase.
 * @param {Pointer<LPMMIOPROC>} pIOProc Pointer to the I/O procedure to install. To remove or locate an I/O procedure, set this parameter to <b>NULL</b>. For more information about the I/O procedure, see <a href="https://docs.microsoft.com/previous-versions/dd757332(v=vs.85)">MMIOProc</a>.
 * @param {Integer} dwFlags Flag indicating whether the I/O procedure is being installed, removed, or located. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_FINDPROC</td>
 * <td>Searches for the specified I/O procedure.</td>
 * </tr>
 * <tr>
 * <td>MMIO_GLOBALPROC</td>
 * <td>This flag is a modifier to the MMIO_INSTALLPROC flag and indicates the I/O procedure should be installed for global use. This flag is ignored if MMIO_FINDPROC or MMIO_REMOVEPROC is specified.</td>
 * </tr>
 * <tr>
 * <td>MMIO_INSTALLPROC</td>
 * <td>Installs the specified I/O procedure.</td>
 * </tr>
 * <tr>
 * <td>MMIO_REMOVEPROC</td>
 * <td>Removes the specified I/O procedure.</td>
 * </tr>
 * </table>
 * @returns {Pointer<LPMMIOPROC>} Returns the address of the I/O procedure installed, removed, or located. Returns <b>NULL</b> if there is an error.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioinstallioproca
 * @since windows5.0
 */
export mmioInstallIOProcA(fccIOProc, pIOProc, dwFlags) {
    result := DllCall("WINMM.dll\mmioInstallIOProcA", "uint", fccIOProc, "ptr", pIOProc, "uint", dwFlags, IntPtr)
    return result
}

/**
 * The mmioInstallIOProcW (Unicode) function installs or removes a custom I/O procedure and locates an installed I/O procedure, using its corresponding code.
 * @remarks
 * > [!NOTE]
 * > The mmiscapi.h header defines mmioInstallIOProc as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} fccIOProc Four-character code identifying the I/O procedure to install, remove, or locate. All characters in this code should be uppercase.
 * @param {Pointer<LPMMIOPROC>} pIOProc Pointer to the I/O procedure to install. To remove or locate an I/O procedure, set this parameter to <b>NULL</b>. For more information about the I/O procedure, see <a href="https://docs.microsoft.com/previous-versions/dd757332(v=vs.85)">MMIOProc</a>.
 * @param {Integer} dwFlags Flag indicating whether the I/O procedure is being installed, removed, or located. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_FINDPROC</td>
 * <td>Searches for the specified I/O procedure.</td>
 * </tr>
 * <tr>
 * <td>MMIO_GLOBALPROC</td>
 * <td>This flag is a modifier to the MMIO_INSTALLPROC flag and indicates the I/O procedure should be installed for global use. This flag is ignored if MMIO_FINDPROC or MMIO_REMOVEPROC is specified.</td>
 * </tr>
 * <tr>
 * <td>MMIO_INSTALLPROC</td>
 * <td>Installs the specified I/O procedure.</td>
 * </tr>
 * <tr>
 * <td>MMIO_REMOVEPROC</td>
 * <td>Removes the specified I/O procedure.</td>
 * </tr>
 * </table>
 * @returns {Pointer<LPMMIOPROC>} Returns the address of the I/O procedure installed, removed, or located. Returns <b>NULL</b> if there is an error.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioinstallioprocw
 * @since windows5.0
 */
export mmioInstallIOProcW(fccIOProc, pIOProc, dwFlags) {
    result := DllCall("WINMM.dll\mmioInstallIOProcW", "uint", fccIOProc, "ptr", pIOProc, "uint", dwFlags, IntPtr)
    return result
}

/**
 * The mmioOpen function opens a file for unbuffered or buffered I/O; creates a file; deletes a file; or checks whether a file exists. (mmioOpenA)
 * @remarks
 * If <i>lpmmioinfo</i> points to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure, initialize the members of the structure as follows. All unused members must be set to zero, including reserved members.
 * 
 * <ul>
 * <li>To request that a file be opened with an installed I/O procedure, set <b>fccIOProc</b> to the four-character code of the I/O procedure, and set <b>pIOProc</b> to <b>NULL</b>.</li>
 * <li>To request that a file be opened with an uninstalled I/O procedure, set <a href="https://docs.microsoft.com/previous-versions/dd757098(v=vs.85)">IOProc</a> to point to the I/O procedure, and set <b>fccIOProc</b> to <b>NULL</b>.</li>
 * <li>To request that <b>mmioOpen</b> determine which I/O procedure to use to open the file based on the file name contained in <i>szFilename</i>, set <b>fccIOProc</b> and <b>pIOProc</b> to <b>NULL</b>. This is the default behavior if no <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure is specified.</li>
 * <li>To open a memory file using an internally allocated and managed buffer, set <b>pchBuffer</b> to <b>NULL</b>, <b>fccIOProc</b> to FOURCC_MEM, <b>cchBuffer</b> to the initial size of the buffer, and <b>adwInfo</b> to the incremental expansion size of the buffer. This memory file will automatically be expanded in increments of the number of bytes specified in <b>adwInfo</b> when necessary. Specify the MMIO_CREATE flag for the <i>dwOpenFlags</i> parameter to initially set the end of the file to be the beginning of the buffer.</li>
 * <li>To open a memory file using an application-supplied buffer, set <b>pchBuffer</b> to point to the memory buffer, <b>fccIOProc</b> to FOURCC_MEM, <b>cchBuffer</b> to the size of the buffer, and <b>adwInfo</b> to the incremental expansion size of the buffer. The expansion size in <b>adwInfo</b> should be nonzero only if <b>pchBuffer</b> is a pointer obtained by calling the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> and <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globallock">GlobalLock</a> functions; in this case, the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function will be called to expand the buffer. In other words, if <b>pchBuffer</b> points to a local or global array or a block of memory in the local heap, <b>adwInfo</b> must be zero. Specify the MMIO_CREATE flag for the <i>dwOpenFlags</i> parameter to initially set the end of the file to be the beginning of the buffer. Otherwise, the entire block of memory is considered readable.</li>
 * <li>To use a currently open standard file handle (that is, a file handle that does not have the <b>HMMIO</b> type) with multimedia file I/O services, set <b>fccIOProc</b> to FOURCC_DOS, <b>pchBuffer</b> to <b>NULL</b>, and <b>adwInfo</b> to the standard file handle. Offsets within the file will be relative to the beginning of the file and are not related to the position in the standard file at the time <b>mmioOpen</b> is called; the initial multimedia file I/O offset will be the same as the offset in the standard file when <b>mmioOpen</b> is called. To close the multimedia file I/O file handle without closing the standard file handle, pass the MMIO_FHOPEN flag to <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a>.</li>
 * </ul>
 * You must call <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a> to close a file opened by using <b>mmioOpen</b>. Open files are not automatically closed when an application exits.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The mmiscapi.h header defines mmioOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszFileName Pointer to a buffer that contains the name of the file. If no I/O procedure is specified to open the file, the file name determines how the file is opened, as follows:
 * 
 * <ul>
 * <li>If the file name does not contain a plus sign (+), it is assumed to be the name of a standard file (that is, a file whose type is not <b>HMMIO</b>).</li>
 * <li>If the file name is of the form EXAMPLE.EXT+ABC, the extension EXT is assumed to identify an installed I/O procedure which is called to perform I/O on the file. For more information, see <a href="https://docs.microsoft.com/previous-versions/dd757323(v=vs.85)">mmioInstallIOProc</a>.</li>
 * <li>If the file name is <b>NULL</b> and no I/O procedure is given, the <b>adwInfo</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure is assumed to be the standard (non-<b>HMMIO</b>) file handle of a currently open file.</li>
 * </ul>
 * The file name should not be longer than 128 characters, including the terminating NULL character.
 * 
 * When opening a memory file, set <i>szFilename</i> to <b>NULL</b>.
 * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure containing extra parameters used by <b>mmioOpen</b>. Unless you are opening a memory file, specifying the size of a buffer for buffered I/O, or specifying an uninstalled I/O procedure to open a file, this parameter should be <b>NULL</b>. If this parameter is not <b>NULL</b>, all unused members of the <b>MMIOINFO</b> structure it references must be set to zero, including the reserved members.
 * @param {Integer} fdwOpen Flags for the open operation. The MMIO_READ, MMIO_WRITE, and MMIO_READWRITE flags are mutually exclusive – only one should be specified. The MMIO_COMPAT, MMIO_EXCLUSIVE, MMIO_DENYWRITE, MMIO_DENYREAD, and MMIO_DENYNONE flags are file-sharing flags. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_ALLOCBUF</td>
 * <td>Opens a file for buffered I/O. To allocate a buffer larger or smaller than the default buffer size (8K, defined as MMIO_DEFAULTBUFFER), set the <b>cchBuffer</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure to the desired buffer size. If <b>cchBuffer</b> is zero, the default buffer size is used. If you are providing your own I/O buffer, this flag should not be used.</td>
 * </tr>
 * <tr>
 * <td>MMIO_COMPAT</td>
 * <td>Opens the file with compatibility mode, allowing any process on a given machine to open the file any number of times. If the file has been opened with any of the other sharing modes, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_CREATE</td>
 * <td>Creates a new file. If the file already exists, it is truncated to zero length. For memory files, this flag indicates the end of the file is initially at the start of the buffer.</td>
 * </tr>
 * <tr>
 * <td>MMIO_DELETE</td>
 * <td>Deletes a file. If this flag is specified, <i>szFilename</i> should not be <b>NULL</b>. The return value is <b>TRUE</b> (cast to <b>HMMIO</b>) if the file was deleted successfully or <b>FALSE</b> otherwise. Do not call the <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a> function for a file that has been deleted. If this flag is specified, all other flags that open files are ignored.</td>
 * </tr>
 * <tr>
 * <td>MMIO_DENYNONE</td>
 * <td>Opens the file without denying other processes read or write access to the file. If the file has been opened in compatibility mode by any other process, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_DENYREAD</td>
 * <td>Opens the file and denies other processes read access to the file. If the file has been opened in compatibility mode or for read access by any other process, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_DENYWRITE</td>
 * <td>Opens the file and denies other processes write access to the file. If the file has been opened in compatibility mode or for write access by any other process, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_EXCLUSIVE</td>
 * <td>Opens the file and denies other processes read and write access to the file. If the file has been opened in any other mode for read or write access, even by the current process, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_EXIST</td>
 * <td>Determines whether the specified file exists and creates a fully qualified file name from the path specified in <i>szFilename</i>. The return value is <b>TRUE</b> (cast to <b>HMMIO</b>) if the qualification was successful and the file exists or <b>FALSE</b> otherwise. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file.
 * <div class="alert"><b>Note</b>  Applications should call <b>GetFileAttributes</b>  or <b>GetFileAttributesEx</b> instead.</div>
 * <div> </div>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MMIO_GETTEMP</td>
 * <td>
 * Creates a temporary file name, optionally using the parameters passed in <i>szFilename.</i> For example, you can specify "C:F" to create a temporary file residing on drive C, starting with letter "F". The resulting file name is copied to the buffer pointed to by <i>szFilename</i>.  The buffer must be large enough to hold at least 128 characters.
 * 
 * If the temporary file name was created successfully, the return value is <b>MMSYSERR_NOERROR</b> (cast to <b>HMMIO</b>). Otherwise, the return value is <b>MMIOERR_FILENOTFOUND</b> otherwise. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file. This flag overrides all other flags.
 * 
 * 
 * <div class="alert"><b>Note</b>  Applications should call <b>GetTempFileName</b>  instead.</div>
 * <div> </div>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MMIO_PARSE</td>
 * <td>
 * Creates a fully qualified file name from the path specified in <i>szFilename</i>. The fully qualified name is copied to the buffer pointed to by <i>szFilename</i>.  The buffer must be large enough to hold at least 128 characters.
 * 
 *  If the function succeeds, the return value is <b>TRUE</b> (cast to <b>HMMIO</b>). Otherwise, the return value is <b>FALSE</b>. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file. If this flag is specified, all flags that open files are ignored.
 * 
 * 
 * <div class="alert"><b>Note</b>  Applications should call <b>GetFullPathName</b>  instead.</div>
 * <div> </div>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MMIO_READ</td>
 * <td>Opens the file for reading only. This is the default if MMIO_WRITE and MMIO_READWRITE are not specified.</td>
 * </tr>
 * <tr>
 * <td>MMIO_READWRITE</td>
 * <td>Opens the file for reading and writing.</td>
 * </tr>
 * <tr>
 * <td>MMIO_WRITE</td>
 * <td>Opens the file for writing only.</td>
 * </tr>
 * </table>
 * @returns {HMMIO} 
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioopena
 * @since windows5.0
 */
export mmioOpenA(pszFileName, pmmioinfo, fdwOpen) {
    pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

    result := DllCall("WINMM.dll\mmioOpenA", "ptr", pszFileName, MMIOINFO.Ptr, pmmioinfo, "uint", fdwOpen, HMMIO)
    return result
}

/**
 * The mmioOpenW (Unicode) function opens a file for unbuffered or buffered I/O; creates a file; deletes a file; or checks whether a file exists. (mmioOpenW)
 * @remarks
 * If <i>lpmmioinfo</i> points to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure, initialize the members of the structure as follows. All unused members must be set to zero, including reserved members.
 * 
 * <ul>
 * <li>To request that a file be opened with an installed I/O procedure, set <b>fccIOProc</b> to the four-character code of the I/O procedure, and set <b>pIOProc</b> to <b>NULL</b>.</li>
 * <li>To request that a file be opened with an uninstalled I/O procedure, set <a href="https://docs.microsoft.com/previous-versions/dd757098(v=vs.85)">IOProc</a> to point to the I/O procedure, and set <b>fccIOProc</b> to <b>NULL</b>.</li>
 * <li>To request that <b>mmioOpen</b> determine which I/O procedure to use to open the file based on the file name contained in <i>szFilename</i>, set <b>fccIOProc</b> and <b>pIOProc</b> to <b>NULL</b>. This is the default behavior if no <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure is specified.</li>
 * <li>To open a memory file using an internally allocated and managed buffer, set <b>pchBuffer</b> to <b>NULL</b>, <b>fccIOProc</b> to FOURCC_MEM, <b>cchBuffer</b> to the initial size of the buffer, and <b>adwInfo</b> to the incremental expansion size of the buffer. This memory file will automatically be expanded in increments of the number of bytes specified in <b>adwInfo</b> when necessary. Specify the MMIO_CREATE flag for the <i>dwOpenFlags</i> parameter to initially set the end of the file to be the beginning of the buffer.</li>
 * <li>To open a memory file using an application-supplied buffer, set <b>pchBuffer</b> to point to the memory buffer, <b>fccIOProc</b> to FOURCC_MEM, <b>cchBuffer</b> to the size of the buffer, and <b>adwInfo</b> to the incremental expansion size of the buffer. The expansion size in <b>adwInfo</b> should be nonzero only if <b>pchBuffer</b> is a pointer obtained by calling the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> and <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globallock">GlobalLock</a> functions; in this case, the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function will be called to expand the buffer. In other words, if <b>pchBuffer</b> points to a local or global array or a block of memory in the local heap, <b>adwInfo</b> must be zero. Specify the MMIO_CREATE flag for the <i>dwOpenFlags</i> parameter to initially set the end of the file to be the beginning of the buffer. Otherwise, the entire block of memory is considered readable.</li>
 * <li>To use a currently open standard file handle (that is, a file handle that does not have the <b>HMMIO</b> type) with multimedia file I/O services, set <b>fccIOProc</b> to FOURCC_DOS, <b>pchBuffer</b> to <b>NULL</b>, and <b>adwInfo</b> to the standard file handle. Offsets within the file will be relative to the beginning of the file and are not related to the position in the standard file at the time <b>mmioOpen</b> is called; the initial multimedia file I/O offset will be the same as the offset in the standard file when <b>mmioOpen</b> is called. To close the multimedia file I/O file handle without closing the standard file handle, pass the MMIO_FHOPEN flag to <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a>.</li>
 * </ul>
 * You must call <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a> to close a file opened by using <b>mmioOpen</b>. Open files are not automatically closed when an application exits.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The mmiscapi.h header defines mmioOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszFileName Pointer to a buffer that contains the name of the file. If no I/O procedure is specified to open the file, the file name determines how the file is opened, as follows:
 * 
 * <ul>
 * <li>If the file name does not contain a plus sign (+), it is assumed to be the name of a standard file (that is, a file whose type is not <b>HMMIO</b>).</li>
 * <li>If the file name is of the form EXAMPLE.EXT+ABC, the extension EXT is assumed to identify an installed I/O procedure which is called to perform I/O on the file. For more information, see <a href="https://docs.microsoft.com/previous-versions/dd757323(v=vs.85)">mmioInstallIOProc</a>.</li>
 * <li>If the file name is <b>NULL</b> and no I/O procedure is given, the <b>adwInfo</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure is assumed to be the standard (non-<b>HMMIO</b>) file handle of a currently open file.</li>
 * </ul>
 * The file name should not be longer than 128 characters, including the terminating NULL character.
 * 
 * When opening a memory file, set <i>szFilename</i> to <b>NULL</b>.
 * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure containing extra parameters used by <b>mmioOpen</b>. Unless you are opening a memory file, specifying the size of a buffer for buffered I/O, or specifying an uninstalled I/O procedure to open a file, this parameter should be <b>NULL</b>. If this parameter is not <b>NULL</b>, all unused members of the <b>MMIOINFO</b> structure it references must be set to zero, including the reserved members.
 * @param {Integer} fdwOpen Flags for the open operation. The MMIO_READ, MMIO_WRITE, and MMIO_READWRITE flags are mutually exclusive – only one should be specified. The MMIO_COMPAT, MMIO_EXCLUSIVE, MMIO_DENYWRITE, MMIO_DENYREAD, and MMIO_DENYNONE flags are file-sharing flags. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_ALLOCBUF</td>
 * <td>Opens a file for buffered I/O. To allocate a buffer larger or smaller than the default buffer size (8K, defined as MMIO_DEFAULTBUFFER), set the <b>cchBuffer</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure to the desired buffer size. If <b>cchBuffer</b> is zero, the default buffer size is used. If you are providing your own I/O buffer, this flag should not be used.</td>
 * </tr>
 * <tr>
 * <td>MMIO_COMPAT</td>
 * <td>Opens the file with compatibility mode, allowing any process on a given machine to open the file any number of times. If the file has been opened with any of the other sharing modes, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_CREATE</td>
 * <td>Creates a new file. If the file already exists, it is truncated to zero length. For memory files, this flag indicates the end of the file is initially at the start of the buffer.</td>
 * </tr>
 * <tr>
 * <td>MMIO_DELETE</td>
 * <td>Deletes a file. If this flag is specified, <i>szFilename</i> should not be <b>NULL</b>. The return value is <b>TRUE</b> (cast to <b>HMMIO</b>) if the file was deleted successfully or <b>FALSE</b> otherwise. Do not call the <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a> function for a file that has been deleted. If this flag is specified, all other flags that open files are ignored.</td>
 * </tr>
 * <tr>
 * <td>MMIO_DENYNONE</td>
 * <td>Opens the file without denying other processes read or write access to the file. If the file has been opened in compatibility mode by any other process, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_DENYREAD</td>
 * <td>Opens the file and denies other processes read access to the file. If the file has been opened in compatibility mode or for read access by any other process, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_DENYWRITE</td>
 * <td>Opens the file and denies other processes write access to the file. If the file has been opened in compatibility mode or for write access by any other process, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_EXCLUSIVE</td>
 * <td>Opens the file and denies other processes read and write access to the file. If the file has been opened in any other mode for read or write access, even by the current process, <b>mmioOpen</b> fails.</td>
 * </tr>
 * <tr>
 * <td>MMIO_EXIST</td>
 * <td>Determines whether the specified file exists and creates a fully qualified file name from the path specified in <i>szFilename</i>. The return value is <b>TRUE</b> (cast to <b>HMMIO</b>) if the qualification was successful and the file exists or <b>FALSE</b> otherwise. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file.
 * <div class="alert"><b>Note</b>  Applications should call <b>GetFileAttributes</b>  or <b>GetFileAttributesEx</b> instead.</div>
 * <div> </div>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MMIO_GETTEMP</td>
 * <td>
 * Creates a temporary file name, optionally using the parameters passed in <i>szFilename.</i> For example, you can specify "C:F" to create a temporary file residing on drive C, starting with letter "F". The resulting file name is copied to the buffer pointed to by <i>szFilename</i>.  The buffer must be large enough to hold at least 128 characters.
 * 
 * If the temporary file name was created successfully, the return value is <b>MMSYSERR_NOERROR</b> (cast to <b>HMMIO</b>). Otherwise, the return value is <b>MMIOERR_FILENOTFOUND</b> otherwise. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file. This flag overrides all other flags.
 * 
 * 
 * <div class="alert"><b>Note</b>  Applications should call <b>GetTempFileName</b>  instead.</div>
 * <div> </div>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MMIO_PARSE</td>
 * <td>
 * Creates a fully qualified file name from the path specified in <i>szFilename</i>. The fully qualified name is copied to the buffer pointed to by <i>szFilename</i>.  The buffer must be large enough to hold at least 128 characters.
 * 
 *  If the function succeeds, the return value is <b>TRUE</b> (cast to <b>HMMIO</b>). Otherwise, the return value is <b>FALSE</b>. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file. If this flag is specified, all flags that open files are ignored.
 * 
 * 
 * <div class="alert"><b>Note</b>  Applications should call <b>GetFullPathName</b>  instead.</div>
 * <div> </div>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MMIO_READ</td>
 * <td>Opens the file for reading only. This is the default if MMIO_WRITE and MMIO_READWRITE are not specified.</td>
 * </tr>
 * <tr>
 * <td>MMIO_READWRITE</td>
 * <td>Opens the file for reading and writing.</td>
 * </tr>
 * <tr>
 * <td>MMIO_WRITE</td>
 * <td>Opens the file for writing only.</td>
 * </tr>
 * </table>
 * @returns {HMMIO} 
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioopenw
 * @since windows5.0
 */
export mmioOpenW(pszFileName, pmmioinfo, fdwOpen) {
    pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

    result := DllCall("WINMM.dll\mmioOpenW", "ptr", pszFileName, MMIOINFO.Ptr, pmmioinfo, "uint", fdwOpen, HMMIO)
    return result
}

/**
 * The mmioRename function renames the specified file. (mmioRenameA)
 * @remarks
 * > [!NOTE]
 * > The mmiscapi.h header defines mmioRename as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszFileName Pointer to a string containing the file name of the file to rename.
 * @param {PSTR} pszNewFileName Pointer to a string containing the new file name.
 * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure containing extra parameters used by <b>mmioRename</b>. If this parameter is not <b>NULL</b>, all unused members of the <b>MMIOINFO</b> structure it references must be set to zero, including the reserved members.
 * @param {Integer} fdwRename Flags for the rename operation. This parameter should be set to zero.
 * @returns {Integer} Returns zero if the file was renamed. Otherwise, returns an error code returned from <b>mmioRename</b> or from the I/O procedure.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiorenamea
 * @since windows5.0
 */
export mmioRenameA(pszFileName, pszNewFileName, pmmioinfo, fdwRename) {
    pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
    pszNewFileName := pszNewFileName is String ? StrPtr(pszNewFileName) : pszNewFileName

    result := DllCall("WINMM.dll\mmioRenameA", "ptr", pszFileName, "ptr", pszNewFileName, MMIOINFO.Ptr, pmmioinfo, "uint", fdwRename, UInt32)
    return result
}

/**
 * The mmioRenameW (Unicode) function renames the specified file and contains parameters that modify strings containing a file name. (mmioRenameW)
 * @remarks
 * > [!NOTE]
 * > The mmiscapi.h header defines mmioRename as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszFileName Pointer to a string containing the file name of the file to rename.
 * @param {PWSTR} pszNewFileName Pointer to a string containing the new file name.
 * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure containing extra parameters used by <b>mmioRename</b>. If this parameter is not <b>NULL</b>, all unused members of the <b>MMIOINFO</b> structure it references must be set to zero, including the reserved members.
 * @param {Integer} fdwRename Flags for the rename operation. This parameter should be set to zero.
 * @returns {Integer} Returns zero if the file was renamed. Otherwise, returns an error code returned from <b>mmioRename</b> or from the I/O procedure.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiorenamew
 * @since windows5.0
 */
export mmioRenameW(pszFileName, pszNewFileName, pmmioinfo, fdwRename) {
    pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
    pszNewFileName := pszNewFileName is String ? StrPtr(pszNewFileName) : pszNewFileName

    result := DllCall("WINMM.dll\mmioRenameW", "ptr", pszFileName, "ptr", pszNewFileName, MMIOINFO.Ptr, pmmioinfo, "uint", fdwRename, UInt32)
    return result
}

/**
 * The mmioClose function closes a file that was opened by using the mmioOpen function.
 * @param {HMMIO} _hmmio File handle of the file to close.
 * @param {Integer} fuClose Flags for the close operation. The following value is defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_FHOPEN</td>
 * <td>If the file was opened by passing a file handle whose type is not <b>HMMIO</b>, using this flag tells the <b>mmioClose</b> function to close the multimedia file handle, but not the standard file handle.</td>
 * </tr>
 * </table>
 * @returns {Integer} Returns zero if successful or an error otherwise. The error value can originate from the <a href="https://docs.microsoft.com/previous-versions/dd757319(v=vs.85)">mmioFlush</a> function or from the I/O procedure. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The contents of the buffer could not be written to disk.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioclose
 * @since windows5.0
 */
export mmioClose(_hmmio, fuClose) {
    result := DllCall("WINMM.dll\mmioClose", HMMIO, _hmmio, "uint", fuClose, UInt32)
    return result
}

/**
 * The mmioRead function reads a specified number of bytes from a file opened by using the mmioOpen function.
 * @param {HMMIO} _hmmio File handle of the file to be read.
 * @param {Integer} pch Pointer to a buffer to contain the data read from the file.
 * @param {Integer} cch Number of bytes to read from the file.
 * @returns {Integer} Returns the number of bytes actually read. If the end of the file has been reached and no more bytes can be read, the return value is 0. If there is an error reading from the file, the return value is –1.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioread
 * @since windows5.0
 */
export mmioRead(_hmmio, pch, cch) {
    result := DllCall("WINMM.dll\mmioRead", HMMIO, _hmmio, "ptr", pch, "int", cch, Int32)
    return result
}

/**
 * The mmioWrite function writes a specified number of bytes to a file opened by using the mmioOpen function.
 * @remarks
 * The current file position is incremented by the number of bytes written.
 * @param {HMMIO} _hmmio File handle of the file.
 * @param {Integer} pch Pointer to the buffer to be written to the file.
 * @param {Integer} cch Number of bytes to write to the file.
 * @returns {Integer} Returns the number of bytes actually written. If there is an error writing to the file, the return value is -1.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiowrite
 * @since windows5.0
 */
export mmioWrite(_hmmio, pch, cch) {
    result := DllCall("WINMM.dll\mmioWrite", HMMIO, _hmmio, "ptr", pch, "int", cch, Int32)
    return result
}

/**
 * The mmioSeek function changes the current file position in a file opened by using the mmioOpen function.
 * @remarks
 * Seeking to an invalid location in the file, such as past the end of the file, might not cause <b>mmioSeek</b> to return an error, but it might cause subsequent I/O operations on the file to fail.
 * 
 * To locate the end of a file, call <b>mmioSeek</b> with <i>lOffset</i> set to zero and <i>iOrigin</i> set to SEEK_END.
 * @param {HMMIO} _hmmio File handle of the file to seek in.
 * @param {Integer} lOffset Offset to change the file position.
 * @param {Integer} iOrigin Flags indicating how the offset specified by <i>lOffset</i> is interpreted. The following values are defined:
 * 
 * <table>
 * <tr>
 * <th>Name</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SEEK_CUR"></a><a id="seek_cur"></a><dl>
 * <dt><b>SEEK_CUR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Seeks to <i>lOffset</i> bytes from the current file position.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SEEK_END"></a><a id="seek_end"></a><dl>
 * <dt><b>SEEK_END</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Seeks to <i>lOffset</i> bytes from the end of the file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SEEK_SET"></a><a id="seek_set"></a><dl>
 * <dt><b>SEEK_SET</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Seeks to <i>lOffset</i> bytes from the beginning of the file.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Returns the new file position, in bytes, relative to the beginning of the file. If there is an error, the return value is –1.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioseek
 * @since windows5.0
 */
export mmioSeek(_hmmio, lOffset, iOrigin) {
    result := DllCall("WINMM.dll\mmioSeek", HMMIO, _hmmio, "int", lOffset, "int", iOrigin, Int32)
    return result
}

/**
 * The mmioGetInfo function retrieves information about a file opened by using the mmioOpen function. This information allows the application to directly access the I/O buffer, if the file is opened for buffered I/O.
 * @remarks
 * To directly access the I/O buffer of a file opened for buffered I/O, use the following members of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure filled by <b>mmioGetInfo</b>:
 * 
 * <ul>
 * <li>The <b>pchNext</b> member points to the next byte in the buffer that can be read or written. When you read or write, increment <b>pchNext</b> by the number of bytes read or written.</li>
 * <li>The <b>pchEndRead</b> member points to 1 byte past the last valid byte in the buffer that can be read.</li>
 * <li>The <b>pchEndWrite</b> member points to 1 byte past the last location in the buffer that can be written.</li>
 * </ul>
 * After you read or write to the buffer and modify <b>pchNext</b>, do not call any multimedia file I/O functions except <a href="https://docs.microsoft.com/previous-versions/dd757314(v=vs.85)">mmioAdvance</a> until you call the <a href="https://docs.microsoft.com/previous-versions/dd757339(v=vs.85)">mmioSetInfo</a> function. Call <b>mmioSetInfo</b> when you are finished directly accessing the buffer.
 * 
 * When you reach the end of the buffer specified by the <b>pchEndRead</b> or <b>pchEndWrite</b> member, call <a href="https://docs.microsoft.com/previous-versions/dd757314(v=vs.85)">mmioAdvance</a> to fill the buffer from the disk or write the buffer to the disk. The <b>mmioAdvance</b> function updates the <b>pchNext</b>, <b>pchEndRead</b>, and <b>pchEndWrite</b> members in the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure for the file.
 * 
 * Before calling <a href="https://docs.microsoft.com/previous-versions/dd757314(v=vs.85)">mmioAdvance</a> or <a href="https://docs.microsoft.com/previous-versions/dd757339(v=vs.85)">mmioSetInfo</a> to flush a buffer to disk, set the MMIO_DIRTY flag in the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure for the file. Otherwise, the buffer will not be written to disk.
 * 
 * Do not decrement <b>pchNext</b> or modify any members in the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure other than <b>pchNext</b> and <b>dwFlags</b>. Do not set any flags in <b>dwFlags</b> except MMIO_DIRTY.
 * @param {HMMIO} _hmmio File handle of the file.
 * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to a buffer that receives an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure that <b>mmioGetInfo</b> fills with information about the file.
 * @param {Integer} fuInfo Reserved; must be zero.
 * @returns {Integer} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiogetinfo
 * @since windows5.0
 */
export mmioGetInfo(_hmmio, pmmioinfo, fuInfo) {
    result := DllCall("WINMM.dll\mmioGetInfo", HMMIO, _hmmio, MMIOINFO.Ptr, pmmioinfo, "uint", fuInfo, UInt32)
    return result
}

/**
 * The mmioSetInfo function updates the information retrieved by the mmioGetInfo function about a file opened by using the mmioOpen function. Use this function to terminate direct buffer access of a file opened for buffered I/O.
 * @remarks
 * If you have written to the file I/O buffer, set the MMIO_DIRTY flag in the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure before calling <b>mmioSetInfo</b> to terminate direct buffer access. Otherwise, the buffer will not get flushed to disk.
 * @param {HMMIO} _hmmio File handle of the file.
 * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure filled with information by the <a href="https://docs.microsoft.com/previous-versions/dd757321(v=vs.85)">mmioGetInfo</a> function.
 * @param {Integer} fuInfo Reserved; must be zero.
 * @returns {Integer} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiosetinfo
 * @since windows5.0
 */
export mmioSetInfo(_hmmio, pmmioinfo, fuInfo) {
    result := DllCall("WINMM.dll\mmioSetInfo", HMMIO, _hmmio, MMIOINFO.Ptr, pmmioinfo, "uint", fuInfo, UInt32)
    return result
}

/**
 * The mmioSetBuffer function enables or disables buffered I/O, or changes the buffer or buffer size for a file opened by using the mmioOpen function.
 * @remarks
 * To enable buffering using an internal buffer, set <i>pchBuffer</i> to <b>NULL</b> and <i>cchBuffer</i> to the desired buffer size.
 * 
 * To supply your own buffer, set <i>pchBuffer</i> to point to the buffer, and set <i>cchBuffer</i> to the size of the buffer.
 * 
 * To disable buffered I/O, set <i>pchBuffer</i> to <b>NULL</b> and <i>cchBuffer</i> to zero.
 * 
 * If buffered I/O is already enabled using an internal buffer, you can reallocate the buffer to a different size by setting <i>pchBuffer</i> to <b>NULL</b> and <i>cchBuffer</i> to the new buffer size. The contents of the buffer can be changed after resizing.
 * @param {HMMIO} _hmmio File handle of the file.
 * @param {PSTR} pchBuffer Pointer to an application-defined buffer to use for buffered I/O. If this parameter is <b>NULL</b>, <b>mmioSetBuffer</b> allocates an internal buffer for buffered I/O.
 * @param {Integer} cchBuffer Size, in characters, of the application-defined buffer, or the size of the buffer for <b>mmioSetBuffer</b> to allocate.
 * @param {Integer} fuBuffer Reserved; must be zero.
 * @returns {Integer} Returns zero if successful or an error otherwise. If an error occurs, the file handle remains valid. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The contents of the old buffer could not be written to disk, so the operation was aborted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The new buffer could not be allocated, probably due to a lack of available memory.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiosetbuffer
 * @since windows5.0
 */
export mmioSetBuffer(_hmmio, pchBuffer, cchBuffer, fuBuffer) {
    pchBuffer := pchBuffer is String ? StrPtr(pchBuffer) : pchBuffer

    result := DllCall("WINMM.dll\mmioSetBuffer", HMMIO, _hmmio, "ptr", pchBuffer, "int", cchBuffer, "uint", fuBuffer, UInt32)
    return result
}

/**
 * The mmioFlush function writes the I/O buffer of a file to disk if the buffer has been written to.
 * @remarks
 * Closing a file with the <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a> function automatically flushes its buffer.
 * 
 * If there is insufficient disk space to write the buffer, <b>mmioFlush</b> fails, even if the preceding calls of the <a href="https://docs.microsoft.com/previous-versions/dd757341(v=vs.85)">mmioWrite</a> function were successful.
 * @param {HMMIO} _hmmio File handle of a file opened by using the <a href="https://docs.microsoft.com/previous-versions/dd757331(v=vs.85)">mmioOpen</a> function.
 * @param {Integer} fuFlush Flag determining how the flush is carried out. It can be zero or the following.
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Description
 *                 </th>
 * </tr>
 * <tr>
 * <td>MMIO_EMPTYBUF</td>
 * <td>Empties the buffer after writing it to the disk.</td>
 * </tr>
 * </table>
 * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The contents of the buffer could not be written to disk.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioflush
 * @since windows5.0
 */
export mmioFlush(_hmmio, fuFlush) {
    result := DllCall("WINMM.dll\mmioFlush", HMMIO, _hmmio, "uint", fuFlush, UInt32)
    return result
}

/**
 * The mmioAdvance function advances the I/O buffer of a file set up for direct I/O buffer access with the mmioGetInfo function.
 * @remarks
 * If the file is opened for reading, the I/O buffer is filled from the disk. If the file is opened for writing and the MMIO_DIRTY flag is set in the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure, the buffer is written to disk. The <b>pchNext,</b><b>pchEndRead</b>, and <b>pchEndWrite</b> members of the <b>MMIOINFO</b> structure are updated to reflect the new state of the I/O buffer.
 * 
 * If the specified file is opened for writing or for both reading and writing, the I/O buffer is flushed to disk before the next buffer is read. If the I/O buffer cannot be written to disk because the disk is full, <b>mmioAdvance</b> returns MMIOERR_CANNOTWRITE.
 * 
 * If the specified file is open only for writing, the MMIO_WRITE flag must be specified.
 * 
 * If you have written to the I/O buffer, you must set the MMIO_DIRTY flag in the <b>dwFlags</b> member of the <b>MMIOINFO</b> structure before calling <b>mmioAdvance</b>. Otherwise, the buffer will not be written to disk.
 * 
 * If the end of file is reached, <b>mmioAdvance</b> still returns successfully even though no more data can be read. To check for the end of the file, check if the <b>pchNext</b> and <b>pchEndRead</b> members of the <b>MMIOINFO</b> structure are equal after calling <b>mmioAdvance</b>.
 * @param {HMMIO} _hmmio File handle of a file opened by using the <a href="https://docs.microsoft.com/previous-versions/dd757331(v=vs.85)">mmioOpen</a> function.
 * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure obtained by using the <a href="https://docs.microsoft.com/previous-versions/dd757321(v=vs.85)">mmioGetInfo</a> function. This structure is used to set the current file information, and then it is updated after the buffer is advanced. This parameter is optional.
 * @param {Integer} fuAdvance Flags for the operation. It can be one of the following.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_READ</td>
 * <td>Buffer is filled from the file.</td>
 * </tr>
 * <tr>
 * <td>MMIO_WRITE</td>
 * <td>Buffer is written to the file.</td>
 * </tr>
 * </table>
 * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTEXPAND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified memory file cannot be expanded, probably because the <b>adwInfo</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure was set to zero in the initial call to the <a href="https://docs.microsoft.com/previous-versions/dd757331(v=vs.85)">mmioOpen</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTREAD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred while refilling the buffer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The contents of the buffer could not be written to disk.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There was not enough memory to expand a memory file for further writing.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_UNBUFFERED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified file is not opened for buffered I/O.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioadvance
 * @since windows5.0
 */
export mmioAdvance(_hmmio, pmmioinfo, fuAdvance) {
    result := DllCall("WINMM.dll\mmioAdvance", HMMIO, _hmmio, MMIOINFO.Ptr, pmmioinfo, "uint", fuAdvance, UInt32)
    return result
}

/**
 * The mmioSendMessage function sends a message to the I/O procedure associated with the specified file.
 * @remarks
 * Use this function to send custom user-defined messages. Do not use it to send the MMIOM_OPEN, MMIOM_CLOSE, MMIOM_READ, MMIOM_WRITE, MMIOM_WRITEFLUSH, or MMIOM_SEEK messages. Define custom messages to be greater than or equal to the MMIOM_USER constant.
 * @param {HMMIO} _hmmio File handle for a file opened by using the <a href="https://docs.microsoft.com/previous-versions/dd757331(v=vs.85)">mmioOpen</a> function.
 * @param {Integer} uMsg Message to send to the I/O procedure.
 * @param {LPARAM} lParam1 Parameter for the message.
 * @param {LPARAM} lParam2 Parameter for the message.
 * @returns {LRESULT} Returns a value that corresponds to the message. If the I/O procedure does not recognize the message, the return value should be zero.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiosendmessage
 * @since windows5.0
 */
export mmioSendMessage(_hmmio, uMsg, lParam1, lParam2) {
    result := DllCall("WINMM.dll\mmioSendMessage", HMMIO, _hmmio, "uint", uMsg, LPARAM, lParam1, LPARAM, lParam2, LRESULT)
    return result
}

/**
 * The mmioDescend function descends into a chunk of a RIFF file that was opened by using the mmioOpen function. It can also search for a given chunk.
 * @remarks
 * A "RIFF" chunk consists of a four-byte chunk identifier (type <b>FOURCC</b>), followed by a four-byte chunk size (type <b>DWORD</b>), followed by the data portion of the chunk, followed by a null pad byte if the size of the data portion is odd. If the chunk identifier is "RIFF" or "LIST", the first four bytes of the data portion of the chunk are a form type or list type (type <b>FOURCC</b>).
 * 
 * If you use <b>mmioDescend</b> to search for a chunk, make sure the file position is at the beginning of a chunk before calling the function. The search begins at the current file position and continues to the end of the file. If a parent chunk is specified, the file position should be somewhere within the parent chunk before calling <b>mmioDescend</b>. In this case, the search begins at the current file position and continues to the end of the parent chunk.
 * 
 * If <b>mmioDescend</b> is unsuccessful in searching for a chunk, the current file position is undefined. If <b>mmioDescend</b> is successful, the current file position is changed. If the chunk is a "RIFF" or "LIST" chunk, the new file position will be just after the form type or list type (12 bytes from the beginning of the chunk). For other chunks, the new file position will be the start of the data portion of the chunk (8 bytes from the beginning of the chunk).
 * 
 * The <b>mmioDescend</b> function fills the <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure pointed to by the <i>lpck</i> parameter with the following information:
 * 
 * <ul>
 * <li>The <b>ckid</b> member is the chunk. If the MMIO_FINDCHUNK, MMIO_FINDRIFF, or MMIO_FINDLIST flag is specified for <b>wFlags</b>, the <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure is also used to pass parameters to <b>mmioDescend</b>. In this case, the <b>ckid</b> member specifies the four-character code of the chunk identifier, form type, or list type to search for.</li>
 * <li>The <b>cksize</b> member is the size, in bytes, of the data portion of the chunk. The size includes the form type or list type (if any), but does not include the 8-byte chunk header or the pad byte at the end of the data (if any).</li>
 * <li>The <b>fccType</b> member is the form type if <b>ckid</b> is "RIFF", or the list type if <b>ckid</b> is "LIST". Otherwise, it is <b>NULL</b>.</li>
 * <li>The <b>dwDataOffset</b> member is the file offset of the beginning of the data portion of the chunk. If the chunk is a "RIFF" chunk or a "LIST" chunk, this member is the offset of the form type or list type.</li>
 * <li>The <b>dwFlags</b> member contains other information about the chunk. Currently, this information is not used and is set to zero.</li>
 * </ul>
 * @param {HMMIO} _hmmio File handle of an open RIFF file.
 * @param {Pointer<MMCKINFO>} pmmcki Pointer to a buffer that receives an <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure.
 * @param {Pointer<MMCKINFO>} pmmckiParent Pointer to an optional application-defined <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure identifying the parent of the chunk being searched for. If this parameter is not <b>NULL</b>, <b>mmioDescend</b> assumes the <b>MMCKINFO</b> structure it refers to was filled when <b>mmioDescend</b> was called to descend into the parent chunk, and <b>mmioDescend</b> searches for a chunk within the parent chunk. Set this parameter to <b>NULL</b> if no parent chunk is being specified.
 * @param {Integer} fuDescend Search flags. If no flags are specified, <b>mmioDescend</b> descends into the chunk beginning at the current file position. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_FINDCHUNK</td>
 * <td>Searches for a chunk with the specified chunk identifier.</td>
 * </tr>
 * <tr>
 * <td>MMIO_FINDLIST</td>
 * <td>Searches for a chunk with the chunk identifier "LIST" and with the specified form type.</td>
 * </tr>
 * <tr>
 * <td>MMIO_FINDRIFF</td>
 * <td>Searches for a chunk with the chunk identifier "RIFF" and with the specified form type.</td>
 * </tr>
 * </table>
 * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CHUNKNOTFOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The end of the file (or the end of the parent chunk, if given) was reached before the desired chunk was found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiodescend
 * @since windows5.0
 */
export mmioDescend(_hmmio, pmmcki, pmmckiParent, fuDescend) {
    result := DllCall("WINMM.dll\mmioDescend", HMMIO, _hmmio, MMCKINFO.Ptr, pmmcki, MMCKINFO.Ptr, pmmckiParent, "uint", fuDescend, UInt32)
    return result
}

/**
 * The mmioAscend function ascends out of a chunk in a RIFF file descended into with the mmioDescend function or created with the mmioCreateChunk function.
 * @remarks
 * If the chunk was descended into by using <a href="https://docs.microsoft.com/previous-versions/dd757318(v=vs.85)">mmioDescend</a>, <b>mmioAscend</b> seeks to the location following the end of the chunk (past the extra pad byte, if any).
 * 
 * If the chunk was created and descended into by using <b>mmioCreateChunk</b>, or if the MMIO_DIRTY flag is set in the <b>dwFlags</b> member of the <b>MMCKINFO</b> structure referenced by <i>lpck</i>, the current file position is assumed to be the end of the data portion of the chunk. If the chunk size is not the same as the value stored in the <b>cksize</b> member of the <b>MMCKINFO</b> structure when <b>mmioCreateChunk</b> was called, <b>mmioAscend</b> corrects the chunk size in the file before ascending from the chunk. If the chunk size is odd, <b>mmioAscend</b> writes a null pad byte at the end of the chunk. After ascending from the chunk, the current file position is the location following the end of the chunk (past the extra pad byte, if any).
 * @param {HMMIO} _hmmio File handle of an open RIFF file.
 * @param {Pointer<MMCKINFO>} pmmcki Pointer to an application-defined <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure previously filled by the <a href="https://docs.microsoft.com/previous-versions/dd757318(v=vs.85)">mmioDescend</a> or <a href="https://docs.microsoft.com/previous-versions/dd757317(v=vs.85)">mmioCreateChunk</a> function.
 * @param {Integer} fuAscend Reserved; must be zero.
 * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTSEEK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There was an error while seeking to the end of the chunk.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The contents of the buffer could not be written to disk.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmioascend
 * @since windows5.0
 */
export mmioAscend(_hmmio, pmmcki, fuAscend) {
    result := DllCall("WINMM.dll\mmioAscend", HMMIO, _hmmio, MMCKINFO.Ptr, pmmcki, "uint", fuAscend, UInt32)
    return result
}

/**
 * The mmioCreateChunk function creates a chunk in a RIFF file that was opened by using the mmioOpen function.
 * @remarks
 * This function cannot insert a chunk into the middle of a file. If an application attempts to create a chunk somewhere other than at the end of a file, <b>mmioCreateChunk</b> overwrites existing information in the file.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure pointed to by the <i>lpck</i> parameter should be set up as follows:
 * 
 * <ul>
 * <li>The <b>ckid</b> member specifies the chunk identifier. If <i>wFlags</i> includes MMIO_CREATERIFF or MMIO_CREATELIST, this member will be filled by <b>mmioCreateChunk</b>.</li>
 * <li>The <b>cksize</b> member specifies the size of the data portion of the chunk, including the form type or list type (if any). If this value is not correct when the <a href="https://docs.microsoft.com/previous-versions/dd757315(v=vs.85)">mmioAscend</a> function is called to mark the end of the chunk, <b>mmioAscend</b> corrects the chunk size.</li>
 * <li>The <b>fccType</b> member specifies the form type or list type if the chunk is a "RIFF" or "LIST" chunk. If the chunk is not a "RIFF" or "LIST" chunk, this member does not need to be filled in.</li>
 * <li>The <b>dwDataOffset</b> member does not need to be filled in. The <b>mmioCreateChunk</b> function fills this member with the file offset of the data portion of the chunk.</li>
 * <li>The <b>dwFlags</b> member does not need to be filled in. The <b>mmioCreateChunk</b> function sets the MMIO_DIRTY flag in <b>dwFlags</b>.</li>
 * </ul>
 * @param {HMMIO} _hmmio File handle of an open RIFF file.
 * @param {Pointer<MMCKINFO>} pmmcki Pointer to a buffer that receives a <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure containing information about the chunk to be created.
 * @param {Integer} fuCreate Flags identifying what type of chunk to create. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MMIO_CREATELIST</td>
 * <td>"LIST" chunk.</td>
 * </tr>
 * <tr>
 * <td>MMIO_CREATERIFF</td>
 * <td>"RIFF" chunk.</td>
 * </tr>
 * </table>
 * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTSEEK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to determine offset of the data portion of the chunk.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to write the chunk header.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nf-mmiscapi-mmiocreatechunk
 * @since windows5.0
 */
export mmioCreateChunk(_hmmio, pmmcki, fuCreate) {
    result := DllCall("WINMM.dll\mmioCreateChunk", HMMIO, _hmmio, MMCKINFO.Ptr, pmmcki, "uint", fuCreate, UInt32)
    return result
}

/**
 * The joyGetPosEx function queries a joystick for its position and button status.
 * @remarks
 * This function provides access to extended devices such as rudder pedals, point-of-view hats, devices with a large number of buttons, and coordinate systems using up to six axes. For joystick devices that use three axes or fewer and have fewer than four buttons, use the <a href="https://docs.microsoft.com/previous-versions/dd757107(v=vs.85)">joyGetPos</a> function.
 * @param {Integer} uJoyID Identifier of the joystick to be queried. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
 * @param {Pointer<JOYINFOEX>} pji Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757112(v=vs.85)">JOYINFOEX</a> structure that contains extended position information and button status of the joystick. You must set the <b>dwSize</b> and <b>dwFlags</b> members or <b>joyGetPosEx</b> will fail. The information returned from <b>joyGetPosEx</b> depends on the flags you specify in <b>dwFlags</b>.
 * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_NODRIVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The joystick driver is not present.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_INVALPARAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid parameter was passed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified joystick identifier is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>JOYERR_UNPLUGGED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified joystick is not connected to the system.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>JOYERR_PARMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified joystick identifier is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joygetposex
 * @since windows5.0
 */
export joyGetPosEx(uJoyID, pji) {
    result := DllCall("WINMM.dll\joyGetPosEx", "uint", uJoyID, JOYINFOEX.Ptr, pji, UInt32)
    return result
}

/**
 * The joyGetNumDevs function queries the joystick driver for the number of joysticks it supports.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/previous-versions/dd757107(v=vs.85)">joyGetPos</a> function to determine whether a given joystick is physically attached to the system. If the specified joystick is not connected, <b>joyGetPos</b> returns a JOYERR_UNPLUGGED error value.
 * @returns {Integer} The <b>joyGetNumDevs</b> function returns the number of joysticks supported by the current driver or zero if no driver is installed.
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joygetnumdevs
 * @since windows5.0
 */
export joyGetNumDevs() {
    result := DllCall("WINMM.dll\joyGetNumDevs", UInt32)
    return result
}

/**
 * The joyGetDevCaps function queries a joystick to determine its capabilities. (joyGetDevCapsA)
 * @remarks
 * Use the <a href="https://docs.microsoft.com/previous-versions/dd757106(v=vs.85)">joyGetNumDevs</a> function to determine the number of joystick devices supported by the driver.
 * 
 * This method fails when passed an invalid value for the <i>cbjc</i> parameter.
 * 
 * > [!NOTE]
 * > The joystickapi.h header defines joyGetDevCaps as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer} uJoyID Identifier of the joystick to be queried. Valid values for <i>uJoyID</i> range from -1 to 15. A value of -1 enables retrieval of the <b>szRegKey</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure whether a device is present or not.
 * @param {Integer} pjc Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure to contain the capabilities of the joystick.
 * @param {Integer} cbjc Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure.
 * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_NODRIVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The joystick driver is not present, or the specified joystick identifier is invalid. The specified joystick identifier is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_INVALPARAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid parameter was passed. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joygetdevcapsa
 */
export joyGetDevCapsA(uJoyID, pjc, cbjc) {
    result := DllCall("WINMM.dll\joyGetDevCapsA", "ptr", uJoyID, "ptr", pjc, "uint", cbjc, UInt32)
    return result
}

/**
 * The joyGetDevCapsW (Unicode) function queries a joystick to determine its comprehensive capabilities.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/previous-versions/dd757106(v=vs.85)">joyGetNumDevs</a> function to determine the number of joystick devices supported by the driver.
 *       
 * 
 * This method fails when passed an invalid value for the <i>cbjc</i> parameter. 
 *       
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The joystickapi.h header defines joyGetDevCaps as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer} uJoyID Identifier of the joystick to be queried. Valid values for <i>uJoyID</i> range from -1 to 15. A value of -1 enables retrieval of the <b>szRegKey</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure whether a device is present or not.
 * @param {Integer} pjc Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure to contain the capabilities of the joystick.
 * @param {Integer} cbjc Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure.
 * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_NODRIVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The joystick driver is not present, or the specified joystick identifier is invalid. The specified joystick identifier is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_INVALPARAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid parameter was passed. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joygetdevcapsw
 * @since windows5.0
 */
export joyGetDevCapsW(uJoyID, pjc, cbjc) {
    result := DllCall("WINMM.dll\joyGetDevCapsW", "ptr", uJoyID, "ptr", pjc, "uint", cbjc, UInt32)
    return result
}

/**
 * The joyGetPos function queries a joystick for its position and button status.
 * @remarks
 * For devices that have four to six axes of movement, a point-of-view control, or more than four buttons, use the <a href="https://docs.microsoft.com/previous-versions/dd757108(v=vs.85)">joyGetPosEx</a> function.
 * @param {Integer} uJoyID Identifier of the joystick to be queried. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
 * @param {Pointer<JOYINFO>} pji Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757110(v=vs.85)">JOYINFO</a> structure that contains the position and button status of the joystick.
 * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_NODRIVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The joystick driver is not present.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_INVALPARAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid parameter was passed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>JOYERR_UNPLUGGED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified joystick is not connected to the system.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joygetpos
 * @since windows5.0
 */
export joyGetPos(uJoyID, pji) {
    result := DllCall("WINMM.dll\joyGetPos", "uint", uJoyID, JOYINFO.Ptr, pji, UInt32)
    return result
}

/**
 * The joyGetThreshold function queries a joystick for its current movement threshold.
 * @remarks
 * The movement threshold is the distance the joystick must be moved before a joystick position-change message (<a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-joy1move">MM_JOY1MOVE</a>, <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-joy1zmove">MM_JOY1ZMOVE</a>, <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-joy2move">MM_JOY2MOVE</a>, or <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-joy2zmove">MM_JOY2ZMOVE</a>) is sent to a window that has captured the device. The threshold is initially zero.
 * @param {Integer} uJoyID Identifier of the joystick. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
 * @param {Pointer<Integer>} puThreshold Pointer to a variable that contains the movement threshold value.
 * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_NODRIVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The joystick driver is not present.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_INVALPARAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid parameter was passed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joygetthreshold
 * @since windows5.0
 */
export joyGetThreshold(uJoyID, puThreshold) {
    puThresholdMarshal := puThreshold is VarRef ? "uint*" : "ptr"

    result := DllCall("WINMM.dll\joyGetThreshold", "uint", uJoyID, puThresholdMarshal, puThreshold, UInt32)
    return result
}

/**
 * The joyReleaseCapture function releases the specified captured joystick.
 * @remarks
 * This method returns JOYERR_NOERROR when passed a valid joystick identifier that has not been captured.
 * @param {Integer} uJoyID Identifier of the joystick to be released. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
 * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_NODRIVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The joystick driver is not present.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_INVALIDPARAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified joystick device identifier <i>uJoyID</i> is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>JOYERR_PARMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified joystick device identifier <i>uJoyID</i> is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joyreleasecapture
 * @since windows5.0
 */
export joyReleaseCapture(uJoyID) {
    result := DllCall("WINMM.dll\joyReleaseCapture", "uint", uJoyID, UInt32)
    return result
}

/**
 * The joySetCapture function captures a joystick by causing its messages to be sent to the specified window.
 * @remarks
 * If the specified joystick is currently captured, the function returns undefined behavior. Call the <a href="https://docs.microsoft.com/previous-versions/dd757113(v=vs.85)">joyReleaseCapture</a> function to release the captured joystick, or destroy the window to release the joystick automatically.
 * @param {HWND} _hwnd Handle to the window to receive the joystick messages.
 * @param {Integer} uJoyID Identifier of the joystick to be captured. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
 * @param {Integer} uPeriod Polling frequency, in milliseconds.
 * @param {BOOL} fChanged Change position flag. Specify <b>TRUE</b> for this parameter to send messages only when the position changes by a value greater than the joystick movement threshold. Otherwise, messages are sent at the polling frequency specified in <i>uPeriod</i>.
 * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_NODRIVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The joystick driver is not present.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_INVALPARAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid joystick ID or hwnd is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>JOYERR_NOCANDO</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Cannot capture joystick input because a required service (such as a Windows timer) is unavailable.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>JOYERR_UNPLUGGED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified joystick is not connected to the system.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>JOYERR_PARMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid joystick ID or hwnd is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joysetcapture
 * @since windows5.0
 */
export joySetCapture(_hwnd, uJoyID, uPeriod, fChanged) {
    result := DllCall("WINMM.dll\joySetCapture", HWND, _hwnd, "uint", uJoyID, "uint", uPeriod, BOOL, fChanged, UInt32)
    return result
}

/**
 * The joySetThreshold function sets the movement threshold of a joystick.
 * @remarks
 * The movement threshold is the distance the joystick must be moved before a joystick position-change message (<a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-joy1move">MM_JOY1MOVE</a>, <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-joy1zmove">MM_JOY1ZMOVE</a>, <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-joy2move">MM_JOY2MOVE</a>, or <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-joy2zmove">MM_JOY2ZMOVE</a>) is sent to a window that has captured the device. The threshold is initially zero.
 * @param {Integer} uJoyID Identifier of the joystick. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
 * @param {Integer} uThreshold New movement threshold.
 * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_NODRIVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The joystick driver is not present.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>JOYERR_PARMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified joystick device identifier <i>uJoyID</i> is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joysetthreshold
 * @since windows5.0
 */
export joySetThreshold(uJoyID, uThreshold) {
    result := DllCall("WINMM.dll\joySetThreshold", "uint", uJoyID, "uint", uThreshold, UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export VideoForWindowsVersion() {
    result := DllCall("MSVFW32.dll\VideoForWindowsVersion", UInt32)
    return result
}

/**
 * The ICInfo function retrieves information about specific installed compressors or enumerates the installed compressors.
 * @remarks
 * To enumerate the compressors or decompressors, specify an integer for <i>fccHandler</i>. This function returns information for integers between zero and the number of installed compressors or decompressors of the type specified for <i>fccType</i>.
 * @param {Integer} fccType Four-character code indicating the type of compressor. Specify zero to match all compressor types.
 * @param {Integer} fccHandler Four-character code identifying a specific compressor or a number between zero and the number of installed compressors of the type specified by <i>fccType</i>.
 * @param {Pointer<ICINFO>} lpicinfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-icinfo">ICINFO</a> structure to return information about the compressor.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icinfo
 * @since windows5.0
 */
export ICInfo(fccType, fccHandler, lpicinfo) {
    result := DllCall("MSVFW32.dll\ICInfo", "uint", fccType, "uint", fccHandler, ICINFO_struct.Ptr, lpicinfo, BOOL)
    return result
}

/**
 * The ICInstall function installs a new compressor or decompressor.
 * @remarks
 * Applications must open an installed compressor or decompressor before using it.
 * 
 * If your application installs a function as a compressor or decompressor, it should remove the function with the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icremove">ICRemove</a> function before it terminates. This prevents other applications from trying to access the function when it is not available.
 * @param {Integer} fccType Four-character code indicating the type of data used by the compressor or decompressor. Specify "VIDC" for a video compressor or decompressor.
 * @param {Integer} fccHandler Four-character code identifying a specific compressor or decompressor.
 * @param {LPARAM} _lParam Pointer to a null-terminated string containing the name of the compressor or decompressor, or the address of a function used for compression or decompression. The contents of this parameter are defined by the flags set for <i>wFlags</i>.
 * @param {PSTR} szDesc Reserved; do not use.
 * @param {Integer} wFlags Flags defining the contents of <i>lParam</i>. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Meaning
 *                 </th>
 * </tr>
 * <tr>
 * <td>ICINSTALL_DRIVER</td>
 * <td>The <i>lParam</i> parameter contains the address of a null-terminated string that names the compressor to install.</td>
 * </tr>
 * <tr>
 * <td>ICINSTALL_FUNCTION</td>
 * <td>The <i>lParam</i> parameter contains the address of a compressor function. This function should be structured like the <a href="https://docs.microsoft.com/previous-versions/dd797918(v=vs.85)">DriverProc</a> entry point function used by compressors.</td>
 * </tr>
 * </table>
 * @returns {BOOL} Returns ICERR_OK if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icinstall
 * @since windows5.0
 */
export ICInstall(fccType, fccHandler, _lParam, szDesc, wFlags) {
    szDesc := szDesc is String ? StrPtr(szDesc) : szDesc

    result := DllCall("MSVFW32.dll\ICInstall", "uint", fccType, "uint", fccHandler, LPARAM, _lParam, "ptr", szDesc, "uint", wFlags, BOOL)
    return result
}

/**
 * The ICRemove function removes an installed compressor.
 * @param {Integer} fccType Four-character code indicating the type of data used by the compressor or decompressor. Specify "VIDC" for a video compressor or decompressor.
 * @param {Integer} fccHandler Four-character code identifying a specific compressor or a number between zero and the number of installed compressors of the type specified by <i>fccType</i>.
 * @param {Integer} wFlags Reserved; do not use.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icremove
 * @since windows5.0
 */
export ICRemove(fccType, fccHandler, wFlags) {
    result := DllCall("MSVFW32.dll\ICRemove", "uint", fccType, "uint", fccHandler, "uint", wFlags, BOOL)
    return result
}

/**
 * The ICGetInfo function obtains information about a compressor.
 * @param {HIC} _hic Handle to a compressor.
 * @param {Integer} picinfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-icinfo">ICINFO</a> structure to return information about the compressor.
 * @param {Integer} cb Size, in bytes, of the structure pointed to by <i>lpicinfo</i>.
 * @returns {LRESULT} Returns the number of bytes copied into the structure or zero if an error occurs.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icgetinfo
 * @since windows5.0
 */
export ICGetInfo(_hic, picinfo, cb) {
    result := DllCall("MSVFW32.dll\ICGetInfo", HIC, _hic, "ptr", picinfo, "uint", cb, LRESULT)
    return result
}

/**
 * The ICOpen function opens a compressor or decompressor.
 * @param {Integer} fccType Four-character code indicating the type of compressor or decompressor to open. For video streams, the value of this parameter is "VIDC".
 * @param {Integer} fccHandler Preferred handler of the specified type. Typically, the handler type is stored in the stream header in an AVI file.
 * @param {Integer} wMode Flag defining the use of the compressor or decompressor. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Meaning
 *                 </th>
 * </tr>
 * <tr>
 * <td>ICMODE_COMPRESS</td>
 * <td>Compressor will perform normal compression.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_DECOMPRESS</td>
 * <td>Decompressor will perform normal decompression.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_DRAW</td>
 * <td>Decompressor will decompress and draw the data directly to hardware.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_FASTCOMPRESS</td>
 * <td>Compressor will perform fast (real-time) compression.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_FASTDECOMPRESS</td>
 * <td>Decompressor will perform fast (real-time) decompression.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_QUERY</td>
 * <td>Queries the compressor or decompressor for information.</td>
 * </tr>
 * </table>
 * @returns {HIC} Returns a handle to a compressor or decompressor if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icopen
 * @since windows5.0
 */
export ICOpen(fccType, fccHandler, wMode) {
    result := DllCall("MSVFW32.dll\ICOpen", "uint", fccType, "uint", fccHandler, "uint", wMode, HIC.Owned)
    return result
}

/**
 * The ICOpenFunction function opens a compressor or decompressor defined as a function.
 * @param {Integer} fccType Type of compressor to open. For video, the value of this parameter is ICTYPE_VIDEO.
 * @param {Integer} fccHandler Preferred handler of the specified type. Typically, this comes from the stream header in an AVI file.
 * @param {Integer} wMode Flag to define the use of the compressor or decompressor. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Meaning
 *                 </th>
 * </tr>
 * <tr>
 * <td>ICMODE_COMPRESS</td>
 * <td>Compressor will perform normal compression.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_DECOMPRESS</td>
 * <td>Decompressor will perform normal decompression.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_DRAW</td>
 * <td>Decompressor will decompress and draw the data directly to hardware.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_FASTCOMPRESS</td>
 * <td>Compressor will perform fast (real-time) compression.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_FASTDECOMPRESS</td>
 * <td>Decompressor will perform fast (real-time) decompression.</td>
 * </tr>
 * <tr>
 * <td>ICMODE_QUERY</td>
 * <td>Queries the compressor or decompressor for information.</td>
 * </tr>
 * </table>
 * @param {Pointer<FARPROC>} lpfnHandler Pointer to the function used as the compressor or decompressor.
 * @returns {HIC} Returns a handle to a compressor or decompressor if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icopenfunction
 * @since windows5.0
 */
export ICOpenFunction(fccType, fccHandler, wMode, lpfnHandler) {
    result := DllCall("MSVFW32.dll\ICOpenFunction", "uint", fccType, "uint", fccHandler, "uint", wMode, "ptr", lpfnHandler, HIC.Owned)
    return result
}

/**
 * The ICClose function closes a compressor or decompressor.
 * @param {HIC} _hic Handle to a compressor or decompressor.
 * @returns {LRESULT} Returns ICERR_OK if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icclose
 * @since windows5.0
 */
export ICClose(_hic) {
    result := DllCall("MSVFW32.dll\ICClose", HIC, _hic, LRESULT)
    return result
}

/**
 * The ICSendMessage function sends a message to a compressor.
 * @param {HIC} _hic Handle to the compressor to receive the message.
 * @param {Integer} _msg Message to send.
 * @param {Pointer} dw1 Additional message-specific information.
 * @param {Pointer} dw2 Additional message-specific information.
 * @returns {LRESULT} Returns a message-specific result.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icsendmessage
 * @since windows5.0
 */
export ICSendMessage(_hic, _msg, dw1, dw2) {
    result := DllCall("MSVFW32.dll\ICSendMessage", HIC, _hic, "uint", _msg, "ptr", dw1, "ptr", dw2, LRESULT)
    return result
}

/**
 * The ICCompress function compresses a single video image.
 * @remarks
 * You can obtain the required by size of the output buffer by sending the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/icm-compress-get-size">ICM_COMPRESS_GET_SIZE</a> message (or by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressgetsize">ICCompressGetSize</a> macro).
 * 
 * The compressor sets the contents of <i>lpdwFlags</i> to <b>AVIIF_KEYFRAME</b> when it creates a key frame. If your application creates AVI files, it should save the information returned for <i>lpckid</i> and <i>lpdwFlags</i> in the file.
 * 
 * Compressors use <i>lpbiPrev</i> and <i>lpPrev</i> to perform temporal compression and require an external buffer to store the format and data of the previous frame. Specify <b>NULL</b> for <i>lpbiPrev</i> and <i>lpPrev</i> when compressing a key frame, when performing fast compression, or if the compressor has its own buffer to store the format and data of the previous image. Specify non-<b>NULL</b> values for these parameters if <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icgetinfo">ICGetInfo</a> returns the <b>VIDCF_TEMPORAL</b> flag, the compressor is performing normal compression, and the frame to compress is not a key frame.
 * @param {HIC} _hic Handle to the compressor to use.
 * @param {Integer} dwFlags Compression flag. The following value is defined:
 * @param {Pointer<BITMAPINFOHEADER>} lpbiOutput Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the output format.
 * @param {Pointer<Void>} lpData Pointer to an output buffer large enough to contain a compressed frame.
 * @param {Pointer<BITMAPINFOHEADER>} lpbiInput Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input format.
 * @param {Pointer<Void>} lpBits Pointer to the input buffer.
 * @param {Pointer<Integer>} lpckid Reserved; do not use.
 * @param {Pointer<Integer>} lpdwFlags Pointer to the return flags used in the AVI index. The following value is defined:
 * @param {Integer} lFrameNum Frame number.
 * @param {Integer} dwFrameSize Requested frame size, in bytes. Specify a nonzero value if the compressor supports a suggested frame size, as indicated by the presence of the <b>VIDCF_CRUNCH</b> flag returned by the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icgetinfo">ICGetInfo</a> function. If this flag is not set or a data rate for the frame is not specified, specify zero for this parameter.
 * 
 * A compressor might have to sacrifice image quality or make some other trade-off to obtain the size goal specified in this parameter.
 * @param {Integer} dwQuality Requested quality value for the frame. Specify a nonzero value if the compressor supports a suggested quality value, as indicated by the presence of the <b>VIDCF_QUALITY</b> flag returned by <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icgetinfo">ICGetInfo</a>. Otherwise, specify zero for this parameter.
 * @param {Pointer<BITMAPINFOHEADER>} lpbiPrev Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the format of the previous frame.
 * @param {Pointer<Void>} lpPrev Pointer to the uncompressed image of the previous frame. This parameter is not used for fast temporal compression. Specify <b>NULL</b> for this parameter when compressing a key frame, if the compressor does not support temporal compression, or if the compressor does not require an external buffer to store the format and data of the previous image.
 * @returns {Integer} Returns <b>ICERR_OK</b> if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iccompress
 * @since windows5.0
 */
export ICCompress(_hic, dwFlags, lpbiOutput, lpData, lpbiInput, lpBits, lpckid, lpdwFlags, lFrameNum, dwFrameSize, dwQuality, lpbiPrev, lpPrev) {
    lpDataMarshal := lpData is VarRef ? "ptr" : "ptr"
    lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"
    lpckidMarshal := lpckid is VarRef ? "uint*" : "ptr"
    lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"
    lpPrevMarshal := lpPrev is VarRef ? "ptr" : "ptr"

    result := DllCall("MSVFW32.dll\ICCompress", HIC, _hic, "uint", dwFlags, BITMAPINFOHEADER.Ptr, lpbiOutput, lpDataMarshal, lpData, BITMAPINFOHEADER.Ptr, lpbiInput, lpBitsMarshal, lpBits, lpckidMarshal, lpckid, lpdwFlagsMarshal, lpdwFlags, "int", lFrameNum, "uint", dwFrameSize, "uint", dwQuality, BITMAPINFOHEADER.Ptr, lpbiPrev, lpPrevMarshal, lpPrev, UInt32)
    return result
}

/**
 * The ICDecompress function decompresses a single video frame.
 * @param {HIC} _hic Handle to the decompressor to use.
 * @param {Integer} dwFlags Applicable decompression flags. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Meaning
 *                 </th>
 * </tr>
 * <tr>
 * <td><b>ICDECOMPRESS_HURRYUP</b></td>
 * <td>Tries to decompress at a faster rate. When an application uses this flag, the driver should buffer the decompressed data but not draw the image.</td>
 * </tr>
 * <tr>
 * <td><b>ICDECOMPRESS_NOTKEYFRAME</b></td>
 * <td>Current frame is not a key frame.</td>
 * </tr>
 * <tr>
 * <td><b>ICDECOMPRESS_NULLFRAME</b></td>
 * <td>Current frame does not contain data and the decompressed image should be left the same.</td>
 * </tr>
 * <tr>
 * <td><b>ICDECOMPRESS_PREROLL</b></td>
 * <td>Current frame precedes the point in the movie where playback starts and, therefore, will not be drawn.</td>
 * </tr>
 * <tr>
 * <td><b>ICDECOMPRESS_UPDATE</b></td>
 * <td>Screen is being updated or refreshed.</td>
 * </tr>
 * </table>
 * @param {Pointer<BITMAPINFOHEADER>} lpbiFormat Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the format of the compressed data.
 * @param {Pointer<Void>} lpData Pointer to the input data.
 * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the output format.
 * @param {Pointer<Void>} lpBits Pointer to a buffer that is large enough to contain the decompressed data.
 * @returns {Integer} Returns ICERR_OK if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icdecompress
 * @since windows5.0
 */
export ICDecompress(_hic, dwFlags, lpbiFormat, lpData, lpbi, lpBits) {
    lpDataMarshal := lpData is VarRef ? "ptr" : "ptr"
    lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

    result := DllCall("MSVFW32.dll\ICDecompress", HIC, _hic, "uint", dwFlags, BITMAPINFOHEADER.Ptr, lpbiFormat, lpDataMarshal, lpData, BITMAPINFOHEADER.Ptr, lpbi, lpBitsMarshal, lpBits, UInt32)
    return result
}

/**
 * The ICDrawBegin function initializes the renderer and prepares the drawing destination for drawing.
 * @remarks
 * The <b>ICDRAW_HDC</b> and <b>ICDRAW_FULLSCREEN</b> flags are mutually exclusive. If an application sets the ICDRAW_HDC flag in dwFlags, the decompressor uses <i>hwnd</i>, <i>hdc</i>, and the parameters defining the destination rectangle (<i>xDst</i>, <i>yDst</i>, <i>dxDst</i>, and <i>dyDst)</i>. Your application should set these parameters to the size of the destination rectangle. Specify destination rectangle values relative to the current window or DC.
 * 
 * If an application sets the <b>ICDRAW_FULLSCREEN</b> flag in <i>dwFlags</i>, the <i>hwnd</i> and <i>hdc</i> parameters are not used and should be set to <b>NULL</b>. Also, the destination rectangle is not used and its parameters can be set to zero.
 * 
 * The source rectangle is relative to the full video frame. The portion of the video frame specified by the source rectangle is stretched or shrunk to fit the destination rectangle.
 * 
 * The <i>dwRate</i> and <i>dwScale</i> parameters specify the decompression rate. The integer value specified for <i>dwRate</i> divided by the integer value specified for <i>dwScale</i> defines the frame rate in frames per second. This value is used by the renderer when it is responsible for timing frames during playback.
 * @param {HIC} _hic Handle to the decompressor to use.
 * @param {Integer} dwFlags Decompression flags. The following values are defined.
 *             
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Meaning
 *                 </th>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_ANIMATE</b></td>
 * <td>Application can animate the palette.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_CONTINUE</b></td>
 * <td>Drawing is a continuation of the previous frame.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_FULLSCREEN</b></td>
 * <td>Draws the decompressed data on the full screen.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_HDC</b></td>
 * <td>Draws the decompressed data to a window or a DC.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_MEMORYDC</b></td>
 * <td>DC is off-screen.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_QUERY</b></td>
 * <td>Determines if the decompressor can decompress the data. The driver does not decompress the data.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_UPDATING</b></td>
 * <td>Current frame is being updated rather than played.</td>
 * </tr>
 * </table>
 * @param {HPALETTE} hpal Handle to the palette used for drawing.
 * @param {HWND} _hwnd Handle to the window used for drawing.
 * @param {HDC} _hdc DC used for drawing.
 * @param {Integer} xDst The x-coordinate of the upper right corner of the destination rectangle.
 * @param {Integer} yDst The y-coordinate of the upper right corner of the destination rectangle.
 * @param {Integer} dxDst Width of the destination rectangle.
 * @param {Integer} dyDst Height of the destination rectangle.
 * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the format of the input data to be decompressed.
 * @param {Integer} xSrc The x-coordinate of the upper right corner of the source rectangle.
 * @param {Integer} ySrc The y-coordinate of the upper right corner of the source rectangle.
 * @param {Integer} dxSrc Width of the source rectangle.
 * @param {Integer} dySrc Height of the source rectangle.
 * @param {Integer} dwRate Frame rate numerator. The frame rate, in frames per second, is obtained by dividing <i>dwRate</i> by <i>dwScale</i>.
 * @param {Integer} dwScale Frame rate denominator. The frame rate, in frames per second, is obtained by dividing <i>dwRate</i> by <i>dwScale</i>.
 * @returns {Integer} Returns ICERR_OK if the renderer can decompress the data or <b>ICERR_UNSUPPORTED</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icdrawbegin
 * @since windows5.0
 */
export ICDrawBegin(_hic, dwFlags, hpal, _hwnd, _hdc, xDst, yDst, dxDst, dyDst, lpbi, xSrc, ySrc, dxSrc, dySrc, dwRate, dwScale) {
    result := DllCall("MSVFW32.dll\ICDrawBegin", HIC, _hic, "uint", dwFlags, HPALETTE, hpal, HWND, _hwnd, HDC, _hdc, "int", xDst, "int", yDst, "int", dxDst, "int", dyDst, BITMAPINFOHEADER.Ptr, lpbi, "int", xSrc, "int", ySrc, "int", dxSrc, "int", dySrc, "uint", dwRate, "uint", dwScale, UInt32)
    return result
}

/**
 * The ICDraw function decompresses an image for drawing.
 * @remarks
 * You can initiate drawing the frames by sending the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/icm-draw-start">ICM_DRAW_START</a> message (or by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icdrawstart">ICDrawStart</a> macro). The application should be sure to buffer the required number of frames before drawing is started. Send the <b>KM_GETBUFFERSWANTED</b> message (or use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icgetbufferswanted">ICGetBuffersWanted</a> macro) to obtain this value.
 * @param {HIC} _hic Handle to a decompressor.
 * @param {Integer} dwFlags Decompression flags. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Meaning
 *                 </th>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_HURRYUP</b></td>
 * <td>Data is buffered and not drawn to the screen. Use this flag for fastest decompression.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_NOTKEYFRAME</b></td>
 * <td>Current frame is not a key frame.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_NULLFRAME</b></td>
 * <td>Current frame does not contain any data and the previous frame should be redrawn.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_PREROLL</b></td>
 * <td>Current frame of video occurs before playback should start. For example, if playback will begin on frame 10, and frame 0 is the nearest previous key frame, frames 0 through 9 are sent to the driver with the <b>ICDRAW_PREROLL</b> flag set. The driver needs this data to display frame 10 properly.</td>
 * </tr>
 * <tr>
 * <td><b>ICDRAW_UPDATE</b></td>
 * <td>Updates the screen based on previously received data. Set <i>lpData</i> to <b>NULL</b> when this flag is used.</td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} lpFormat Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input format of the data.
 * @param {Integer} lpData Pointer to the input data.
 * @param {Integer} cbData Size of the input data, in bytes.
 * @param {Integer} lTime Time, in samples, to draw this frame. The units for video data are frames. For a definition of the playback rate, see the <b>dwRate</b> and <b>dwScale</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-icdrawbegin">ICDRAWBEGIN</a> structure.
 * @returns {Integer} Returns<b> ICERR_OK</b> if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icdraw
 * @since windows5.0
 */
export ICDraw(_hic, dwFlags, lpFormat, lpData, cbData, lTime) {
    lpFormatMarshal := lpFormat is VarRef ? "ptr" : "ptr"

    result := DllCall("MSVFW32.dll\ICDraw", HIC, _hic, "uint", dwFlags, lpFormatMarshal, lpFormat, "ptr", lpData, "uint", cbData, "int", lTime, UInt32)
    return result
}

/**
 * The ICLocate function finds a compressor or decompressor that can handle images with the specified formats, or finds a driver that can decompress an image with a specified format directly to hardware.
 * @param {Integer} fccType Four-character code indicating the type of compressor or decompressor to open. For video streams, the value of this parameter is 'VIDC'.
 * @param {Integer} fccHandler Preferred handler of the specified type. Typically, the handler type is stored in the stream header in an AVI file. Specify <b>NULL</b> if your application can use any handler type or it does not know the handler type to use.
 * @param {Pointer<BITMAPINFOHEADER>} lpbiIn Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure defining the input format. A compressor handle is not returned unless it supports this format.
 * @param {Pointer<BITMAPINFOHEADER>} lpbiOut Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure defining an optional decompressed format. You can also specify zero to use the default output format associated with the input format.
 * 
 * If this parameter is nonzero, a compressor handle is not returned unless it can create this output format.
 * @param {Integer} wFlags Flags that describe the search criteria for a compressor or decompressor. The following values are defined:
 *           
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ICMODE_COMPRESS"></a><a id="icmode_compress"></a><dl>
 * <dt><b>ICMODE_COMPRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Finds a compressor that can compress an image with a format defined by <i>lpbiIn</i> to the format defined by <i>lpbiOut</i>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ICMODE_DECOMPRESS"></a><a id="icmode_decompress"></a><dl>
 * <dt><b>ICMODE_DECOMPRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Finds a decompressor that can decompress an image with a format defined by <i>lpbiIn</i> to the format defined by <i>lpbiOut</i>.
 *           
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ICMODE_DRAW"></a><a id="icmode_draw"></a><dl>
 * <dt><b>ICMODE_DRAW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Finds a decompressor that can decompress an image with a format defined by <i>lpbiIn</i> and draw it directly to hardware.
 *           
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ICMODE_FASTCOMPRESS"></a><a id="icmode_fastcompress"></a><dl>
 * <dt><b>ICMODE_FASTCOMPRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Has the same meaning as <b>ICMODE_COMPRESS</b> except the compressor is used for a real-time operation and emphasizes speed over quality.
 *           
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ICMODE_FASTDECOMPRESS"></a><a id="icmode_fastdecompress"></a><dl>
 * <dt><b>ICMODE_FASTDECOMPRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Has the same meaning as <b>ICMODE_DECOMPRESS</b> except the decompressor is used for a real-time operation and emphasizes speed over quality.
 *           
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HIC} Returns a handle to a compressor or decompressor if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iclocate
 * @since windows5.0
 */
export ICLocate(fccType, fccHandler, lpbiIn, lpbiOut, wFlags) {
    result := DllCall("MSVFW32.dll\ICLocate", "uint", fccType, "uint", fccHandler, BITMAPINFOHEADER.Ptr, lpbiIn, BITMAPINFOHEADER.Ptr, lpbiOut, "ushort", wFlags, HIC.Owned)
    return result
}

/**
 * The ICGetDisplayFormat function determines the best format available for displaying a compressed image. The function also opens a compressor if a handle of an open compressor is not specified.
 * @param {HIC} _hic Handle to the compressor to use. Specify <b>NULL</b> to have VCM select and open an appropriate compressor.
 * @param {Pointer<BITMAPINFOHEADER>} lpbiIn Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the compressed format.
 * @param {Pointer<BITMAPINFOHEADER>} lpbiOut Pointer to a buffer to return the decompressed format. The buffer should be large enough for a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure and 256 color entries.
 * @param {Integer} BitDepth Preferred bit depth, if nonzero.
 * @param {Integer} dx Width multiplier to stretch the image. If this parameter is zero, that dimension is not stretched.
 * @param {Integer} dy Height multiplier to stretch the image. If this parameter is zero, that dimension is not stretched.
 * @returns {HIC} Returns a handle to a decompressor if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icgetdisplayformat
 * @since windows5.0
 */
export ICGetDisplayFormat(_hic, lpbiIn, lpbiOut, BitDepth, dx, dy) {
    result := DllCall("MSVFW32.dll\ICGetDisplayFormat", HIC, _hic, BITMAPINFOHEADER.Ptr, lpbiIn, BITMAPINFOHEADER.Ptr, lpbiOut, "int", BitDepth, "int", dx, "int", dy, HIC.Owned)
    return result
}

/**
 * The ICImageCompress function compresses an image to a given size. This function does not require initialization functions.
 * @remarks
 * To obtain the format information from the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure, use the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globallock">GlobalLock</a> function to lock the data. Use the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalfree">GlobalFree</a> function to free the DIB when you are finished.
 * @param {HIC} _hic Handle to a compressor opened with the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icopen">ICOpen</a> function. Specify <b>NULL</b> to have VCM select an appropriate compressor for the compression format. An application can have the user select the compressor by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> function, which opens the selected compressor and returns a handle of the compressor in this parameter.
 * @param {Integer} uiFlags Reserved; must be zero.
 * @param {Pointer<BITMAPINFO>} lpbiIn Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure containing the input data format.
 * @param {Pointer<Void>} lpBits Pointer to input data bits to compress. The data bits exclude header and format information.
 * @param {Pointer<BITMAPINFO>} lpbiOut Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure containing the compressed output format. Specify <b>NULL</b> to have the compressor use an appropriate format.
 * @param {Integer} lQuality Quality value used by the compressor. Values range from 0 to 10,000.
 * @param {Pointer<Integer>} plSize Maximum size desired for the compressed image. The compressor might not be able to compress the data to fit within this size. When the function returns, this parameter points to the size of the compressed image. Image sizes are specified in bytes.
 * @returns {HANDLE} Returns a handle to a compressed DIB. The image data follows the format header.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icimagecompress
 * @since windows5.0
 */
export ICImageCompress(_hic, uiFlags, lpbiIn, lpBits, lpbiOut, lQuality, plSize) {
    lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"
    plSizeMarshal := plSize is VarRef ? "int*" : "ptr"

    result := DllCall("MSVFW32.dll\ICImageCompress", HIC, _hic, "uint", uiFlags, BITMAPINFO.Ptr, lpbiIn, lpBitsMarshal, lpBits, BITMAPINFO.Ptr, lpbiOut, "int", lQuality, plSizeMarshal, plSize, HANDLE.Owned)
    return result
}

/**
 * The ICImageDecompress function decompresses an image without using initialization functions.
 * @remarks
 * To obtain the format information from the <b>LPBITMAPINFOHEADER</b> structure, use the <b>GlobalLock</b> function to lock the data. Use the <b>GlobalFree</b> function to free the DIB when you are finished.
 * @param {HIC} _hic Handle to a decompressor opened with the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icopen">ICOpen</a> function. Specify <b>NULL</b> to have VCM select an appropriate decompressor for the compressed image.
 * @param {Integer} uiFlags Reserved; must be zero.
 * @param {Pointer<BITMAPINFO>} lpbiIn Compressed input data format.
 * @param {Pointer<Void>} lpBits Pointer to input data bits to compress. The data bits exclude header and format information.
 * @param {Pointer<BITMAPINFO>} lpbiOut Decompressed output format. Specify <b>NULL</b> to let decompressor use an appropriate format.
 * @returns {HANDLE} Returns a handle to an uncompressed DIB in the CF_DIB format if successful or <b>NULL</b> otherwise. Image data follows the format header.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icimagedecompress
 * @since windows5.0
 */
export ICImageDecompress(_hic, uiFlags, lpbiIn, lpBits, lpbiOut) {
    lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

    result := DllCall("MSVFW32.dll\ICImageDecompress", HIC, _hic, "uint", uiFlags, BITMAPINFO.Ptr, lpbiIn, lpBitsMarshal, lpBits, BITMAPINFO.Ptr, lpbiOut, HANDLE.Owned)
    return result
}

/**
 * The ICCompressorChoose function displays a dialog box in which a user can select a compressor. This function can display all registered compressors or list only the compressors that support a specific format.
 * @remarks
 * Before using this function, set the <b>cbSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure to the size of the structure. Initialize the rest of the structure to zeros unless you want to specify some valid defaults for the dialog box. If specifying defaults, set the <i>dwFlags</i> member to ICMF_COMPVARS_VALID and initialize the other members of the structure. For more information about initializing the structure, see the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframestart">ICSeqCompressFrameStart</a> function and <b>COMPVARS</b>.
 * @param {HWND} _hwnd Handle to a parent window for the dialog box.
 * @param {Integer} uiFlags Applicable flags. The following values are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Meaning
 *                 </th>
 * </tr>
 * <tr>
 * <td>ICMF_CHOOSE_ALLCOMPRESSORS</td>
 * <td>All compressors should appear in the selection list. If this flag is not specified, only the compressors that can handle the input format appear in the selection list.</td>
 * </tr>
 * <tr>
 * <td>ICMF_CHOOSE_DATARATE</td>
 * <td>Displays a check box and edit box to enter the data rate for the movie.</td>
 * </tr>
 * <tr>
 * <td>ICMF_CHOOSE_KEYFRAME</td>
 * <td>Displays a check box and edit box to enter the frequency of key frames.</td>
 * </tr>
 * <tr>
 * <td>ICMF_CHOOSE_PREVIEW</td>
 * <td>Displays a button to expand the dialog box to include a preview window. The preview window shows how frames of your movie will appear when compressed with the current settings.</td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} pvIn Uncompressed data input format. Only compressors that support the specified data input format are included in the compressor list. This parameter is optional.
 * @param {Pointer<Void>} lpData Pointer to an AVI stream interface to use in the preview window. You must specify a video stream. This parameter is optional.
 * @param {Pointer<COMPVARS>} pc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure. The information returned initializes the structure for use with other functions.
 * @param {PSTR} lpszTitle Pointer to a null-terminated string containing a title for the dialog box. This parameter is optional.
 * @returns {BOOL} Returns <b>TRUE</b> if the user chooses a compressor and presses OK. Returns <b>FALSE</b> on error or if the user presses CANCEL.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iccompressorchoose
 * @since windows5.0
 */
export ICCompressorChoose(_hwnd, uiFlags, pvIn, lpData, pc, lpszTitle) {
    lpszTitle := lpszTitle is String ? StrPtr(lpszTitle) : lpszTitle

    pvInMarshal := pvIn is VarRef ? "ptr" : "ptr"
    lpDataMarshal := lpData is VarRef ? "ptr" : "ptr"

    result := DllCall("MSVFW32.dll\ICCompressorChoose", HWND, _hwnd, "uint", uiFlags, pvInMarshal, pvIn, lpDataMarshal, lpData, COMPVARS.Ptr, pc, "ptr", lpszTitle, BOOL)
    return result
}

/**
 * The ICSeqCompressFrameStart function initializes resources for compressing a sequence of frames using the ICSeqCompressFrame function.
 * @remarks
 * This function uses a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure to provide settings for the specified compressor and intersperses key frames at the rate specified by the <b>lKey</b> member of <b>COMPVARS</b>. You can specify values for the data rate for the sequence and the key-frame frequency by using the appropriate members of <b>COMPVARS</b>.
 * 
 * Use the <b>ICSeqCompressFrameStart</b>, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframe">ICSeqCompressFrame</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframeend">ICSeqCompressFrameEnd</a> functions to compress a sequence of frames to a specified data rate and number of key frames.
 * 
 * When finished with compression, use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorfree">ICCompressorFree</a> function to release the resources specified in <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a>.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> needs to be initialized before you use this function. You can initialize the structure manually or you can allow the user to specify a compressor and initialize a <b>COMPVARS</b> structure by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> function.
 * @param {Pointer<COMPVARS>} pc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure initialized with information for compression.
 * @param {Pointer<BITMAPINFO>} lpbiIn Format of the data to be compressed.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icseqcompressframestart
 * @since windows5.0
 */
export ICSeqCompressFrameStart(pc, lpbiIn) {
    result := DllCall("MSVFW32.dll\ICSeqCompressFrameStart", COMPVARS.Ptr, pc, BITMAPINFO.Ptr, lpbiIn, BOOL)
    return result
}

/**
 * The ICSeqCompressFrameEnd function ends sequence compression that was initiated by using the ICSeqCompressFrameStart and ICSeqCompressFrame functions.
 * @remarks
 * When finished with compression, use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorfree">ICCompressorFree</a> function to release the resources specified by <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a>.
 * @param {Pointer<COMPVARS>} pc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure used during sequence compression.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icseqcompressframeend
 * @since windows5.0
 */
export ICSeqCompressFrameEnd(pc) {
    DllCall("MSVFW32.dll\ICSeqCompressFrameEnd", COMPVARS.Ptr, pc)
}

/**
 * The ICSeqCompressFrame function compresses one frame in a sequence of frames.
 * @remarks
 * This function uses a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure to provide settings for the specified compressor and intersperses key frames at the rate specified by the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframestart">ICSeqCompressorFrameStart</a> function. You can specify values for the data rate for the sequence and the key-frame frequency by using the appropriate members of <b>COMPVARS</b>.
 * 
 * Use this function instead of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompress">ICCompress</a> function to compress a video sequence.
 * 
 * You can allow the user to specify a compressor and initialize a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> function. Or, you can initialize a <b>COMPVARS</b> structure manually.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframestart">ICSeqCompressFrameStart</a>, <b>ICSeqCompressFrame</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframeend">ICSeqCompressFrameEnd</a> functions to compress a sequence of frames to a specified data rate and number of key frames. Use <b>ICSeqCompressFrame</b> once for each frame to be compressed.
 * 
 * When finished with compression, use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorfree">ICCompressorFree</a> function to release the resources specified by <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a>.
 * @param {Pointer<COMPVARS>} pc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure initialized with information about the compression.
 * @param {Pointer<Void>} lpBits Pointer to the data bits to compress. (The data bits exclude header or format information.)
 * @param {Pointer<BOOL>} pfKey Returns whether or not the frame was compressed into a key frame.
 * @param {Pointer<Integer>} plSize Maximum size desired for the compressed image. The compressor might not be able to compress the data to fit within this size. When the function returns, the parameter points to the size of the compressed image. Images sizes are specified in bytes.
 * @returns {Pointer<Void>} Returns the address of the compressed bits if successful or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-icseqcompressframe
 * @since windows5.0
 */
export ICSeqCompressFrame(pc, lpBits, pfKey, plSize) {
    static uiFlags := 0 ;Reserved parameters must always be NULL

    lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"
    pfKeyMarshal := pfKey is VarRef ? "int*" : "ptr"
    plSizeMarshal := plSize is VarRef ? "int*" : "ptr"

    result := DllCall("MSVFW32.dll\ICSeqCompressFrame", COMPVARS.Ptr, pc, "uint", uiFlags, lpBitsMarshal, lpBits, pfKeyMarshal, pfKey, plSizeMarshal, plSize, IntPtr)
    return result
}

/**
 * The ICCompressorFree function frees the resources in the COMPVARS structure used by other VCM functions.
 * @remarks
 * Use this function to release the resources in the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure after using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframestart">ICSeqCompressFrameStart</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframe">ICSeqCompressFrame</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframeend">ICSeqCompressFrameEnd</a> functions.
 * @param {Pointer<COMPVARS>} pc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure containing the resources to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iccompressorfree
 * @since windows5.0
 */
export ICCompressorFree(pc) {
    DllCall("MSVFW32.dll\ICCompressorFree", COMPVARS.Ptr, pc)
}

/**
 * The DrawDibOpen function opens the DrawDib library for use and creates a DrawDib DC for drawing.
 * @remarks
 * When drawing multiple DIBs simultaneously, create a DrawDib DC for each of the images that will be simultaneously on-screen.
 * @returns {Pointer} Returns a handle to a DrawDib DC if successful or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibopen
 * @since windows5.0
 */
export DrawDibOpen() {
    result := DllCall("MSVFW32.dll\DrawDibOpen", IntPtr)
    return result
}

/**
 * The DrawDibClose function closes a DrawDib DC and frees the resources DrawDib allocated for it.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibclose
 * @since windows5.0
 */
export DrawDibClose(hdd) {
    result := DllCall("MSVFW32.dll\DrawDibClose", "ptr", hdd, BOOL)
    return result
}

/**
 * The DrawDibGetBuffer function retrieves the location of the buffer used by DrawDib for decompression.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/previous-versions//ms532284(v=vs.85)">BITMAPINFO</a> structure. This structure is made up of a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure and a 256-entry table defining the colors used by the bitmap.
 * @param {Integer} dwSize Size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure pointed to by <i>lpbi</i>
 * @param {Integer} dwFlags Reserved; must be zero.
 * @returns {Pointer<Void>} Returns the address of the buffer or <b>NULL</b> if no buffer is used. if <i>lpbr</i> is not <b>NULL</b>, it is filled with a copy of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure describing the buffer.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibgetbuffer
 * @since windows5.0
 */
export DrawDibGetBuffer(hdd, lpbi, dwSize, dwFlags) {
    result := DllCall("MSVFW32.dll\DrawDibGetBuffer", "ptr", hdd, BITMAPINFOHEADER.Ptr, lpbi, "uint", dwSize, "uint", dwFlags, IntPtr)
    return result
}

/**
 * The DrawDibGetPalette function retrieves the palette used by a DrawDib DC.
 * @remarks
 * This function assumes the DrawDib DC contains a valid palette entry, implying that a call to this function must follow calls to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a> or <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibbegin">DrawDibBegin</a> functions.
 * 
 * You should rarely need to call this function because you can realize the correct palette in response to a window message by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibrealize">DrawDibRealize</a> function.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @returns {HPALETTE} Returns a handle to the palette if successful or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibgetpalette
 * @since windows5.0
 */
export DrawDibGetPalette(hdd) {
    result := DllCall("MSVFW32.dll\DrawDibGetPalette", "ptr", hdd, HPALETTE.Owned)
    return result
}

/**
 * The DrawDibSetPalette function sets the palette used for drawing DIBs.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @param {HPALETTE} hpal Handle to the palette. Specify <b>NULL</b> to use the default palette.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibsetpalette
 * @since windows5.0
 */
export DrawDibSetPalette(hdd, hpal) {
    result := DllCall("MSVFW32.dll\DrawDibSetPalette", "ptr", hdd, HPALETTE, hpal, BOOL)
    return result
}

/**
 * The DrawDibChangePalette function sets the palette entries used for drawing DIBs.
 * @remarks
 * This function changes the physical palette only if the current DrawDib palette is realized by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibrealize">DrawDibRealize</a> function.
 * 
 * If the color table is not changed, the next call to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a> function that does not specify DDF_SAME_DRAW calls the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibbegin">DrawDibBegin</a> function implicitly.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @param {Integer} iStart Starting palette entry number.
 * @param {Integer} iLen Number of palette entries.
 * @param {Pointer<PALETTEENTRY>} lppe Pointer to an array of palette entries.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibchangepalette
 * @since windows5.0
 */
export DrawDibChangePalette(hdd, iStart, iLen, lppe) {
    result := DllCall("MSVFW32.dll\DrawDibChangePalette", "ptr", hdd, "int", iStart, "int", iLen, PALETTEENTRY.Ptr, lppe, BOOL)
    return result
}

/**
 * The DrawDibRealize function realizes the palette of the DrawDib DC for use with the specified DC.
 * @remarks
 * To select the palette of the DrawDib DC as a background palette, use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a> function and specify the DDF_BACKGROUNDPAL flag.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @param {HDC} _hdc Handle to the DC containing the palette.
 * @param {BOOL} fBackground Background palette flag. If this value is nonzero, the palette is a background palette. If this value is zero and the DC is attached to a window, the logical palette becomes the foreground palette when the window has the input focus. (A DC is attached to a window when the window class style is CS_OWNDC or when the DC is obtained by using the <a href="https://docs.microsoft.com/previous-versions//ms533241(v=vs.85)">GetDC</a> function.)
 * @returns {Integer} Returns the number of entries in the logical palette mapped to different values in the system palette. If an error occurs or no colors were updated, it returns zero.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibrealize
 * @since windows5.0
 */
export DrawDibRealize(hdd, _hdc, fBackground) {
    result := DllCall("MSVFW32.dll\DrawDibRealize", "ptr", hdd, HDC, _hdc, BOOL, fBackground, UInt32)
    return result
}

/**
 * The DrawDibStart function prepares a DrawDib DC for streaming playback.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @param {Integer} rate Playback rate, in microseconds per frame.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibstart
 * @since windows5.0
 */
export DrawDibStart(hdd, rate) {
    result := DllCall("MSVFW32.dll\DrawDibStart", "ptr", hdd, "uint", rate, BOOL)
    return result
}

/**
 * The DrawDibStop function frees the resources used by a DrawDib DC for streaming playback.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibstop
 * @since windows5.0
 */
export DrawDibStop(hdd) {
    result := DllCall("MSVFW32.dll\DrawDibStop", "ptr", hdd, BOOL)
    return result
}

/**
 * The DrawDib function changes parameters of a DrawDib DC or initializes a new DrawDib DC.
 * @remarks
 * This function prepares to draw a DIB specified by <i>lpbi</i> to the DC. The image is stretched to the size specified by <i>dxDest</i> and <i>dyDest</i>. If <i>dxDest</i> and <i>dyDest</i> are set to −1, the DIB is drawn to a 1:1 scale without stretching.
 * 
 * You can update the flags of a DrawDib DC by reissuing <b>DrawDibBegin</b>, specifying the new flags, and changing at least one of the following settings: <i>dxDest</i>, <i>dyDest</i>, <i>lpbi</i>, <i>dxSrc</i>, or <i>dySrc</i>.
 * 
 * If the parameters of <b>DrawDibBegin</b> have not changed, subsequent calls to the function have no effect.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @param {HDC} _hdc Handle to a DC for drawing. This parameter is optional.
 * @param {Integer} dxDst Width, in <b>MM_TEXT</b> client units, of the destination rectangle.
 * @param {Integer} dyDst Height, in <b>MM_TEXT</b> client units, of the destination rectangle.
 * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the image format. The color table for the DIB follows the image format and the <b>biHeight</b> member must be a positive value.
 * @param {Integer} dxSrc Width, in pixels, of the source rectangle.
 * @param {Integer} dySrc Height, in pixels, of the source rectangle.
 * @param {Integer} wFlags Applicable flags for the function. The following values are defined.
 *             
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>DDF_ANIMATE</td>
 * <td>Allows palette animation. If this value is present, DrawDib reserves as many entries as possible by setting <b>PC_RESERVED</b> in the <b>palPalEntry</b> array entries of the <a href="https://docs.microsoft.com/previous-versions//ms532642(v=vs.85)">LOGPALETTE</a> structure, and the palette can be animated by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibchangepalette">DrawDibChangePalette</a> function. If your application uses the <b>DrawDibBegin</b> function with the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a> function, set this value with <b>DrawDibBegin</b> rather than <b>DrawDibDraw</b>.</td>
 * </tr>
 * <tr>
 * <td>DDF_BACKGROUNDPAL</td>
 * <td>Realizes the palette used for drawing as a background task, leaving the current palette used for the display unchanged. (This value is mutually exclusive of <b>DDF_SAME_HDC</b>.)</td>
 * </tr>
 * <tr>
 * <td>DDF_BUFFER</td>
 * <td>Causes DrawDib to try to use an off-screen buffer so <b>DDF_UPDATE</b> can be used. This disables decompression and drawing directly to the screen. If DrawDib is unable to create an off-screen buffer, it will decompress or draw directly to the screen. For more information, see the <b>DDF_UPDATE</b> and <b>DDF_DONTDRAW</b> values described for <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a>.</td>
 * </tr>
 * <tr>
 * <td>DDF_DONTDRAW</td>
 * <td>Current image is not drawn, but is decompressed. <b>DDF_UPDATE</b> can be used later to draw the image. This flag supersedes the <b>DDF_PREROLL</b> flag.</td>
 * </tr>
 * <tr>
 * <td>DDF_FULLSCREEN</td>
 * <td>Not supported.</td>
 * </tr>
 * <tr>
 * <td>DDF_HALFTONE</td>
 * <td>Always dithers the DIB to a standard palette regardless of the palette of the DIB. If your application uses <b>DrawDibBegin</b> with <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a>, set this value with <b>DrawDibBegin</b> rather than <b>DrawDibDraw</b>.</td>
 * </tr>
 * <tr>
 * <td>DDF_JUSTDRAWIT</td>
 * <td>Draws the image by using GDI. Prohibits DrawDib functions from decompressing, stretching, or dithering the image. This strips DrawDib of capabilities that differentiate it from the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> function.</td>
 * </tr>
 * <tr>
 * <td>DDF_SAME_DRAW</td>
 * <td>Use the current drawing parameters for <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a>. Use this value only if <i>lpbi</i>, <i>dxDest</i>, <i>dyDest</i>, <i>dxSrc</i>, and <i>dySrc</i> have not changed since using <b>DrawDibDraw</b> or <b>DrawDibBegin</b>. This flag supersedes the <b>DDF_SAME_DIB</b> and <b>DDF_SAME_SIZE</b> flags.</td>
 * </tr>
 * <tr>
 * <td>DDF_SAME_HDC</td>
 * <td>Use the current DC handle and the palette currently associated with the DC.</td>
 * </tr>
 * <tr>
 * <td>DDF_UPDATE</td>
 * <td>Last buffered bitmap needs to be redrawn. If drawing fails with this value, a buffered image is not available and a new image needs to be specified before the display can be updated.</td>
 * </tr>
 * </table>
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibbegin
 * @since windows5.0
 */
export DrawDibBegin(hdd, _hdc, dxDst, dyDst, lpbi, dxSrc, dySrc, wFlags) {
    result := DllCall("MSVFW32.dll\DrawDibBegin", "ptr", hdd, HDC, _hdc, "int", dxDst, "int", dyDst, BITMAPINFOHEADER.Ptr, lpbi, "int", dxSrc, "int", dySrc, "uint", wFlags, BOOL)
    return result
}

/**
 * The DrawDibDraw function draws a DIB to the screen.
 * @remarks
 * <b>DDF_DONTDRAW</b> causes <b>DrawDibDraw</b> to decompress but not display an image. A subsequent call to <b>DrawDibDraw</b> specifying <b>DDF_UPDATE</b> displays the image.
 * 
 * If the DrawDib DC does not have an off-screen buffer specified, specifying <b>DDF_DONTDRAW</b> causes the frame to be drawn to the screen immediately. Subsequent calls to <b>DrawDibDraw</b> specifying <b>DDF_UPDATE</b> fail.
 * 
 * Although they are set at different times, <b>DDF_UPDATE</b> and <b>DDF_DONTDRAW</b> can be used together to create composite images off-screen. When the off-screen image is complete, you can display the image by calling <b>DrawDibDraw</b>.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @param {HDC} _hdc Handle to the DC.
 * @param {Integer} xDst The x-coordinate, in <b>MM_TEXT</b> client coordinates, of the upper left corner of the destination rectangle.
 * @param {Integer} yDst The y-coordinate, in <b>MM_TEXT</b> client coordinates, of the upper left corner of the destination rectangle.
 * @param {Integer} dxDst Width, in <b>MM_TEXT</b> client coordinates, of the destination rectangle. If <i>dxDst</i> is −1, the width of the bitmap is used.
 * @param {Integer} dyDst Height, in <b>MM_TEXT</b> client coordinates, of the destination rectangle. If <i>dyDst</i> is −1, the height of the bitmap is used.
 * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the image format. The color table for the DIB within <b>BITMAPINFOHEADER</b> follows the format and the <b>biHeight</b> member must be a positive value; <b>DrawDibDraw</b> will not draw inverted DIBs.
 * @param {Pointer<Void>} lpBits Pointer to the buffer that contains the bitmap bits.
 * @param {Integer} xSrc The x-coordinate, in pixels, of the upper left corner of the source rectangle. The coordinates (0,0) represent the upper left corner of the bitmap.
 * @param {Integer} ySrc The y-coordinate, in pixels, of the upper left corner of the source rectangle. The coordinates (0,0) represent the upper left corner of the bitmap.
 * @param {Integer} dxSrc Width, in pixels, of the source rectangle.
 * @param {Integer} dySrc Height, in pixels, of the source rectangle.
 * @param {Integer} wFlags Applicable flags for drawing. The following values are defined.
 *             
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td><b>DDF_BACKGROUNDPAL</b></td>
 * <td>Realizes the palette used for drawing in the background, leaving the actual palette used for display unchanged. This value is valid only if <b>DDF_SAME_HDC</b> is not set.</td>
 * </tr>
 * <tr>
 * <td><b>DDF_DONTDRAW</b></td>
 * <td>Current image is decompressed but not drawn. This flag supersedes the <b>DDF_PREROLL</b> flag.</td>
 * </tr>
 * <tr>
 * <td><b>DDF_FULLSCREEN</b></td>
 * <td>Not supported.</td>
 * </tr>
 * <tr>
 * <td><b>DDF_HALFTONE</b></td>
 * <td>Always dithers the DIB to a standard palette regardless of the palette of the DIB. If your application uses the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibbegin">DrawDibBegin</a> function, set this value in <b>DrawDibBegin</b> rather than in <b>DrawDibDraw</b>.</td>
 * </tr>
 * <tr>
 * <td><b>DDF_HURRYUP</b></td>
 * <td>Data does not have to be drawn (that is, it can be dropped) and <b>DDF_UPDATE</b> will not be used to recall this information. DrawDib checks this value only if it is required to build the next frame; otherwise, the value is ignored.This value is usually used to synchronize video and audio. When synchronizing data, applications should send the image with this value in case the driver needs to buffer the frame to decompress subsequent frames.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td><b>DDF_NOTKEYFRAME</b></td>
 * <td>DIB data is not a key frame.</td>
 * </tr>
 * <tr>
 * <td><b>DDF_SAME_HDC</b></td>
 * <td>Use the current DC handle and the palette currently associated with the DC.</td>
 * </tr>
 * <tr>
 * <td><b>DDF_SAME_DRAW</b></td>
 * <td>Use the current drawing parameters for <b>DrawDibDraw</b>. Use this value only if <i>lpbi</i>, <i>dxDst</i>, <i>dyDst</i>, <i>dxSrc</i>, and <i>dySrc</i> have not changed since using <b>DrawDibDraw</b> or <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibbegin">DrawDibBegin</a>. <b>DrawDibDraw</b> typically checks the parameters, and if they have changed, <b>DrawDibBegin</b> prepares the DrawDib DC for drawing. This flag supersedes the <b>DDF_SAME_DIB</b> and <b>DDF_SAME_SIZE</b> flags.</td>
 * </tr>
 * <tr>
 * <td><b>DDF_UPDATE</b></td>
 * <td>Last buffered bitmap is to be redrawn. If drawing fails with this value, a buffered image is not available and a new image needs to be specified before the display can be updated.</td>
 * </tr>
 * </table>
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibdraw
 * @since windows5.0
 */
export DrawDibDraw(hdd, _hdc, xDst, yDst, dxDst, dyDst, lpbi, lpBits, xSrc, ySrc, dxSrc, dySrc, wFlags) {
    lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

    result := DllCall("MSVFW32.dll\DrawDibDraw", "ptr", hdd, HDC, _hdc, "int", xDst, "int", yDst, "int", dxDst, "int", dyDst, BITMAPINFOHEADER.Ptr, lpbi, lpBitsMarshal, lpBits, "int", xSrc, "int", ySrc, "int", dxSrc, "int", dySrc, "uint", wFlags, BOOL)
    return result
}

/**
 * The DrawDibEnd function clears the flags and other settings of a DrawDib DC that are set by the DrawDibBegin or DrawDibDraw functions.
 * @param {Pointer} hdd Handle to the DrawDib DC to free.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibend
 * @since windows5.0
 */
export DrawDibEnd(hdd) {
    result := DllCall("MSVFW32.dll\DrawDibEnd", "ptr", hdd, BOOL)
    return result
}

/**
 * The DrawDibTime function retrieves timing information about the drawing operation and is used during debug operations.
 * @remarks
 * This function is present only in the debug version of the Microsoft Windows Software Development Kit (SDK) libraries.
 * @param {Pointer} hdd Handle to a DrawDib DC.
 * @param {Pointer<DRAWDIBTIME>} lpddtime Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-drawdibtime">DRAWDIBTIME</a> structure.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibtime
 * @since windows5.0
 */
export DrawDibTime(hdd, lpddtime) {
    result := DllCall("MSVFW32.dll\DrawDibTime", "ptr", hdd, DRAWDIBTIME_struct.Ptr, lpddtime, BOOL)
    return result
}

/**
 * The DrawDibProfileDisplay function determines settings for the display system when using DrawDib functions.
 * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure that contains bitmap information. You can also specify <b>NULL</b> to verify that the profile information is current. If the profile information is not current, DrawDib will rerun the profile tests to obtain a current set of information. When you call <b>DrawDibProfileDisplay</b> with this parameter set to <b>NULL</b>, the return value is meaningless.
 * @returns {LRESULT} Returns a value that indicates the fastest drawing and stretching capabilities of the display system. This value can be zero if the bitmap format is not supported or one or more of the following values.
 *           
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PD_CAN_DRAW_DIB</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * DrawDib can draw images using this format. Stretching might or might not also be supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PD_CAN_STRETCHDIB</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * DrawDib can stretch and draw images using this format.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PD_STRETCHDIB_1_1_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> draws unstretched images using this format faster than an alternative method.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PD_STRETCHDIB_1_2_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> draws stretched images (in a 1:2 ratio) using this format faster than an alternative method.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PD_STRETCHDIB_1_N_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> draws stretched images (in a 1:N ratio) using this format faster than an alternative method.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-drawdibprofiledisplay
 * @since windows5.0
 */
export DrawDibProfileDisplay(lpbi) {
    result := DllCall("MSVFW32.dll\DrawDibProfileDisplay", BITMAPINFOHEADER.Ptr, lpbi, LRESULT)
    return result
}

/**
 * The AVIFileInit function initializes the AVIFile library.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifileinit
 * @since windows5.0
 */
export AVIFileInit() {
    DllCall("AVIFIL32.dll\AVIFileInit")
}

/**
 * The AVIFileExit function exits the AVIFile library and decrements the reference count for the library.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifileexit
 * @since windows5.0
 */
export AVIFileExit() {
    DllCall("AVIFIL32.dll\AVIFileExit")
}

/**
 * The AVIFileAddRef function increments the reference count of an AVI file.
 * @remarks
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface.
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @returns {Integer} Returns the updated reference count for the file interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifileaddref
 * @since windows5.0
 */
export AVIFileAddRef(pfile) {
    result := DllCall("AVIFIL32.dll\AVIFileAddRef", "ptr", pfile, UInt32)
    return result
}

/**
 * The AVIFileRelease function decrements the reference count of an AVI file interface handle and closes the file if the count reaches zero.
 * @remarks
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface.
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @returns {Integer} Returns the reference count of the file. This return value should be used only for debugging purposes.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifilerelease
 * @since windows5.0
 */
export AVIFileRelease(pfile) {
    result := DllCall("AVIFIL32.dll\AVIFileRelease", "ptr", pfile, UInt32)
    return result
}

/**
 * The AVIFileOpen function opens an AVI file and returns the address of a file interface used to access it. (AVIFileOpenA)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines AVIFileOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} szFile Null-terminated string containing the name of the file to open.
 * @param {Integer} uMode Access mode to use when opening the file. The default access mode is OF_READ. The following access modes can be specified with <b>AVIFileOpen</b>.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>OF_CREATE</td>
 * <td>Creates a new file. If the file already exists, it is truncated to zero length.</td>
 * </tr>
 * <tr>
 * <td>OF_PARSE</td>
 * <td>Skips time-consuming operations, such as building an index. Set this flag if you want the function to return as quickly as possible—for example, if you are going to query the file properties but not read the file.</td>
 * </tr>
 * <tr>
 * <td>OF_READ</td>
 * <td>Opens the file for reading.</td>
 * </tr>
 * <tr>
 * <td>OF_READWRITE</td>
 * <td>Opens the file for reading and writing.</td>
 * </tr>
 * <tr>
 * <td>OF_SHARE_DENY_NONE</td>
 * <td>Opens the file nonexclusively. Other processes can open the file with read or write access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode.</td>
 * </tr>
 * <tr>
 * <td>OF_SHARE_DENY_READ</td>
 * <td>Opens the file nonexclusively. Other processes can open the file with write access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode or has read access to it.</td>
 * </tr>
 * <tr>
 * <td>OF_SHARE_DENY_WRITE</td>
 * <td>Opens the file nonexclusively. Other processes can open the file with read access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode or has write access to it.</td>
 * </tr>
 * <tr>
 * <td>OF_SHARE_EXCLUSIVE</td>
 * <td>Opens the file and denies other processes any access to it. <b>AVIFileOpen</b> fails if any other process has opened the file.</td>
 * </tr>
 * <tr>
 * <td>OF_WRITE</td>
 * <td>Opens the file for writing.</td>
 * </tr>
 * </table>
 * @param {Pointer<Guid>} lpHandler Pointer to a class identifier of the standard or custom handler you want to use. If the value is <b>NULL</b>, the system chooses a handler from the registry based on the file extension or the RIFF type specified in the file.
 * @returns {IAVIFile} Pointer to a buffer that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface pointer.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifileopena
 * @since windows5.0
 */
export AVIFileOpenA(szFile, uMode, lpHandler) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    result := DllCall("AVIFIL32.dll\AVIFileOpenA", "ptr*", &ppfile := 0, "ptr", szFile, "uint", uMode, Guid.Ptr, lpHandler, "HRESULT")
    return IAVIFile(ppfile)
}

/**
 * The AVIFileOpenW function (vfw.h) opens an AVI file and returns the address of a file interface used to access it.
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines AVIFileOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} szFile Null-terminated string containing the name of the file to open.
 * @param {Integer} uMode Access mode to use when opening the file. The default access mode is OF_READ. The following access modes can be specified with <b>AVIFileOpen</b>.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>OF_CREATE</td>
 * <td>Creates a new file. If the file already exists, it is truncated to zero length.</td>
 * </tr>
 * <tr>
 * <td>OF_PARSE</td>
 * <td>Skips time-consuming operations, such as building an index. Set this flag if you want the function to return as quickly as possible—for example, if you are going to query the file properties but not read the file.</td>
 * </tr>
 * <tr>
 * <td>OF_READ</td>
 * <td>Opens the file for reading.</td>
 * </tr>
 * <tr>
 * <td>OF_READWRITE</td>
 * <td>Opens the file for reading and writing.</td>
 * </tr>
 * <tr>
 * <td>OF_SHARE_DENY_NONE</td>
 * <td>Opens the file nonexclusively. Other processes can open the file with read or write access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode.</td>
 * </tr>
 * <tr>
 * <td>OF_SHARE_DENY_READ</td>
 * <td>Opens the file nonexclusively. Other processes can open the file with write access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode or has read access to it.</td>
 * </tr>
 * <tr>
 * <td>OF_SHARE_DENY_WRITE</td>
 * <td>Opens the file nonexclusively. Other processes can open the file with read access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode or has write access to it.</td>
 * </tr>
 * <tr>
 * <td>OF_SHARE_EXCLUSIVE</td>
 * <td>Opens the file and denies other processes any access to it. <b>AVIFileOpen</b> fails if any other process has opened the file.</td>
 * </tr>
 * <tr>
 * <td>OF_WRITE</td>
 * <td>Opens the file for writing.</td>
 * </tr>
 * </table>
 * @param {Pointer<Guid>} lpHandler Pointer to a class identifier of the standard or custom handler you want to use. If the value is <b>NULL</b>, the system chooses a handler from the registry based on the file extension or the RIFF type specified in the file.
 * @returns {IAVIFile} Pointer to a buffer that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface pointer.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifileopenw
 * @since windows5.0
 */
export AVIFileOpenW(szFile, uMode, lpHandler) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    result := DllCall("AVIFIL32.dll\AVIFileOpenW", "ptr*", &ppfile := 0, "ptr", szFile, "uint", uMode, Guid.Ptr, lpHandler, "HRESULT")
    return IAVIFile(ppfile)
}

/**
 * The AVIFileInfoW function (vfw.h) obtains information about an AVI file.
 * @remarks
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVIFILEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @param {Integer} pfi Pointer to the structure used to return file information. Typically, this parameter points to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avifileinfoa">AVIFILEINFO</a> structure.
 * @param {Integer} lSize Size, in bytes, of the structure.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifileinfow
 * @since windows5.0
 */
export AVIFileInfoW(pfile, pfi, lSize) {
    result := DllCall("AVIFIL32.dll\AVIFileInfoW", "ptr", pfile, "ptr", pfi, "int", lSize, "HRESULT")
    return result
}

/**
 * The AVIFileInfo function obtains information about an AVI file. (AVIFileInfoA)
 * @remarks
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVIFILEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @param {Integer} pfi Pointer to the structure used to return file information. Typically, this parameter points to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avifileinfoa">AVIFILEINFO</a> structure.
 * @param {Integer} lSize Size, in bytes, of the structure.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifileinfoa
 * @since windows5.0
 */
export AVIFileInfoA(pfile, pfi, lSize) {
    result := DllCall("AVIFIL32.dll\AVIFileInfoA", "ptr", pfile, "ptr", pfi, "int", lSize, "HRESULT")
    return result
}

/**
 * The AVIFileGetStream function returns the address of a stream interface that is associated with a specified AVI file.
 * @remarks
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface. The argument <i>ppavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @param {Integer} fccType Four-character code indicating the type of stream to open. Zero indicates any stream can be opened. The following definitions apply to the data commonly found in AVI streams.
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Description
 *                 </th>
 * </tr>
 * <tr>
 * <td>streamtypeAUDIO</td>
 * <td>Indicates an audio stream.</td>
 * </tr>
 * <tr>
 * <td>streamtypeMIDI</td>
 * <td>Indicates a MIDI stream.</td>
 * </tr>
 * <tr>
 * <td>streamtypeTEXT</td>
 * <td>Indicates a text stream.</td>
 * </tr>
 * <tr>
 * <td>streamtypeVIDEO</td>
 * <td>Indicates a video stream.</td>
 * </tr>
 * </table>
 * @param {Integer} _lParam Count of the stream type. Identifies which occurrence of the specified stream type to access.
 * @returns {IAVIStream} Pointer to the new stream interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifilegetstream
 * @since windows5.0
 */
export AVIFileGetStream(pfile, fccType, _lParam) {
    result := DllCall("AVIFIL32.dll\AVIFileGetStream", "ptr", pfile, "ptr*", &ppavi := 0, "uint", fccType, "int", _lParam, "HRESULT")
    return IAVIStream(ppavi)
}

/**
 * The AVIFileCreateStreamW (Unicode) function (vfw.h) creates a new stream in an existing file and creates an interface to the new stream.
 * @remarks
 * This function starts a reference count for the new stream.
 * 
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface. The argument <i>ppavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVIFileCreateStream as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @param {Pointer<AVISTREAMINFOW>} psi Pointer to a structure containing information about the new stream, including the stream type and its sample rate.
 * @returns {IAVIStream} Pointer to the new stream interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifilecreatestreamw
 * @since windows5.0
 */
export AVIFileCreateStreamW(pfile, psi) {
    result := DllCall("AVIFIL32.dll\AVIFileCreateStreamW", "ptr", pfile, "ptr*", &ppavi := 0, AVISTREAMINFOW_struct.Ptr, psi, "HRESULT")
    return IAVIStream(ppavi)
}

/**
 * The AVIFileCreateStream function creates a new stream in an existing file and creates an interface to the new stream. (AVIFileCreateStreamA)
 * @remarks
 * This function starts a reference count for the new stream.
 * 
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface. The argument <i>ppavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVIFileCreateStream as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @param {Pointer<AVISTREAMINFOA>} psi Pointer to a structure containing information about the new stream, including the stream type and its sample rate.
 * @returns {IAVIStream} Pointer to the new stream interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifilecreatestreama
 * @since windows5.0
 */
export AVIFileCreateStreamA(pfile, psi) {
    result := DllCall("AVIFIL32.dll\AVIFileCreateStreamA", "ptr", pfile, "ptr*", &ppavi := 0, AVISTREAMINFOA_struct.Ptr, psi, "HRESULT")
    return IAVIStream(ppavi)
}

/**
 * The AVIFileWriteData function writes supplementary data (other than normal header, format, and stream data) to the file.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avistreamwritedata">AVIStreamWriteData</a> function to write data that applies to an individual stream.
 * 
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface.
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @param {Integer} ckid RIFF chunk identifier (four-character code) of the data.
 * @param {Integer} lpData Pointer to the buffer used to write the data.
 * @param {Integer} cbData Size, in bytes, of the memory block referenced by <i>lpData</i>.
 * @returns {HRESULT} Returns zero if successful or an error otherwise. In an application has read-only access to the file, the error code AVIERR_READONLY is returned.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifilewritedata
 * @since windows5.0
 */
export AVIFileWriteData(pfile, ckid, lpData, cbData) {
    result := DllCall("AVIFIL32.dll\AVIFileWriteData", "ptr", pfile, "uint", ckid, "ptr", lpData, "int", cbData, "HRESULT")
    return result
}

/**
 * The AVIFileReadData function reads optional header data that applies to the entire file, such as author or copyright information.
 * @remarks
 * The optional header information is custom and does not have a set format.
 * 
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface.
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @param {Integer} ckid RIFF chunk identifier (four-character code) of the data.
 * @param {Integer} lpData Pointer to the buffer used to return the data read.
 * @param {Pointer<Integer>} lpcbData Pointer to a location indicating the size of the memory block referenced by <i>lpData</i>. If the data is read successfully, the value is changed to indicate the amount of data read.
 * @returns {HRESULT} Returns zero if successful or an error otherwise. The return value AVIERR_NODATA indicates that data with the requested chunk identifier does not exist.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifilereaddata
 * @since windows5.0
 */
export AVIFileReadData(pfile, ckid, lpData, lpcbData) {
    lpcbDataMarshal := lpcbData is VarRef ? "int*" : "ptr"

    result := DllCall("AVIFIL32.dll\AVIFileReadData", "ptr", pfile, "uint", ckid, "ptr", lpData, lpcbDataMarshal, lpcbData, "HRESULT")
    return result
}

/**
 * The AVIFileEndRecord function marks the end of a record when writing an interleaved file that uses a 1:1 interleave factor of video to audio data. (Each frame of video is interspersed with an equivalent amount of audio data.).
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avisavea">AVISave</a> function uses this function internally. In general, applications should not need to use this function.
 * 
 * The argument <i>pfile</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface.
 * @param {IAVIFile} pfile Handle to an open AVI file.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avifileendrecord
 * @since windows5.0
 */
export AVIFileEndRecord(pfile) {
    result := DllCall("AVIFIL32.dll\AVIFileEndRecord", "ptr", pfile, "HRESULT")
    return result
}

/**
 * The AVIStreamAddRef function increments the reference count of an AVI stream.
 * @remarks
 * The argument <i>pavi</i> contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open AVI stream.
 * @returns {Integer} Returns the current reference count of the stream. This value should be used only for debugging purposes.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamaddref
 * @since windows5.0
 */
export AVIStreamAddRef(pavi) {
    result := DllCall("AVIFIL32.dll\AVIStreamAddRef", "ptr", pavi, UInt32)
    return result
}

/**
 * The AVIStreamRelease function decrements the reference count of an AVI stream interface handle, and closes the stream if the count reaches zero.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @returns {Integer} Returns the current reference count of the stream. This value should be used only for debugging purposes.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamrelease
 * @since windows5.0
 */
export AVIStreamRelease(pavi) {
    result := DllCall("AVIFIL32.dll\AVIStreamRelease", "ptr", pavi, UInt32)
    return result
}

/**
 * The AVIStreamInfo function obtains stream header information. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines AVISTREAMINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} psi Pointer to a structure to contain the stream information.
 * @param {Integer} lSize Size, in bytes, of the structure used for psi.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreaminfow
 * @since windows5.0
 */
export AVIStreamInfoW(pavi, psi, lSize) {
    result := DllCall("AVIFIL32.dll\AVIStreamInfoW", "ptr", pavi, "ptr", psi, "int", lSize, "HRESULT")
    return result
}

/**
 * The AVIStreamInfo function obtains stream header information. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines AVISTREAMINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} psi Pointer to a structure to contain the stream information.
 * @param {Integer} lSize Size, in bytes, of the structure used for psi.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreaminfoa
 * @since windows5.0
 */
export AVIStreamInfoA(pavi, psi, lSize) {
    result := DllCall("AVIFIL32.dll\AVIStreamInfoA", "ptr", pavi, "ptr", psi, "int", lSize, "HRESULT")
    return result
}

/**
 * The AVIStreamFindSample function returns the position of a sample (key frame, nonempty frame, or a frame containing a format change) relative to the specified position.
 * @remarks
 * The FIND_KEY, FIND_ANY, and FIND_FORMAT flags are mutually exclusive, as are the FIND_NEXT and FIND_PREV flags.
 * 
 * The argument <i>pavi</i> contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} lPos Starting frame for the search.
 * @param {Integer} lFlags Flags that designate the type of frame to locate, the direction in the stream to search, and the type of return information. The following flags are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>FIND_ANY</td>
 * <td>Finds a nonempty frame. This flag supersedes the SEARCH_ANY flag.</td>
 * </tr>
 * <tr>
 * <td>FIND_KEY</td>
 * <td>Finds a key frame. This flag supersedes the SEARCH_KEY flag.</td>
 * </tr>
 * <tr>
 * <td>FIND_FORMAT</td>
 * <td>Finds a format change.</td>
 * </tr>
 * <tr>
 * <td>FIND_NEXT</td>
 * <td>Finds nearest sample, frame, or format change searching forward. The current sample is included in the search. Use this flag with the FIND_ANY, FIND_KEY, or FIND_FORMAT flag. This flag supersedes the SEARCH_FORWARD flag.</td>
 * </tr>
 * <tr>
 * <td>FIND_PREV</td>
 * <td>Finds nearest sample, frame, or format change searching backward. The current sample is included in the search. Use this flag with the FIND_ANY, FIND_KEY, or FIND_FORMAT flag. This flag supersedes the SEARCH_NEAREST and SEARCH_BACKWARD flags.</td>
 * </tr>
 * <tr>
 * <td>FIND_FROM_START</td>
 * <td>Finds first sample, frame, or format change beginning from the start of the stream. Use this flag with the FIND_ANY, FIND_KEY, or FIND_FORMAT flag.</td>
 * </tr>
 * </table>
 * @returns {Integer} Returns the position of the frame found or -1 if the search is unsuccessful.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamfindsample
 * @since windows5.0
 */
export AVIStreamFindSample(pavi, lPos, lFlags) {
    result := DllCall("AVIFIL32.dll\AVIStreamFindSample", "ptr", pavi, "int", lPos, "int", lFlags, Int32)
    return result
}

/**
 * The AVIStreamReadFormat function reads the stream format data.
 * @remarks
 * Standard video stream handlers provide format information in a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure. Standard audio stream handlers provide format information in a <a href="https://docs.microsoft.com/previous-versions/dd743663(v=vs.85)">PCMWAVEFORMAT</a> structure. Other data streams can use other structures that describe the stream data.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} lPos Position in the stream used to obtain the format data.
 * @param {Integer} lpFormat Pointer to a buffer to contain the format data.
 * @param {Pointer<Integer>} lpcbFormat Pointer to a location indicating the size of the memory block referenced by <i>lpFormat</i>. On return, the value is changed to indicate the amount of data read. If <i>lpFormat</i> is <b>NULL</b>, this parameter can be used to obtain the amount of memory needed to return the format.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamreadformat
 * @since windows5.0
 */
export AVIStreamReadFormat(pavi, lPos, lpFormat, lpcbFormat) {
    lpcbFormatMarshal := lpcbFormat is VarRef ? "int*" : "ptr"

    result := DllCall("AVIFIL32.dll\AVIStreamReadFormat", "ptr", pavi, "int", lPos, "ptr", lpFormat, lpcbFormatMarshal, lpcbFormat, "HRESULT")
    return result
}

/**
 * The AVIStreamSetFormat function sets the format of a stream at the specified position.
 * @remarks
 * The handler for writing AVI files does not accept format changes. Besides setting the initial format for a stream, only changes in the palette of a video stream are allowed in an AVI file. The palette change must occur after any frames already written to the AVI file. Other handlers might impose different restrictions.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} lPos Position in the stream to receive the format.
 * @param {Integer} lpFormat Pointer to a structure containing the new format.
 * @param {Integer} cbFormat Size, in bytes, of the block of memory referenced by <i>lpFormat</i>.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamsetformat
 * @since windows5.0
 */
export AVIStreamSetFormat(pavi, lPos, lpFormat, cbFormat) {
    result := DllCall("AVIFIL32.dll\AVIStreamSetFormat", "ptr", pavi, "int", lPos, "ptr", lpFormat, "int", cbFormat, "HRESULT")
    return result
}

/**
 * The AVIStreamReadData function reads optional header data from a stream.
 * @remarks
 * This function retrieves only optional header information from the stream. This information is custom and does not have a set format.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} fcc Four-character code identifying the data.
 * @param {Integer} lp Pointer to the buffer to contain the optional header data.
 * @param {Pointer<Integer>} lpcb Pointer to the location that specifies the buffer size used for <i>lpData</i>. If the read is successful, AVIFile changes this value to indicate the amount of data written into the buffer for <i>lpData</i>.
 * @returns {HRESULT} Returns zero if successful or an error otherwise. The return value AVIERR_NODATA indicates the system could not find any data with the specified chunk identifier.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamreaddata
 * @since windows5.0
 */
export AVIStreamReadData(pavi, fcc, lp, lpcb) {
    lpcbMarshal := lpcb is VarRef ? "int*" : "ptr"

    result := DllCall("AVIFIL32.dll\AVIStreamReadData", "ptr", pavi, "uint", fcc, "ptr", lp, lpcbMarshal, lpcb, "HRESULT")
    return result
}

/**
 * The AVIStreamWriteData function writes optional header information to the stream.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avistreamwrite">AVIStreamWrite</a> function to write the multimedia content of the stream. Use <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifilewritedata">AVIFileWriteData</a> to write data that applies to an entire file.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} fcc Four-character code identifying the data.
 * @param {Integer} lp Pointer to a buffer containing the data to write.
 * @param {Integer} cb Number of bytes of data to write into the stream.
 * @returns {HRESULT} Returns zero if successful or an error otherwise. The return value AVIERR_READONLY indicates the file was opened without write access.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamwritedata
 * @since windows5.0
 */
export AVIStreamWriteData(pavi, fcc, lp, cb) {
    result := DllCall("AVIFIL32.dll\AVIStreamWriteData", "ptr", pavi, "uint", fcc, "ptr", lp, "int", cb, "HRESULT")
    return result
}

/**
 * The AVIStreamRead function reads audio, video or other data from a stream according to the stream type.
 * @remarks
 * If <i>lpBuffer</i> is <b>NULL</b>, this function does not read any data; it returns information about the size of data that would be read.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} lStart First sample to read.
 * @param {Integer} lSamples Number of samples to read. You can also specify the value AVISTREAMREAD_CONVENIENT to let the stream handler determine the number of samples to read.
 * @param {Integer} lpBuffer Pointer to a buffer to contain the data.
 * @param {Integer} cbBuffer Size, in bytes, of the buffer pointed to by <i>lpBuffer</i>.
 * @param {Pointer<Integer>} plBytes Pointer to a buffer that receives the number of bytes of data written in the buffer referenced by <i>lpBuffer</i>. This value can be <b>NULL</b>.
 * @param {Pointer<Integer>} plSamples Pointer to a buffer that receives the number of samples written in the buffer referenced by <i>lpBuffer</i>. This value can be <b>NULL</b>.
 * @returns {HRESULT} Returns zero if successful or an error otherwise. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>AVIERR_BUFFERTOOSMALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer size <i>cbBuffer</i> was smaller than a single sample of data.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>AVIERR_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There was not enough memory to complete the read operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>AVIERR_FILEREAD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A disk error occurred while reading the file.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamread
 * @since windows5.0
 */
export AVIStreamRead(pavi, lStart, lSamples, lpBuffer, cbBuffer, plBytes, plSamples) {
    plBytesMarshal := plBytes is VarRef ? "int*" : "ptr"
    plSamplesMarshal := plSamples is VarRef ? "int*" : "ptr"

    result := DllCall("AVIFIL32.dll\AVIStreamRead", "ptr", pavi, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, plBytesMarshal, plBytes, plSamplesMarshal, plSamples, "HRESULT")
    return result
}

/**
 * The AVIStreamWrite function writes data to a stream.
 * @remarks
 * The default AVI file handler supports writing only at the end of a stream. The "WAVE" file handler supports writing anywhere.
 * 
 * This function overwrites existing data, rather than inserting new data.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} lStart First sample to write.
 * @param {Integer} lSamples Number of samples to write.
 * @param {Integer} lpBuffer Pointer to a buffer containing the data to write.
 * @param {Integer} cbBuffer Size of the buffer referenced by <i>lpBuffer</i>.
 * @param {Integer} dwFlags Flag associated with this data. The following flag is defined:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="AVIIF_KEYFRAME"></a><a id="aviif_keyframe"></a><dl>
 * <dt><b>AVIIF_KEYFRAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates this data does not rely on preceding data in the file.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} plSampWritten Pointer to a buffer that receives the number of samples written. This can be set to <b>NULL</b>.
 * @param {Pointer<Integer>} plBytesWritten Pointer to a buffer that receives the number of bytes written. This can be set to <b>NULL</b>.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamwrite
 * @since windows5.0
 */
export AVIStreamWrite(pavi, lStart, lSamples, lpBuffer, cbBuffer, dwFlags, plSampWritten, plBytesWritten) {
    plSampWrittenMarshal := plSampWritten is VarRef ? "int*" : "ptr"
    plBytesWrittenMarshal := plBytesWritten is VarRef ? "int*" : "ptr"

    result := DllCall("AVIFIL32.dll\AVIStreamWrite", "ptr", pavi, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, "uint", dwFlags, plSampWrittenMarshal, plSampWritten, plBytesWrittenMarshal, plBytesWritten, "HRESULT")
    return result
}

/**
 * The AVIStreamStart function returns the starting sample number for the stream.
 * @remarks
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @returns {Integer} Returns the number if successful or -1 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamstart
 * @since windows5.0
 */
export AVIStreamStart(pavi) {
    result := DllCall("AVIFIL32.dll\AVIStreamStart", "ptr", pavi, Int32)
    return result
}

/**
 * The AVIStreamLength function returns the length of the stream.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @returns {Integer} Returns the stream's length, in samples, if successful or -1 otherwise.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamlength
 * @since windows5.0
 */
export AVIStreamLength(pavi) {
    result := DllCall("AVIFIL32.dll\AVIStreamLength", "ptr", pavi, Int32)
    return result
}

/**
 * The AVIStreamTimeToSample function converts from milliseconds to samples.
 * @remarks
 * Samples typically correspond to audio samples or video frames. Other stream types might support different formats than these.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} lTime Time, expressed in milliseconds.
 * @returns {Integer} Returns the converted time if successful or -1 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamtimetosample
 * @since windows5.0
 */
export AVIStreamTimeToSample(pavi, lTime) {
    result := DllCall("AVIFIL32.dll\AVIStreamTimeToSample", "ptr", pavi, "int", lTime, Int32)
    return result
}

/**
 * The AVIStreamSampleToTime function converts a stream position from samples to milliseconds.
 * @remarks
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} lSample Position information. A sample can correspond to blocks of audio, a video frame, or other format, depending on the stream type.
 * @returns {Integer} Returns the converted time if successful or −1 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamsampletotime
 * @since windows5.0
 */
export AVIStreamSampleToTime(pavi, lSample) {
    result := DllCall("AVIFIL32.dll\AVIStreamSampleToTime", "ptr", pavi, "int", lSample, Int32)
    return result
}

/**
 * The AVIStreamBeginStreaming function specifies the parameters used in streaming and lets a stream handler prepare for streaming.
 * @remarks
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Pointer to a stream.
 * @param {Integer} lStart Starting frame for streaming.
 * @param {Integer} lEnd Ending frame for streaming.
 * @param {Integer} lRate Speed at which the file is read relative to its natural speed. Specify 1000 for the normal speed. Values less than 1000 indicate a slower-than-normal speed; values greater than 1000 indicate a faster-than-normal speed.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreambeginstreaming
 * @since windows5.0
 */
export AVIStreamBeginStreaming(pavi, lStart, lEnd, lRate) {
    result := DllCall("AVIFIL32.dll\AVIStreamBeginStreaming", "ptr", pavi, "int", lStart, "int", lEnd, "int", lRate, "HRESULT")
    return result
}

/**
 * The AVIStreamEndStreaming function ends streaming.
 * @remarks
 * Many stream implementations ignore this function.
 * 
 * The argument <i>pavi</i> contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} pavi Pointer to a stream.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamendstreaming
 * @since windows5.0
 */
export AVIStreamEndStreaming(pavi) {
    result := DllCall("AVIFIL32.dll\AVIStreamEndStreaming", "ptr", pavi, "HRESULT")
    return result
}

/**
 * The AVIStreamGetFrameOpen function prepares to decompress video frames from the specified video stream.
 * @param {IAVIStream} pavi Pointer to the video stream used as the video source.
 * @param {Pointer<BITMAPINFOHEADER>} lpbiWanted Pointer to a structure that defines the desired video format. Specify <b>NULL</b> to use a default format. You can also specify AVIGETFRAMEF_BESTDISPLAYFMT to decode the frames to the best format for your display.
 * @returns {IGetFrame} Returns a <b>GetFrame</b> object that can be used with the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avistreamgetframe">AVIStreamGetFrame</a> function. If the system cannot find a decompressor that can decompress the stream to the given format, or to any RGB format, the function returns <b>NULL</b>.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamgetframeopen
 * @since windows5.0
 */
export AVIStreamGetFrameOpen(pavi, lpbiWanted) {
    result := DllCall("AVIFIL32.dll\AVIStreamGetFrameOpen", "ptr", pavi, BITMAPINFOHEADER.Ptr, lpbiWanted, IGetFrame)
    return result
}

/**
 * The AVIStreamGetFrame function returns the address of a decompressed video frame.
 * @remarks
 * The returned frame is valid only until the next call to this function or the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avistreamgetframeclose">AVIStreamGetFrameClose</a> function.
 * @param {IGetFrame} pg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-igetframe">IGetFrame</a> interface.
 * @param {Integer} lPos Position, in samples, within the stream of the desired frame.
 * @returns {Pointer<Void>} Returns a pointer to the frame data if successful or <b>NULL</b> otherwise. The frame data is returned as a packed DIB.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamgetframe
 * @since windows5.0
 */
export AVIStreamGetFrame(pg, lPos) {
    result := DllCall("AVIFIL32.dll\AVIStreamGetFrame", "ptr", pg, "int", lPos, IntPtr)
    return result
}

/**
 * The AVIStreamGetFrameClose function releases resources used to decompress video frames.
 * @param {IGetFrame} pg Handle returned from the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avistreamgetframeopen">AVIStreamGetFrameOpen</a> function. After calling this function, the handle is invalid.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamgetframeclose
 * @since windows5.0
 */
export AVIStreamGetFrameClose(pg) {
    result := DllCall("AVIFIL32.dll\AVIStreamGetFrameClose", "ptr", pg, "HRESULT")
    return result
}

/**
 * The AVIStreamOpenFromFile function opens a single stream from a file. (ANSI)
 * @remarks
 * This function calls the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifilegetstream">AVIFileGetStream</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifilerelease">AVIFileRelease</a> functions.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVIStreamOpenFromFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} szFile Null-terminated string containing the name of the file to open.
 * @param {Integer} fccType Four-character code indicating the type of stream to be opened. Zero indicates that any stream can be opened. The following definitions apply to the data commonly found in AVI streams:
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Description
 *                 </th>
 * </tr>
 * <tr>
 * <td>streamtypeAUDIO</td>
 * <td>Indicates an audio stream.</td>
 * </tr>
 * <tr>
 * <td>streamtypeMIDI</td>
 * <td>Indicates a MIDI stream.</td>
 * </tr>
 * <tr>
 * <td>streamtypeTEXT</td>
 * <td>Indicates a text stream.</td>
 * </tr>
 * <tr>
 * <td>streamtypeVIDEO</td>
 * <td>Indicates a video stream.</td>
 * </tr>
 * </table>
 * @param {Integer} _lParam Stream of the type specified in <i>fccType</i> to access. This parameter is zero-based; use zero to specify the first occurrence.
 * @param {Integer} _mode Access mode to use when opening the file. This function can open only existing streams, so the OF_CREATE mode flag cannot be used. For more information about the available flags for the <i>mode</i> parameter, see the <b>OpenFile</b> function.
 * @param {Pointer<Guid>} pclsidHandler Pointer to a class identifier of the handler you want to use. If the value is <b>NULL</b>, the system chooses one from the registry based on the file extension or the file RIFF type.
 * @returns {IAVIStream} Pointer to a buffer that receives the new stream handle.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamopenfromfilea
 * @since windows5.0
 */
export AVIStreamOpenFromFileA(szFile, fccType, _lParam, _mode, pclsidHandler) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    result := DllCall("AVIFIL32.dll\AVIStreamOpenFromFileA", "ptr*", &ppavi := 0, "ptr", szFile, "uint", fccType, "int", _lParam, "uint", _mode, Guid.Ptr, pclsidHandler, "HRESULT")
    return IAVIStream(ppavi)
}

/**
 * The AVIStreamOpenFromFile function opens a single stream from a file. (Unicode)
 * @remarks
 * This function calls the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifilegetstream">AVIFileGetStream</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifilerelease">AVIFileRelease</a> functions.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVIStreamOpenFromFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} szFile Null-terminated string containing the name of the file to open.
 * @param {Integer} fccType Four-character code indicating the type of stream to be opened. Zero indicates that any stream can be opened. The following definitions apply to the data commonly found in AVI streams:
 * 
 * <table>
 * <tr>
 * <th>Value
 *                 </th>
 * <th>Description
 *                 </th>
 * </tr>
 * <tr>
 * <td>streamtypeAUDIO</td>
 * <td>Indicates an audio stream.</td>
 * </tr>
 * <tr>
 * <td>streamtypeMIDI</td>
 * <td>Indicates a MIDI stream.</td>
 * </tr>
 * <tr>
 * <td>streamtypeTEXT</td>
 * <td>Indicates a text stream.</td>
 * </tr>
 * <tr>
 * <td>streamtypeVIDEO</td>
 * <td>Indicates a video stream.</td>
 * </tr>
 * </table>
 * @param {Integer} _lParam Stream of the type specified in <i>fccType</i> to access. This parameter is zero-based; use zero to specify the first occurrence.
 * @param {Integer} _mode Access mode to use when opening the file. This function can open only existing streams, so the OF_CREATE mode flag cannot be used. For more information about the available flags for the <i>mode</i> parameter, see the <b>OpenFile</b> function.
 * @param {Pointer<Guid>} pclsidHandler Pointer to a class identifier of the handler you want to use. If the value is <b>NULL</b>, the system chooses one from the registry based on the file extension or the file RIFF type.
 * @returns {IAVIStream} Pointer to a buffer that receives the new stream handle.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamopenfromfilew
 * @since windows5.0
 */
export AVIStreamOpenFromFileW(szFile, fccType, _lParam, _mode, pclsidHandler) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    result := DllCall("AVIFIL32.dll\AVIStreamOpenFromFileW", "ptr*", &ppavi := 0, "ptr", szFile, "uint", fccType, "int", _lParam, "uint", _mode, Guid.Ptr, pclsidHandler, "HRESULT")
    return IAVIStream(ppavi)
}

/**
 * The AVIStreamCreate function creates a stream not associated with any file.
 * @remarks
 * You should not need to call this function. Some functions, such as <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-createeditablestream">CreateEditableStream</a> and <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avimakecompressedstream">AVIMakeCompressedStream</a>, use it internally.
 * 
 * The argument <i>ppavi</i> contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {Integer} lParam1 Stream-handler specific information.
 * @param {Integer} lParam2 Stream-handler specific information.
 * @param {Pointer<Guid>} pclsidHandler Pointer to the class identifier used for the stream.
 * @returns {IAVIStream} Pointer to a buffer that receives the new stream interface.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avistreamcreate
 * @since windows5.0
 */
export AVIStreamCreate(lParam1, lParam2, pclsidHandler) {
    result := DllCall("AVIFIL32.dll\AVIStreamCreate", "ptr*", &ppavi := 0, "int", lParam1, "int", lParam2, Guid.Ptr, pclsidHandler, "HRESULT")
    return IAVIStream(ppavi)
}

/**
 * The AVIMakeCompressedStream function creates a compressed stream from an uncompressed stream and a compression filter, and returns the address of a pointer to the compressed stream. This function supports audio and video compression.
 * @remarks
 * Applications can read from or write to the compressed stream.
 * 
 * A <b>PAVISTREAM</b> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {IAVIStream} ppsSource Pointer to the stream to be compressed.
 * @param {Pointer<AVICOMPRESSOPTIONS>} lpOptions Pointer to a structure that identifies the type of compression to use and the options to apply. You can specify video compression by identifying an appropriate handler in the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structure. For audio compression, specify the compressed data format.
 * @param {Pointer<Guid>} pclsidHandler Pointer to a class identifier used to create the stream.
 * @returns {IAVIStream} Pointer to a buffer that receives the compressed stream pointer.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avimakecompressedstream
 * @since windows5.0
 */
export AVIMakeCompressedStream(ppsSource, lpOptions, pclsidHandler) {
    result := DllCall("AVIFIL32.dll\AVIMakeCompressedStream", "ptr*", &ppsCompressed := 0, "ptr", ppsSource, AVICOMPRESSOPTIONS.Ptr, lpOptions, Guid.Ptr, pclsidHandler, "HRESULT")
    return IAVIStream(ppsCompressed)
}

/**
 * The AVISave function builds a file by combining data streams from other files or from memory. (ANSI)
 * @remarks
 * This function creates a file, copies stream data into the file, closes the file, and releases the resources used by the new file. The last two parameters of this function identify a stream to save in the file and define the compression options of that stream. When saving more than one stream in an AVI file, repeat these two stream-specific parameters for each stream in the file.
 * 
 * A callback function (referenced by using <i>lpfnCallback</i>) can display status information and let the user cancel the save operation. The callback function uses the following format:
 * 
 * 
 * ```cpp
 * 
 * LONG PASCAL SaveCallback(int nPercent)  
 * 
 * ```
 * 
 * 
 * The <i>nPercent</i> parameter specifies the percentage of the file saved.
 * 
 * The callback function should return AVIERR_OK if the operation should continue and AVIERR_USERABORT if the user wishes to abort the save operation.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVISave as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} szFile Null-terminated string containing the name of the file to save.
 * @param {Pointer<Guid>} pclsidHandler Pointer to the file handler used to write the file. The file is created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a> function using this handler. If a handler is not specified, a default is selected from the registry based on the file extension.
 * @param {Pointer<AVISAVECALLBACK>} lpfnCallback Pointer to a callback function for the save operation.
 * @param {Integer} nStreams Number of streams saved in the file.
 * @param {IAVIStream} pfile Pointer to an AVI stream. This parameter is paired with <i>lpOptions</i>. The parameter pair can be repeated as a variable number of arguments.
 * @param {Pointer<AVICOMPRESSOPTIONS>} lpOptions Pointer to an application-defined <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structure containing the compression options for the stream referenced by <i>pavi</i>. This parameter is paired with pavi. The parameter pair can be repeated as a variable number of arguments.
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avisavea
 * @since windows5.0
 */
export AVISaveA(szFile, pclsidHandler, lpfnCallback, nStreams, pfile, lpOptions, args*) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    varArgs := [args*]
    varArgs.Push("HRESULT")

    result := DllCall("AVIFIL32.dll\AVISaveA", "ptr", szFile, Guid.Ptr, pclsidHandler, "ptr", lpfnCallback, "int", nStreams, "ptr", pfile, AVICOMPRESSOPTIONS.Ptr, lpOptions, varArgs*)
    return result
}

/**
 * The AVISaveV function builds a file by combining data streams from other files or from memory. (ANSI)
 * @remarks
 * This function is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avisavea">AVISave</a> function except the streams are passed in an array instead of as a variable number of arguments.
 * 
 * This function creates a file, copies stream data into the file, closes the file, and releases the resources used by the new file. The last two parameters of this function are arrays that identify the streams to save in the file and define the compression options of those streams.
 * 
 * An application must allocate memory for the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures and the array of pointers to these structures.
 * 
 * The argument <i>ppavi</i> contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVISaveV as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} szFile Null-terminated string containing the name of the file to save.
 * @param {Pointer<Guid>} pclsidHandler Pointer to the file handler used to write the file. The file is created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a> function using this handler. If a handler is not specified, a default is selected from the registry based on the file extension.
 * @param {Pointer<AVISAVECALLBACK>} lpfnCallback Pointer to a callback function used to display status information and to let the user cancel the save operation.
 * @param {Integer} nStreams Number of streams to save.
 * @param {Pointer<IAVIStream>} ppavi Pointer to an array of pointers to the <b>AVISTREAM</b> function structures. The array uses one pointer for each stream.
 * @param {Pointer<Pointer<AVICOMPRESSOPTIONS>>} plpOptions Pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures. The array uses one pointer for each stream.
 * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avisaveva
 * @since windows5.0
 */
export AVISaveVA(szFile, pclsidHandler, lpfnCallback, nStreams, ppavi, plpOptions) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    plpOptionsMarshal := plpOptions is VarRef ? "ptr*" : "ptr"

    result := DllCall("AVIFIL32.dll\AVISaveVA", "ptr", szFile, Guid.Ptr, pclsidHandler, "ptr", lpfnCallback, "int", nStreams, IAVIStream.Ptr, ppavi, plpOptionsMarshal, plpOptions, "HRESULT")
    return result
}

/**
 * The AVISave function builds a file by combining data streams from other files or from memory. (Unicode)
 * @remarks
 * This function creates a file, copies stream data into the file, closes the file, and releases the resources used by the new file. The last two parameters of this function identify a stream to save in the file and define the compression options of that stream. When saving more than one stream in an AVI file, repeat these two stream-specific parameters for each stream in the file.
 * 
 * A callback function (referenced by using <i>lpfnCallback</i>) can display status information and let the user cancel the save operation. The callback function uses the following format:
 * 
 * 
 * ```cpp
 * 
 * LONG PASCAL SaveCallback(int nPercent)  
 * 
 * ```
 * 
 * 
 * The <i>nPercent</i> parameter specifies the percentage of the file saved.
 * 
 * The callback function should return AVIERR_OK if the operation should continue and AVIERR_USERABORT if the user wishes to abort the save operation.
 * 
 * The argument <i>pavi</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVISave as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} szFile Null-terminated string containing the name of the file to save.
 * @param {Pointer<Guid>} pclsidHandler Pointer to the file handler used to write the file. The file is created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a> function using this handler. If a handler is not specified, a default is selected from the registry based on the file extension.
 * @param {Pointer<AVISAVECALLBACK>} lpfnCallback Pointer to a callback function for the save operation.
 * @param {Integer} nStreams Number of streams saved in the file.
 * @param {IAVIStream} pfile Pointer to an AVI stream. This parameter is paired with <i>lpOptions</i>. The parameter pair can be repeated as a variable number of arguments.
 * @param {Pointer<AVICOMPRESSOPTIONS>} lpOptions Pointer to an application-defined <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structure containing the compression options for the stream referenced by <i>pavi</i>. This parameter is paired with pavi. The parameter pair can be repeated as a variable number of arguments.
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avisavew
 * @since windows5.0
 */
export AVISaveW(szFile, pclsidHandler, lpfnCallback, nStreams, pfile, lpOptions, args*) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    varArgs := [args*]
    varArgs.Push("HRESULT")

    result := DllCall("AVIFIL32.dll\AVISaveW", "ptr", szFile, Guid.Ptr, pclsidHandler, "ptr", lpfnCallback, "int", nStreams, "ptr", pfile, AVICOMPRESSOPTIONS.Ptr, lpOptions, varArgs*)
    return result
}

/**
 * The AVISaveV function builds a file by combining data streams from other files or from memory. (Unicode)
 * @remarks
 * This function is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avisavea">AVISave</a> function except the streams are passed in an array instead of as a variable number of arguments.
 * 
 * This function creates a file, copies stream data into the file, closes the file, and releases the resources used by the new file. The last two parameters of this function are arrays that identify the streams to save in the file and define the compression options of those streams.
 * 
 * An application must allocate memory for the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures and the array of pointers to these structures.
 * 
 * The argument <i>ppavi</i> contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVISaveV as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} szFile Null-terminated string containing the name of the file to save.
 * @param {Pointer<Guid>} pclsidHandler Pointer to the file handler used to write the file. The file is created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a> function using this handler. If a handler is not specified, a default is selected from the registry based on the file extension.
 * @param {Pointer<AVISAVECALLBACK>} lpfnCallback Pointer to a callback function used to display status information and to let the user cancel the save operation.
 * @param {Integer} nStreams Number of streams to save.
 * @param {Pointer<IAVIStream>} ppavi Pointer to an array of pointers to the <b>AVISTREAM</b> function structures. The array uses one pointer for each stream.
 * @param {Pointer<Pointer<AVICOMPRESSOPTIONS>>} plpOptions Pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures. The array uses one pointer for each stream.
 * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avisavevw
 * @since windows5.0
 */
export AVISaveVW(szFile, pclsidHandler, lpfnCallback, nStreams, ppavi, plpOptions) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    plpOptionsMarshal := plpOptions is VarRef ? "ptr*" : "ptr"

    result := DllCall("AVIFIL32.dll\AVISaveVW", "ptr", szFile, Guid.Ptr, pclsidHandler, "ptr", lpfnCallback, "int", nStreams, IAVIStream.Ptr, ppavi, plpOptionsMarshal, plpOptions, "HRESULT")
    return result
}

/**
 * The AVISaveOptions function retrieves the save options for a file and returns them in a buffer.
 * @remarks
 * This function presents a standard Compression Options dialog box using <i>hwnd</i> as the parent window handle. When the user is finished selecting the compression options for each stream, the options are returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structure in the array referenced by <i>plpOptions</i>. The calling application must pass the interface pointers for the streams in the array referenced by <i>ppavi</i>.
 * 
 * An application must allocate memory for the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures and the array of pointers to these structures.
 * 
 * The argument <i>ppavi</i> contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {HWND} _hwnd Handle to the parent window for the Compression Options dialog box.
 * @param {Integer} uiFlags Flags for displaying the Compression Options dialog box. The following flags are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>ICMF_CHOOSE_KEYFRAME</td>
 * <td>Displays a Key Frame Every dialog box for the video options. This is the same flag used in the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> function.</td>
 * </tr>
 * <tr>
 * <td>ICMF_CHOOSE_DATARATE</td>
 * <td>Displays a Data Rate dialog box for the video options. This is the same flag used in <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a>.</td>
 * </tr>
 * <tr>
 * <td>ICMF_CHOOSE_PREVIEW</td>
 * <td>Displays a Preview button for the video options. This button previews the compression by using a frame from the stream. This is the same flag used in <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a>.</td>
 * </tr>
 * </table>
 * @param {Integer} nStreams Number of streams that have their options set by the dialog box.
 * @param {Pointer<IAVIStream>} ppavi Pointer to an array of stream interface pointers. The <i>nStreams</i> parameter indicates the number of pointers in the array.
 * @param {Pointer<Pointer<AVICOMPRESSOPTIONS>>} plpOptions Pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures. These structures hold the compression options set by the dialog box. The <i>nStreams</i> parameter indicates the number of pointers in the array.
 * @returns {Pointer} Returns <b>TRUE</b> if the user pressed OK, <b>FALSE</b> for CANCEL, or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avisaveoptions
 * @since windows5.0
 */
export AVISaveOptions(_hwnd, uiFlags, nStreams, ppavi, plpOptions) {
    plpOptionsMarshal := plpOptions is VarRef ? "ptr*" : "ptr"

    result := DllCall("AVIFIL32.dll\AVISaveOptions", HWND, _hwnd, "uint", uiFlags, "int", nStreams, IAVIStream.Ptr, ppavi, plpOptionsMarshal, plpOptions, IntPtr)
    return result
}

/**
 * The AVISaveOptionsFree function frees the resources allocated by the AVISaveOptions function.
 * @param {Integer} nStreams Count of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures referenced in <i>plpOptions</i>.
 * @param {Pointer<Pointer<AVICOMPRESSOPTIONS>>} plpOptions Pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures. These structures hold the compression options set by the dialog box. The resources allocated by <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avisaveoptions">AVISaveOptions</a> for each of these structures will be freed.
 * @returns {HRESULT} Returns AVIERR_OK.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avisaveoptionsfree
 * @since windows5.0
 */
export AVISaveOptionsFree(nStreams, plpOptions) {
    plpOptionsMarshal := plpOptions is VarRef ? "ptr*" : "ptr"

    result := DllCall("AVIFIL32.dll\AVISaveOptionsFree", "int", nStreams, plpOptionsMarshal, plpOptions, "HRESULT")
    return result
}

/**
 * The AVIBuildFilter function builds a filter specification that is subsequently used by the GetOpenFileName or GetSaveFileName function. (Unicode)
 * @remarks
 * This function accesses the registry for all filter types that the AVIFile library can use to open, read, or write multimedia files. It does not search the hard disk for filter DLLs and formats.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVIBuildFilter as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszFilter Pointer to the buffer containing the filter string.
 * @param {Integer} cbFilter Size, in characters, of buffer pointed to by <i>lpszFilter</i>.
 * @param {BOOL} fSaving Flag that indicates whether the filter should include read or write formats. Specify <b>TRUE</b> to include write formats or <b>FALSE</b> to include read formats.
 * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>AVIERR_BUFFERTOOSMALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer size <i>cbFilter</i> was smaller than the generated filter specification.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>AVIERR_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There was not enough memory to complete the read operation.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avibuildfilterw
 * @since windows5.0
 */
export AVIBuildFilterW(lpszFilter, cbFilter, fSaving) {
    lpszFilter := lpszFilter is String ? StrPtr(lpszFilter) : lpszFilter

    result := DllCall("AVIFIL32.dll\AVIBuildFilterW", "ptr", lpszFilter, "int", cbFilter, BOOL, fSaving, "HRESULT")
    return result
}

/**
 * The AVIBuildFilter function builds a filter specification that is subsequently used by the GetOpenFileName or GetSaveFileName function. (ANSI)
 * @remarks
 * This function accesses the registry for all filter types that the AVIFile library can use to open, read, or write multimedia files. It does not search the hard disk for filter DLLs and formats.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines AVIBuildFilter as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszFilter Pointer to the buffer containing the filter string.
 * @param {Integer} cbFilter Size, in characters, of buffer pointed to by <i>lpszFilter</i>.
 * @param {BOOL} fSaving Flag that indicates whether the filter should include read or write formats. Specify <b>TRUE</b> to include write formats or <b>FALSE</b> to include read formats.
 * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>AVIERR_BUFFERTOOSMALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer size <i>cbFilter</i> was smaller than the generated filter specification.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>AVIERR_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There was not enough memory to complete the read operation.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avibuildfiltera
 * @since windows5.0
 */
export AVIBuildFilterA(lpszFilter, cbFilter, fSaving) {
    lpszFilter := lpszFilter is String ? StrPtr(lpszFilter) : lpszFilter

    result := DllCall("AVIFIL32.dll\AVIBuildFilterA", "ptr", lpszFilter, "int", cbFilter, BOOL, fSaving, "HRESULT")
    return result
}

/**
 * The AVIMakeFileFromStreams function constructs an AVIFile interface pointer from separate streams.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifilerelease">AVIFileRelease</a> function to close the file.
 * 
 * Other functions can use the AVIFile interface created by this function to copy and edit the streams associated with the interface. For example, you can retrieve a specific stream by using <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifilegetstream">AVIFileGetStream</a> with the file interface pointer.
 * 
 * The argument <i>pfile</i> is the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface. The argument <i>papStreams</i> is the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {Integer} nStreams Count of the number of streams in the array of stream interface pointers referenced by papStreams.
 * @param {Pointer<IAVIStream>} papStreams Pointer to an array of stream interface pointers.
 * @returns {IAVIFile} Pointer to a buffer that receives the new file interface pointer.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avimakefilefromstreams
 * @since windows5.0
 */
export AVIMakeFileFromStreams(nStreams, papStreams) {
    result := DllCall("AVIFIL32.dll\AVIMakeFileFromStreams", "ptr*", &ppfile := 0, "int", nStreams, IAVIStream.Ptr, papStreams, "HRESULT")
    return IAVIFile(ppfile)
}

/**
 * The AVIMakeStreamFromClipboard function creates an editable stream from stream data on the clipboard.
 * @remarks
 * When an application finishes using the editable stream, it must release the stream to free the resources associated with it.
 * 
 * The argument ppstream is the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
 * @param {Integer} cfFormat Clipboard flag.
 * @param {HANDLE} _hGlobal Handle to stream data on the clipboard.
 * @returns {IAVIStream} Handle to the created stream.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avimakestreamfromclipboard
 * @since windows5.0
 */
export AVIMakeStreamFromClipboard(cfFormat, _hGlobal) {
    result := DllCall("AVIFIL32.dll\AVIMakeStreamFromClipboard", "uint", cfFormat, HANDLE, _hGlobal, "ptr*", &ppstream := 0, "HRESULT")
    return IAVIStream(ppstream)
}

/**
 * The AVIPutFileOnClipboard function copies an AVI file to the clipboard.
 * @remarks
 * This function also copies data with the CF_DIB, CF_PALETTE, and CF_WAVE clipboard flags onto the clipboard using the first frame of the first video stream of the file as a DIB and using the audio stream as CF_WAVE.
 * 
 * The argument pf is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface.
 * @param {IAVIFile} pf Handle to an open AVI file.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-aviputfileonclipboard
 * @since windows5.0
 */
export AVIPutFileOnClipboard(pf) {
    result := DllCall("AVIFIL32.dll\AVIPutFileOnClipboard", "ptr", pf, "HRESULT")
    return result
}

/**
 * The AVIGetFromClipboard function copies an AVI file from the clipboard.
 * @remarks
 * If the clipboard does not contain an AVI file, <b>AVIGetFromClipboard</b> also can copy data with the CF_DIB or CF_WAVE clipboard flags to an AVI file. In this case, the function creates an AVI file with one DIB stream and one waveform-audio stream, and fills each stream with the data from the clipboard.
 * 
 * The argument <i>lppf</i> is the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface.
 * @returns {IAVIFile} Pointer to the location used to return the handle created for the AVI file.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-avigetfromclipboard
 * @since windows5.0
 */
export AVIGetFromClipboard() {
    result := DllCall("AVIFIL32.dll\AVIGetFromClipboard", "ptr*", &lppf := 0, "HRESULT")
    return IAVIFile(lppf)
}

/**
 * The AVIClearClipboard function removes an AVI file from the clipboard.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-aviclearclipboard
 * @since windows5.0
 */
export AVIClearClipboard() {
    result := DllCall("AVIFIL32.dll\AVIClearClipboard", "HRESULT")
    return result
}

/**
 * The CreateEditableStream function creates an editable stream. Use this function before using other stream editing functions.
 * @remarks
 * The stream pointer returned in <i>ppsEditable</i> must be used as the source stream in the other stream editing functions.
 * 
 * Internally, this function creates tables to keep track of changes to a stream. The original stream is never changed by the stream editing functions. The stream pointer created by this function can be used in any AVIFile function that accepts stream pointers. You can use this function on the same stream multiple times. A copy of a stream is not affected by changes in another copy.
 * @param {IAVIStream} psSource Handle to the stream supplying data for the new stream. Specify <b>NULL</b> to create an empty editable string that you can copy and paste data into.
 * @returns {IAVIStream} Pointer to a buffer that receives the new stream handle.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-createeditablestream
 * @since windows5.0
 */
export CreateEditableStream(psSource) {
    result := DllCall("AVIFIL32.dll\CreateEditableStream", "ptr*", &ppsEditable := 0, "ptr", psSource, "HRESULT")
    return IAVIStream(ppsEditable)
}

/**
 * The EditStreamCut function deletes all or part of an editable stream and creates a temporary editable stream from the deleted portion of the stream.
 * @remarks
 * The stream being edited must have been created by the <b>CreateEditableStream</b> function or one of the stream editing functions.
 * 
 * The temporary stream is an editable stream and can be treated as any other AVI stream. An application must release the temporary stream to free the resources associated with it.
 * @param {IAVIStream} pavi Handle to the stream being edited.
 * @param {Pointer<Integer>} plStart Starting position of the data to cut from the stream referenced by <i>pavi</i>.
 * @param {Pointer<Integer>} plLength Amount of data to cut from the stream referenced by <i>pavi</i>.
 * @returns {IAVIStream} Pointer to the handle created for the new stream.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-editstreamcut
 * @since windows5.0
 */
export EditStreamCut(pavi, plStart, plLength) {
    plStartMarshal := plStart is VarRef ? "int*" : "ptr"
    plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

    result := DllCall("AVIFIL32.dll\EditStreamCut", "ptr", pavi, plStartMarshal, plStart, plLengthMarshal, plLength, "ptr*", &ppResult := 0, "HRESULT")
    return IAVIStream(ppResult)
}

/**
 * The EditStreamCopy function copies an editable stream (or a portion of it) into a temporary stream.
 * @remarks
 * The stream that is copied must be created by the <b>CreateEditableStream</b> function or one of the stream editing functions.
 * 
 * The temporary stream can be treated as any other AVI stream.
 * @param {IAVIStream} pavi Handle to the stream being copied.
 * @param {Pointer<Integer>} plStart Starting position within the stream being copied. The starting position is returned.
 * @param {Pointer<Integer>} plLength Amount of data to copy from the stream referenced by <i>pavi</i>. The length of the copied data is returned.
 * @returns {IAVIStream} Pointer to a buffer that receives the handle created for the new stream.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-editstreamcopy
 * @since windows5.0
 */
export EditStreamCopy(pavi, plStart, plLength) {
    plStartMarshal := plStart is VarRef ? "int*" : "ptr"
    plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

    result := DllCall("AVIFIL32.dll\EditStreamCopy", "ptr", pavi, plStartMarshal, plStart, plLengthMarshal, plLength, "ptr*", &ppResult := 0, "HRESULT")
    return IAVIStream(ppResult)
}

/**
 * The EditStreamPaste function copies a stream (or a portion of it) from one stream and pastes it within another stream at a specified location.
 * @remarks
 * The stream referenced by <i>pavi</i> must have been created by the <b>CreateEditableStream</b> function or one of the stream editing functions.
 * 
 * This function inserts data into the specified stream as a continuous block of data. It opens the specified data stream at the insertion point, pastes the specified stream segment at the insertion point, and appends the stream segment that trails the insertion point to the end of pasted segment.
 * @param {IAVIStream} pavi Handle to an editable stream that will receive the copied stream data.
 * @param {Pointer<Integer>} plPos Starting position to paste the data within the destination stream (referenced by <i>pavi</i>).
 * @param {Pointer<Integer>} plLength Pointer to a buffer that receives the amount of data pasted in the stream.
 * @param {IAVIStream} pstream Handle to a stream supplying the data to paste. This stream does not need to be an editable stream.
 * @param {Integer} lStart Starting position of the data to copy within the source stream.
 * @param {Integer} lEnd Amount of data to copy from the source stream. If <i>lLength</i> is -1, the entire stream referenced by <i>pstream</i> is pasted in the other stream.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-editstreampaste
 * @since windows5.0
 */
export EditStreamPaste(pavi, plPos, plLength, pstream, lStart, lEnd) {
    plPosMarshal := plPos is VarRef ? "int*" : "ptr"
    plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

    result := DllCall("AVIFIL32.dll\EditStreamPaste", "ptr", pavi, plPosMarshal, plPos, plLengthMarshal, plLength, "ptr", pstream, "int", lStart, "int", lEnd, "HRESULT")
    return result
}

/**
 * The EditStreamClone function creates a duplicate editable stream.
 * @remarks
 * The editable stream that is being cloned must have been created by the <b>CreateEditableStream</b> function or one of the stream editing functions.
 * 
 * The new stream can be treated as any other AVI stream.
 * @param {IAVIStream} pavi Handle to an editable stream that will be copied.
 * @returns {IAVIStream} Pointer to a buffer that receives the new stream handle.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-editstreamclone
 * @since windows5.0
 */
export EditStreamClone(pavi) {
    result := DllCall("AVIFIL32.dll\EditStreamClone", "ptr", pavi, "ptr*", &ppResult := 0, "HRESULT")
    return IAVIStream(ppResult)
}

/**
 * The EditStreamSetName function assigns a descriptive string to a stream. (ANSI)
 * @remarks
 * This function updates the <b>szName</b> member of the <b>AVISTREAMINFO</b> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines EditStreamSetName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {PSTR} lpszName Null-terminated string containing the description of the stream.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-editstreamsetnamea
 * @since windows5.0
 */
export EditStreamSetNameA(pavi, lpszName) {
    lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

    result := DllCall("AVIFIL32.dll\EditStreamSetNameA", "ptr", pavi, "ptr", lpszName, "HRESULT")
    return result
}

/**
 * The EditStreamSetName function assigns a descriptive string to a stream. (Unicode)
 * @remarks
 * This function updates the <b>szName</b> member of the <b>AVISTREAMINFO</b> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines EditStreamSetName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {PWSTR} lpszName Null-terminated string containing the description of the stream.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-editstreamsetnamew
 * @since windows5.0
 */
export EditStreamSetNameW(pavi, lpszName) {
    lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

    result := DllCall("AVIFIL32.dll\EditStreamSetNameW", "ptr", pavi, "ptr", lpszName, "HRESULT")
    return result
}

/**
 * The EditStreamSetInfo function changes characteristics of an editable stream. (Unicode)
 * @remarks
 * You must supply information for the entire <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure, including the members you will not use. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avistreaminfoa">AVIStreamInfo</a> function to initialize the structure and then update selected members with your data.
 * 
 * This function does not change the following members:
 * 
 * <ul>
 * <li><b>dwCaps</b></li>
 * <li><b>dwEditCount</b></li>
 * <li><b>dwFlags</b></li>
 * <li><b>dwInitialFrames</b></li>
 * <li><b>dwLength</b></li>
 * <li><b>dwSampleSize</b></li>
 * <li><b>dwSuggestedBufferSize</b></li>
 * <li><b>fccHandler</b></li>
 * <li><b>fccType</b></li>
 * </ul>
 * The function changes the following members:
 * 
 * <ul>
 * <li><b>dwRate</b></li>
 * <li><b>dwQuality</b></li>
 * <li><b>dwScale</b></li>
 * <li><b>dwStart</b></li>
 * <li><b>rcFrame</b></li>
 * <li><b>szName</b></li>
 * <li><b>wLanguage</b></li>
 * <li><b>wPriority</b></li>
 * </ul>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines EditStreamSetInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} lpInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure containing new information.
 * @param {Integer} cbInfo Size, in bytes, of the structure pointed to by <i>lpInfo</i>.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-editstreamsetinfow
 * @since windows5.0
 */
export EditStreamSetInfoW(pavi, lpInfo, cbInfo) {
    result := DllCall("AVIFIL32.dll\EditStreamSetInfoW", "ptr", pavi, "ptr", lpInfo, "int", cbInfo, "HRESULT")
    return result
}

/**
 * The EditStreamSetInfo function changes characteristics of an editable stream. (ANSI)
 * @remarks
 * You must supply information for the entire <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure, including the members you will not use. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avistreaminfoa">AVIStreamInfo</a> function to initialize the structure and then update selected members with your data.
 * 
 * This function does not change the following members:
 * 
 * <ul>
 * <li><b>dwCaps</b></li>
 * <li><b>dwEditCount</b></li>
 * <li><b>dwFlags</b></li>
 * <li><b>dwInitialFrames</b></li>
 * <li><b>dwLength</b></li>
 * <li><b>dwSampleSize</b></li>
 * <li><b>dwSuggestedBufferSize</b></li>
 * <li><b>fccHandler</b></li>
 * <li><b>fccType</b></li>
 * </ul>
 * The function changes the following members:
 * 
 * <ul>
 * <li><b>dwRate</b></li>
 * <li><b>dwQuality</b></li>
 * <li><b>dwScale</b></li>
 * <li><b>dwStart</b></li>
 * <li><b>rcFrame</b></li>
 * <li><b>szName</b></li>
 * <li><b>wLanguage</b></li>
 * <li><b>wPriority</b></li>
 * </ul>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines EditStreamSetInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {IAVIStream} pavi Handle to an open stream.
 * @param {Integer} lpInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure containing new information.
 * @param {Integer} cbInfo Size, in bytes, of the structure pointed to by <i>lpInfo</i>.
 * @returns {HRESULT} Returns zero if successful or an error otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-editstreamsetinfoa
 * @since windows5.0
 */
export EditStreamSetInfoA(pavi, lpInfo, cbInfo) {
    result := DllCall("AVIFIL32.dll\EditStreamSetInfoA", "ptr", pavi, "ptr", lpInfo, "int", cbInfo, "HRESULT")
    return result
}

/**
 * The MCIWndCreate function registers the MCIWnd window class and creates an MCIWnd window for using MCI services. MCIWndCreate can also open an MCI device or file (such as an AVI file) and associate it with the MCIWnd window. (ANSI)
 * @remarks
 * Default window styles for a child window are WS_CHILD, WS_BORDER, and WS_VISIBLE. <b>MCIWndCreate</b> assumes a child window when a non-<b>NULL</b> handle of a parent window is specified.
 * 
 * Default window styles for a parent window are WS_OVERLAPPEDWINDOW and WS_VISIBLE. <b>MCIWndCreate</b> assumes a parent window when a <b>NULL</b> handle of a parent window is specified.
 * 
 * Use the window handle returned by this function for the window handle in the MCIWnd macros. If your application uses this function, it does not need to use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mciwndregisterclass">MCIWndRegisterClass</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines MCIWndCreate as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {HINSTANCE} _hInstance Handle to the module instance to associate with the MCIWnd window.
 * @param {Integer} dwStyle Flags defining the window style. In addition to specifying the window styles used with the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function, you can specify the following styles to use with MCIWnd windows.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOAUTOSIZEWINDOW</td>
 * <td>Will not change the dimensions of an MCIWnd window when the image size changes.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOAUTOSIZEMOVIE</td>
 * <td>Will not change the dimensions of the destination rectangle when an MCIWnd window size changes.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOERRORDLG</td>
 * <td>Inhibits display of MCI errors to users.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOMENU</td>
 * <td>Hides the Menu button from view on the toolbar and prohibits users from accessing its pop-up menu.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOOPEN</td>
 * <td>Hides the open and close commands from the MCIWnd menu and prohibits users from accessing these choices in the pop-up menu.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOPLAYBAR</td>
 * <td>Hides the toolbar from view and prohibits users from accessing it.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYANSI</td>
 * <td>Causes MCIWnd to use an ANSI string instead of a Unicode string when notifying the parent window of device mode changes. This flag is used in combination with MCIWNDF_NOTIFYMODE.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYMODE</td>
 * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifymode">MCIWNDM_NOTIFYMODE</a> message whenever the device changes operating modes. The <i>lParam</i> parameter of this message identifies the new mode, such as MCI_MODE_STOP.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYPOS</td>
 * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifypos">MCIWNDM_NOTIFYPOS</a> message whenever a change in the playback or record position within the content occurs. The <i>lParam</i> parameter of this message contains the new position in the content.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYMEDIA</td>
 * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifymedia">MCIWNDM_NOTIFYMEDIA</a> message whenever a new device is used or a data file is opened or closed. The <i>lParam</i> parameter of this message contains a pointer to the new file name.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYSIZE</td>
 * <td>Causes MCIWnd to notify the parent window when the MCIWnd window size changes.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYERROR</td>
 * <td>Causes MCIWnd to notify the parent window when an MCI error occurs.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYALL</td>
 * <td>Causes all MCIWNDF window notification styles to be used.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_RECORD</td>
 * <td>Adds a Record button to the toolbar and adds a new file command to the menu if the MCI device has recording capability.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_SHOWALL</td>
 * <td>Causes all MCIWNDF_SHOW styles to be used.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_SHOWMODE</td>
 * <td>Displays the current mode of the MCI device in the window title bar. For a list of device modes, see the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mciwndgetmode">MCIWndGetMode</a> macro.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_SHOWNAME</td>
 * <td>Displays the name of the open MCI device or data file in the MCIWnd window title bar.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_SHOWPOS</td>
 * <td>Displays the current position within the content of the MCI device in the window title bar.</td>
 * </tr>
 * </table>
 * @param {PSTR} szFile Null-terminated string indicating the name of an MCI device or data file to open.
 * @returns {HWND} Returns the handle to an MCI window if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-mciwndcreatea
 * @since windows5.0
 */
export MCIWndCreateA(hwndParent, _hInstance, dwStyle, szFile) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    result := DllCall("MSVFW32.dll\MCIWndCreateA", HWND, hwndParent, HINSTANCE, _hInstance, "uint", dwStyle, "ptr", szFile, HWND)
    return result
}

/**
 * The MCIWndCreate function registers the MCIWnd window class and creates an MCIWnd window for using MCI services. MCIWndCreate can also open an MCI device or file (such as an AVI file) and associate it with the MCIWnd window. (Unicode)
 * @remarks
 * Default window styles for a child window are WS_CHILD, WS_BORDER, and WS_VISIBLE. <b>MCIWndCreate</b> assumes a child window when a non-<b>NULL</b> handle of a parent window is specified.
 * 
 * Default window styles for a parent window are WS_OVERLAPPEDWINDOW and WS_VISIBLE. <b>MCIWndCreate</b> assumes a parent window when a <b>NULL</b> handle of a parent window is specified.
 * 
 * Use the window handle returned by this function for the window handle in the MCIWnd macros. If your application uses this function, it does not need to use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mciwndregisterclass">MCIWndRegisterClass</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines MCIWndCreate as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {HINSTANCE} _hInstance Handle to the module instance to associate with the MCIWnd window.
 * @param {Integer} dwStyle Flags defining the window style. In addition to specifying the window styles used with the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function, you can specify the following styles to use with MCIWnd windows.
 * 
 * <table>
 * <tr>
 * <th>Value
 * </th>
 * <th>Meaning
 * </th>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOAUTOSIZEWINDOW</td>
 * <td>Will not change the dimensions of an MCIWnd window when the image size changes.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOAUTOSIZEMOVIE</td>
 * <td>Will not change the dimensions of the destination rectangle when an MCIWnd window size changes.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOERRORDLG</td>
 * <td>Inhibits display of MCI errors to users.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOMENU</td>
 * <td>Hides the Menu button from view on the toolbar and prohibits users from accessing its pop-up menu.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOOPEN</td>
 * <td>Hides the open and close commands from the MCIWnd menu and prohibits users from accessing these choices in the pop-up menu.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOPLAYBAR</td>
 * <td>Hides the toolbar from view and prohibits users from accessing it.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYANSI</td>
 * <td>Causes MCIWnd to use an ANSI string instead of a Unicode string when notifying the parent window of device mode changes. This flag is used in combination with MCIWNDF_NOTIFYMODE.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYMODE</td>
 * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifymode">MCIWNDM_NOTIFYMODE</a> message whenever the device changes operating modes. The <i>lParam</i> parameter of this message identifies the new mode, such as MCI_MODE_STOP.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYPOS</td>
 * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifypos">MCIWNDM_NOTIFYPOS</a> message whenever a change in the playback or record position within the content occurs. The <i>lParam</i> parameter of this message contains the new position in the content.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYMEDIA</td>
 * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifymedia">MCIWNDM_NOTIFYMEDIA</a> message whenever a new device is used or a data file is opened or closed. The <i>lParam</i> parameter of this message contains a pointer to the new file name.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYSIZE</td>
 * <td>Causes MCIWnd to notify the parent window when the MCIWnd window size changes.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYERROR</td>
 * <td>Causes MCIWnd to notify the parent window when an MCI error occurs.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_NOTIFYALL</td>
 * <td>Causes all MCIWNDF window notification styles to be used.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_RECORD</td>
 * <td>Adds a Record button to the toolbar and adds a new file command to the menu if the MCI device has recording capability.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_SHOWALL</td>
 * <td>Causes all MCIWNDF_SHOW styles to be used.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_SHOWMODE</td>
 * <td>Displays the current mode of the MCI device in the window title bar. For a list of device modes, see the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mciwndgetmode">MCIWndGetMode</a> macro.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_SHOWNAME</td>
 * <td>Displays the name of the open MCI device or data file in the MCIWnd window title bar.</td>
 * </tr>
 * <tr>
 * <td>MCIWNDF_SHOWPOS</td>
 * <td>Displays the current position within the content of the MCI device in the window title bar.</td>
 * </tr>
 * </table>
 * @param {PWSTR} szFile Null-terminated string indicating the name of an MCI device or data file to open.
 * @returns {HWND} Returns the handle to an MCI window if successful or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-mciwndcreatew
 * @since windows5.0
 */
export MCIWndCreateW(hwndParent, _hInstance, dwStyle, szFile) {
    szFile := szFile is String ? StrPtr(szFile) : szFile

    result := DllCall("MSVFW32.dll\MCIWndCreateW", HWND, hwndParent, HINSTANCE, _hInstance, "uint", dwStyle, "ptr", szFile, HWND)
    return result
}

/**
 * The MCIWndRegisterClass function registers the MCI window class MCIWND_WINDOW_CLASS.
 * @remarks
 * After registering the MCI window class, use the <b>CreateWindow</b> or <b>CreateWindowEx</b> functions to create an MCIWnd window. If your application uses this function, it does not need to use the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mciwndcreatea">MCIWndCreate</a> function.
 * @returns {BOOL} Returns zero if successful.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-mciwndregisterclass
 * @since windows5.0
 */
export MCIWndRegisterClass() {
    result := DllCall("MSVFW32.dll\MCIWndRegisterClass", BOOL)
    return result
}

/**
 * The capCreateCaptureWindow function creates a capture window. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines capCreateCaptureWindow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszWindowName Null-terminated string containing the name used for the capture window.
 * @param {Integer} dwStyle Window styles used for the capture window. Window styles are described with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function.
 * @param {Integer} x The x-coordinate of the upper left corner of the capture window.
 * @param {Integer} y The y-coordinate of the upper left corner of the capture window.
 * @param {Integer} nWidth Width of the capture window.
 * @param {Integer} nHeight Height of the capture window.
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {Integer} nID Window identifier.
 * @returns {HWND} Returns a handle of the capture window if successful or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-capcreatecapturewindowa
 * @since windows5.0
 */
export capCreateCaptureWindowA(lpszWindowName, dwStyle, x, y, nWidth, nHeight, hwndParent, nID) {
    lpszWindowName := lpszWindowName is String ? StrPtr(lpszWindowName) : lpszWindowName

    result := DllCall("AVICAP32.dll\capCreateCaptureWindowA", "ptr", lpszWindowName, "uint", dwStyle, "int", x, "int", y, "int", nWidth, "int", nHeight, HWND, hwndParent, "int", nID, HWND)
    return result
}

/**
 * The capGetDriverDescription function retrieves the version description of the capture driver. (ANSI)
 * @remarks
 * If the information description is longer than its buffer, the description is truncated. The returned string is always null-terminated. If a buffer size is zero, its corresponding description is not copied.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines capGetDriverDescription as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} wDriverIndex Index of the capture driver. The index can range from 0 through 9.
 * 
 * Plug-and-Play capture drivers are enumerated first, followed by capture drivers listed in the registry, which are then followed by capture drivers listed in SYSTEM.INI.
 * @param {PSTR} lpszName Pointer to a buffer containing a null-terminated string corresponding to the capture driver name.
 * @param {Integer} cbName Length, in bytes, of the buffer pointed to by <i>lpszName</i>.
 * @param {PSTR} lpszVer Pointer to a buffer containing a null-terminated string corresponding to the description of the capture driver.
 * @param {Integer} cbVer Length, in bytes, of the buffer pointed to by <i>lpszVer</i>.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-capgetdriverdescriptiona
 * @since windows5.0
 */
export capGetDriverDescriptionA(wDriverIndex, lpszName, cbName, lpszVer, cbVer) {
    lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
    lpszVer := lpszVer is String ? StrPtr(lpszVer) : lpszVer

    result := DllCall("AVICAP32.dll\capGetDriverDescriptionA", "uint", wDriverIndex, "ptr", lpszName, "int", cbName, "ptr", lpszVer, "int", cbVer, BOOL)
    return result
}

/**
 * The capCreateCaptureWindow function creates a capture window. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines capCreateCaptureWindow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszWindowName Null-terminated string containing the name used for the capture window.
 * @param {Integer} dwStyle Window styles used for the capture window. Window styles are described with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function.
 * @param {Integer} x The x-coordinate of the upper left corner of the capture window.
 * @param {Integer} y The y-coordinate of the upper left corner of the capture window.
 * @param {Integer} nWidth Width of the capture window.
 * @param {Integer} nHeight Height of the capture window.
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {Integer} nID Window identifier.
 * @returns {HWND} Returns a handle of the capture window if successful or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-capcreatecapturewindoww
 * @since windows5.0
 */
export capCreateCaptureWindowW(lpszWindowName, dwStyle, x, y, nWidth, nHeight, hwndParent, nID) {
    lpszWindowName := lpszWindowName is String ? StrPtr(lpszWindowName) : lpszWindowName

    result := DllCall("AVICAP32.dll\capCreateCaptureWindowW", "ptr", lpszWindowName, "uint", dwStyle, "int", x, "int", y, "int", nWidth, "int", nHeight, HWND, hwndParent, "int", nID, HWND)
    return result
}

/**
 * The capGetDriverDescription function retrieves the version description of the capture driver. (Unicode)
 * @remarks
 * If the information description is longer than its buffer, the description is truncated. The returned string is always null-terminated. If a buffer size is zero, its corresponding description is not copied.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines capGetDriverDescription as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} wDriverIndex Index of the capture driver. The index can range from 0 through 9.
 * 
 * Plug-and-Play capture drivers are enumerated first, followed by capture drivers listed in the registry, which are then followed by capture drivers listed in SYSTEM.INI.
 * @param {PWSTR} lpszName Pointer to a buffer containing a null-terminated string corresponding to the capture driver name.
 * @param {Integer} cbName Length, in bytes, of the buffer pointed to by <i>lpszName</i>.
 * @param {PWSTR} lpszVer Pointer to a buffer containing a null-terminated string corresponding to the description of the capture driver.
 * @param {Integer} cbVer Length, in bytes, of the buffer pointed to by <i>lpszVer</i>.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-capgetdriverdescriptionw
 * @since windows5.0
 */
export capGetDriverDescriptionW(wDriverIndex, lpszName, cbName, lpszVer, cbVer) {
    lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
    lpszVer := lpszVer is String ? StrPtr(lpszVer) : lpszVer

    result := DllCall("AVICAP32.dll\capGetDriverDescriptionW", "uint", wDriverIndex, "ptr", lpszName, "int", cbName, "ptr", lpszVer, "int", cbVer, BOOL)
    return result
}

/**
 * The GetOpenFileNamePreview function selects a file by using the Open dialog box. The dialog box also allows the user to preview the currently specified AVI file. This function augments the capability found in the GetOpenFileName function. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines GetOpenFileNamePreview as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<OPENFILENAMEA>} lpofn Pointer to an <b>OPENFILENAME</b> structure used to initialize the dialog box. On return, the structure contains information about the user's file selection.
 * @returns {BOOL} Returns a handle to the selected file.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-getopenfilenamepreviewa
 * @since windows5.0
 */
export GetOpenFileNamePreviewA(lpofn) {
    result := DllCall("MSVFW32.dll\GetOpenFileNamePreviewA", OPENFILENAMEA.Ptr, lpofn, BOOL)
    return result
}

/**
 * The GetSaveFileNamePreview function selects a file by using the Save As dialog box. The dialog box also allows the user to preview the currently specified file. This function augments the capability found in the GetSaveFileName function. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines GetSaveFileNamePreview as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<OPENFILENAMEA>} lpofn Pointer to an <b>OPENFILENAME</b> structure used to initialize the dialog box. On return, the structure contains information about the user's file selection.
 * @returns {BOOL} Returns a handle to the selected file.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-getsavefilenamepreviewa
 * @since windows5.0
 */
export GetSaveFileNamePreviewA(lpofn) {
    result := DllCall("MSVFW32.dll\GetSaveFileNamePreviewA", OPENFILENAMEA.Ptr, lpofn, BOOL)
    return result
}

/**
 * The GetOpenFileNamePreview function selects a file by using the Open dialog box. The dialog box also allows the user to preview the currently specified AVI file. This function augments the capability found in the GetOpenFileName function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines GetOpenFileNamePreview as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<OPENFILENAMEW>} lpofn Pointer to an <b>OPENFILENAME</b> structure used to initialize the dialog box. On return, the structure contains information about the user's file selection.
 * @returns {BOOL} Returns a handle to the selected file.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-getopenfilenameprevieww
 * @since windows5.0
 */
export GetOpenFileNamePreviewW(lpofn) {
    result := DllCall("MSVFW32.dll\GetOpenFileNamePreviewW", OPENFILENAMEW.Ptr, lpofn, BOOL)
    return result
}

/**
 * The GetSaveFileNamePreview function selects a file by using the Save As dialog box. The dialog box also allows the user to preview the currently specified file. This function augments the capability found in the GetSaveFileName function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The vfw.h header defines GetSaveFileNamePreview as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<OPENFILENAMEW>} lpofn Pointer to an <b>OPENFILENAME</b> structure used to initialize the dialog box. On return, the structure contains information about the user's file selection.
 * @returns {BOOL} Returns a handle to the selected file.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-getsavefilenameprevieww
 * @since windows5.0
 */
export GetSaveFileNamePreviewW(lpofn) {
    result := DllCall("MSVFW32.dll\GetSaveFileNamePreviewW", OPENFILENAMEW.Ptr, lpofn, BOOL)
    return result
}

/**
 * The mmTaskCreate function is deprecated. Applications should not use this function.
 * @param {Pointer<LPTASKCALLBACK>} lpfn Reserved.
 * @param {Pointer<HANDLE>} lph Reserved.
 * @param {Pointer} dwInst Reserved.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/mmddk/nf-mmddk-mmtaskcreate
 */
export mmTaskCreate(lpfn, lph, dwInst) {
    result := DllCall("WINMM.dll\mmTaskCreate", "ptr", lpfn, HANDLE.Ptr, lph, "ptr", dwInst, UInt32)
    return result
}

/**
 * The mmTaskBlock function is deprecated. Applications should not use this function.
 * @param {Integer} h Reserved.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/mmddk/nf-mmddk-mmtaskblock
 */
export mmTaskBlock(h) {
    DllCall("WINMM.dll\mmTaskBlock", "uint", h)
}

/**
 * The mmTaskSignal function is deprecated. Applications should not use this function.
 * @param {Integer} h Reserved.
 * @returns {BOOL} 
 * @see https://learn.microsoft.com/windows/win32/api/mmddk/nf-mmddk-mmtasksignal
 */
export mmTaskSignal(h) {
    result := DllCall("WINMM.dll\mmTaskSignal", "uint", h, BOOL)
    return result
}

/**
 * The mmTaskYield function is deprecated. Applications should not use this function.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/mmddk/nf-mmddk-mmtaskyield
 */
export mmTaskYield() {
    DllCall("WINMM.dll\mmTaskYield")
}

/**
 * The mmGetCurrentTask function is deprecated. Applications should not use this function.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/mmddk/nf-mmddk-mmgetcurrenttask
 */
export mmGetCurrentTask() {
    result := DllCall("WINMM.dll\mmGetCurrentTask", UInt32)
    return result
}

;@endregion Functions
