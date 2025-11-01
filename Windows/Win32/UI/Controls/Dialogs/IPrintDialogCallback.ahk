#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that enable an application to receive notifications and messages from the PrintDlgEx function while the Print Property Sheet is displayed.
 * @see https://docs.microsoft.com/windows/win32/api//commdlg/nn-commdlg-iprintdialogcallback
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class IPrintDialogCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintDialogCallback
     * @type {Guid}
     */
    static IID => Guid("{5852a2c3-6530-11d1-b6a3-0000f8757bf9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitDone", "SelectionChange", "HandleMessage"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-iprintdialogcallback-initdone
     */
    InitDone() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-iprintdialogcallback-selectionchange
     */
    SelectionChange() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hDlg 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<LRESULT>} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-iprintdialogcallback-handlemessage
     */
    HandleMessage(hDlg, uMsg, wParam, lParam, pResult) {
        hDlg := hDlg is Win32Handle ? NumGet(hDlg, "ptr") : hDlg

        result := ComCall(5, this, "ptr", hDlg, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr", pResult, "HRESULT")
        return result
    }
}
