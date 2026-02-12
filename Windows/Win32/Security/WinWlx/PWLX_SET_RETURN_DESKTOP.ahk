#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to specify the alternate application desktop that Winlogon will switch to when the current secure attention sequence (SAS) event processing function is complete.
 * @remarks
 * <b>WlxSetReturnDesktop</b> can be called only within 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxloggedonsas">WlxLoggedOnSAS</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxwkstalockedsas">WlxWkstaLockedSAS</a> routines. Attempts to call this function at other times will fail.
 * 
 * If a handle to the desktop is provided, Winlogon will duplicate the handle. If no handle is provided, Winlogon will attempt to open the desktop named in the <i>pDesktop</i> parameter. If the provided desktop is not valid or is the Winlogon or screen saver desktop, the call will fail.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_set_return_desktop
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_SET_RETURN_DESKTOP extends IUnknown {

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
     * @param {Pointer<WLX_DESKTOP>} pDesktop 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, pDesktop) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx

        result := ComCall(3, this, "ptr", hWlx, "ptr", pDesktop, "int")
        return result
    }
}
