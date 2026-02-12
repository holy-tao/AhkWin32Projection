#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the prototype for the callback function used by the system folder view object. This function essentially duplicates the functionality of IShellFolderViewCB.
 * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nc-shlobj_core-lpfnviewcallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class LPFNVIEWCALLBACK extends IUnknown {

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
     * @param {IShellView} psvOuter 
     * @param {IShellFolder} psf 
     * @param {HWND} hwndMain 
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
    Invoke(psvOuter, psf, hwndMain, uMsg, wParam_, lParam_) {
        hwndMain := hwndMain is Win32Handle ? NumGet(hwndMain, "ptr") : hwndMain
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(3, this, "ptr", psvOuter, "ptr", psf, "ptr", hwndMain, "uint", uMsg, "ptr", wParam_, "ptr", lParam_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
