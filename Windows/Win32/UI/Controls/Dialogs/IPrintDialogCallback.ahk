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
     * 
     * @returns {HRESULT} 
     */
    InitDone() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectionChange() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    HandleMessage(hDlg, uMsg, wParam, lParam, pResult) {
        hDlg := hDlg is Win32Handle ? NumGet(hDlg, "ptr") : hDlg

        result := ComCall(5, this, "ptr", hDlg, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
