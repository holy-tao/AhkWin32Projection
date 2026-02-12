#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets the next element in the specified direction within the logical UI tree.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.icustomnavigationprovider.navigatecustom
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ICustomNavigationProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomNavigationProvider
     * @type {Guid}
     */
    static IID => Guid("{2062a28a-8c07-4b94-8e12-7037c622aeb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Navigate"]

    /**
     * Gets the next element in the specified direction within the logical UI tree.
     * @param {Integer} direction_ The specified direction.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.icustomnavigationprovider.navigatecustom
     */
    Navigate(direction_) {
        result := ComCall(3, this, "int", direction_, "ptr*", &pRetVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(pRetVal)
    }
}
