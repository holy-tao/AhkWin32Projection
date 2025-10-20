#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods and properties that expose simple UI elements.
 * @remarks
 * 
  * This interface can be implemented on:
  * 			
  * 
  * <ul>
  * <li>UI Automation provider for simple UI elements, such as buttons.</li>
  * <li>Providers that add or override properties or control patterns on a UI element that already has a provider.</li>
  * </ul>
  * Providers for complex elements must also implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a> and, if they 
  * 			are root elements, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot">IRawElementProviderFragmentRoot</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementprovidersimple
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderSimple extends IUnknown{
    /**
     * The interface identifier for IRawElementProviderSimple
     * @type {Guid}
     */
    static IID => Guid("{d6dd68d1-86fd-4332-8666-9abedea2d24c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_ProviderOptions(pRetVal) {
        result := ComCall(3, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<IUnknown>} pRetVal 
     * @returns {HRESULT} 
     */
    GetPatternProvider(patternId, pRetVal) {
        result := ComCall(4, this, "int", patternId, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pRetVal 
     * @returns {HRESULT} 
     */
    GetPropertyValue(propertyId, pRetVal) {
        result := ComCall(5, this, "int", propertyId, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} pRetVal 
     * @returns {HRESULT} 
     */
    get_HostRawElementProvider(pRetVal) {
        result := ComCall(6, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
