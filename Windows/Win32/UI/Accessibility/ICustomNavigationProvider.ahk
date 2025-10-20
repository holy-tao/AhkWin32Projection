#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ICustomNavigationProvider extends IUnknown{
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
     * 
     * @param {Integer} direction 
     * @param {Pointer<IRawElementProviderSimple>} pRetVal 
     * @returns {HRESULT} 
     */
    Navigate(direction, pRetVal) {
        result := ComCall(3, this, "int", direction, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
