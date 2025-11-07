#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables Microsoft UI Automation clients to retrieve the visual styles associated with an element in a document.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationstylespattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationStylesPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationStylesPattern
     * @type {Guid}
     */
    static IID => Guid("{85b5f0a2-bd79-484a-ad2b-388c9838d5fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentStyleId", "get_CurrentStyleName", "get_CurrentFillColor", "get_CurrentFillPatternStyle", "get_CurrentShape", "get_CurrentFillPatternColor", "get_CurrentExtendedProperties", "GetCurrentExtendedPropertiesAsArray", "get_CachedStyleId", "get_CachedStyleName", "get_CachedFillColor", "get_CachedFillPatternStyle", "get_CachedShape", "get_CachedFillPatternColor", "get_CachedExtendedProperties", "GetCachedExtendedPropertiesAsArray"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentstyleid
     */
    get_CurrentStyleId() {
        result := ComCall(3, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentstylename
     */
    get_CurrentStyleName() {
        retVal := BSTR()
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentfillcolor
     */
    get_CurrentFillColor() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CurrentFillPatternStyle() {
        retVal := BSTR()
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentshape
     */
    get_CurrentShape() {
        retVal := BSTR()
        result := ComCall(7, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentfillpatterncolor
     */
    get_CurrentFillPatternColor() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentextendedproperties
     */
    get_CurrentExtendedProperties() {
        retVal := BSTR()
        result := ComCall(9, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {Pointer<Pointer<ExtendedProperty>>} propertyArray 
     * @param {Pointer<Integer>} propertyCount 
     * @returns {HRESULT} 
     */
    GetCurrentExtendedPropertiesAsArray(propertyArray, propertyCount) {
        propertyArrayMarshal := propertyArray is VarRef ? "ptr*" : "ptr"
        propertyCountMarshal := propertyCount is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, propertyArrayMarshal, propertyArray, propertyCountMarshal, propertyCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedstyleid
     */
    get_CachedStyleId() {
        result := ComCall(11, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedstylename
     */
    get_CachedStyleName() {
        retVal := BSTR()
        result := ComCall(12, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedfillcolor
     */
    get_CachedFillColor() {
        result := ComCall(13, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CachedFillPatternStyle() {
        retVal := BSTR()
        result := ComCall(14, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedshape
     */
    get_CachedShape() {
        retVal := BSTR()
        result := ComCall(15, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedfillpatterncolor
     */
    get_CachedFillPatternColor() {
        result := ComCall(16, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedextendedproperties
     */
    get_CachedExtendedProperties() {
        retVal := BSTR()
        result := ComCall(17, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {Pointer<Pointer<ExtendedProperty>>} propertyArray 
     * @param {Pointer<Integer>} propertyCount 
     * @returns {HRESULT} 
     */
    GetCachedExtendedPropertiesAsArray(propertyArray, propertyCount) {
        propertyArrayMarshal := propertyArray is VarRef ? "ptr*" : "ptr"
        propertyCountMarshal := propertyCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, propertyArrayMarshal, propertyArray, propertyCountMarshal, propertyCount, "HRESULT")
        return result
    }
}
