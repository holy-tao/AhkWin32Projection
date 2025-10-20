#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a client application to access the items (cells) in a spreadsheet.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationspreadsheetpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationSpreadsheetPattern extends IUnknown{
    /**
     * The interface identifier for IUIAutomationSpreadsheetPattern
     * @type {Guid}
     */
    static IID => Guid("{7517a7c8-faae-4de9-9f08-29b91e8595c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    GetItemByName(name, element) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(3, this, "ptr", name, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
