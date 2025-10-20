#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the visual styles associated with the content of a document.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-istylesprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IStylesProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStylesProvider
     * @type {Guid}
     */
    static IID => Guid("{19b6b649-f5d7-4a6d-bdcb-129252be588a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StyleId", "get_StyleName", "get_FillColor", "get_FillPatternStyle", "get_Shape", "get_FillPatternColor", "get_ExtendedProperties"]

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_styleid
     */
    get_StyleId(retVal) {
        result := ComCall(3, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_stylename
     */
    get_StyleName(retVal) {
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_fillcolor
     */
    get_FillColor(retVal) {
        result := ComCall(5, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_fillpatternstyle
     */
    get_FillPatternStyle(retVal) {
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_shape
     */
    get_Shape(retVal) {
        result := ComCall(7, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_fillpatterncolor
     */
    get_FillPatternColor(retVal) {
        result := ComCall(8, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-istylesprovider-get_extendedproperties
     */
    get_ExtendedProperties(retVal) {
        result := ComCall(9, this, "ptr", retVal, "HRESULT")
        return result
    }
}
