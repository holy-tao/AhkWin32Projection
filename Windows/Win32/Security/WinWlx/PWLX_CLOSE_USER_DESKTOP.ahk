#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to close an alternate user desktop and clean up after the desktop is closed.
 * @remarks
 * In addition to closing the desktop, this function will modify access to the parent window station to remove <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ACEs</a> added during the creation of the user desktop.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_close_user_desktop
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_CLOSE_USER_DESKTOP extends IUnknown {

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
     * @param {HANDLE} hToken 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, pDesktop, hToken) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken

        result := ComCall(3, this, "ptr", hWlx, "ptr", pDesktop, "ptr", hToken, "int")
        return result
    }
}
