#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * LPFNDFMCALLBACK may be altered or unavailable.
 * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nc-shlobj_core-lpfndfmcallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class LPFNDFMCALLBACK extends IUnknown {

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
     * @param {IShellFolder} psf 
     * @param {HWND} hwnd_ 
     * @param {IDataObject} pdtobj 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(psf, hwnd_, pdtobj, uMsg, wParam_, lParam_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(3, this, "ptr", psf, "ptr", hwnd_, "ptr", pdtobj, "uint", uMsg, "ptr", wParam_, "ptr", lParam_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
