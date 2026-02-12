#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LRESULT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the prototype for the callback function used by RemoveWindowSubclass and SetWindowSubclass.
 * @see https://learn.microsoft.com/windows/win32/api//content/commctrl/nc-commctrl-subclassproc
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SUBCLASSPROC extends IUnknown {

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
     * @param {HWND} hWnd_ 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @param {Pointer} uIdSubclass 
     * @param {Pointer} dwRefData 
     * @returns {LRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWnd_, uMsg, wParam_, lParam_, uIdSubclass, dwRefData) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(3, this, "ptr", hWnd_, "uint", uMsg, "ptr", wParam_, "ptr", lParam_, "ptr", uIdSubclass, "ptr", dwRefData, "ptr")
        resultHandle := LRESULT({Value: result}, True)
        return resultHandle
    }
}
