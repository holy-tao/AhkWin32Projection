#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to tell Winlogon to use the standard CTRL+ALT+DEL key combination as a secure attention sequence (SAS).
 * @remarks
 * If GINA uses this function, it is not required to use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_sas_notify">WlxSasNotify</a> function. However, if GINA is monitoring for other SASs in addition to CTRL+ALT+DEL, it must use <b>WlxSasNotify</b> to deliver the additional SAS event notifications.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_use_ctrl_alt_del
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_USE_CTRL_ALT_DEL extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hWlx 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx

        ComCall(3, this, "ptr", hWlx)
    }
}
