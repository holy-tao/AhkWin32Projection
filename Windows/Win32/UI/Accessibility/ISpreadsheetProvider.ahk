#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to items (cells) in a spreadsheet.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-ispreadsheetprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ISpreadsheetProvider extends IUnknown{
    /**
     * The interface identifier for ISpreadsheetProvider
     * @type {Guid}
     */
    static IID => Guid("{6f6b5d35-5525-4f80-b758-85473832ffc7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<IRawElementProviderSimple>} pRetVal 
     * @returns {HRESULT} 
     */
    GetItemByName(name, pRetVal) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
