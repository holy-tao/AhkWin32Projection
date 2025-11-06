#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
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
     * 
     * @param {Integer} direction 
     * @returns {IRawElementProviderSimple} 
     */
    Navigate(direction) {
        result := ComCall(3, this, "int", direction, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }
}
