#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Serves as the entry point for a Control Panel application. This is a library-defined callback function.
 * @remarks
 * Implementers of Control Panel items must also implement this function. No default implementation is available.
 * @see https://learn.microsoft.com/windows/win32/api//content/cpl/nc-cpl-applet_proc
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPLET_PROC extends IUnknown {

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
     * @param {HWND} hwndCpl 
     * @param {Integer} msg_ 
     * @param {LPARAM} lParam1 
     * @param {LPARAM} lParam2 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hwndCpl, msg_, lParam1, lParam2) {
        hwndCpl := hwndCpl is Win32Handle ? NumGet(hwndCpl, "ptr") : hwndCpl
        lParam1 := lParam1 is Win32Handle ? NumGet(lParam1, "ptr") : lParam1
        lParam2 := lParam2 is Win32Handle ? NumGet(lParam2, "ptr") : lParam2

        result := ComCall(3, this, "ptr", hwndCpl, "uint", msg_, "ptr", lParam1, "ptr", lParam2, "int")
        return result
    }
}
