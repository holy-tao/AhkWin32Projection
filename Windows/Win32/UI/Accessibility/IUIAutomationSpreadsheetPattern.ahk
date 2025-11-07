#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUIAutomationElement.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a client application to access the items (cells) in a spreadsheet.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationspreadsheetpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationSpreadsheetPattern extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemByName"]

    /**
     * 
     * @param {BSTR} name 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetpattern-getitembyname
     */
    GetItemByName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(3, this, "ptr", name, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }
}
