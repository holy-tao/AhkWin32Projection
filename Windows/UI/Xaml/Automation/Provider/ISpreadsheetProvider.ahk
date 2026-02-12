#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to items (cells) in a spreadsheet.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.ispreadsheetprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ISpreadsheetProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpreadsheetProvider
     * @type {Guid}
     */
    static IID => Guid("{15359093-bd99-4cfd-9f07-3b14b315e23d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemByName"]

    /**
     * Exposes a UI Automation element that represents the spreadsheet cell that has the specified name.
     * @remarks
     * A spreadsheet cell typically has a name such as “c5” or “a15”.  A name can also apply to a range of cells.
     * @param {HSTRING} name Type: <b>LPCWSTR</b>
     * 
     * The name of the target cell.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-ispreadsheetprovider-getitembyname
     */
    GetItemByName(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(result_)
    }
}
