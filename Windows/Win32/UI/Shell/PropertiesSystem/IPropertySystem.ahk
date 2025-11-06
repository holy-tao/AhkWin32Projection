#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get property descriptions, register and unregister property schemas, enumerate property descriptions, and format property values in a type-strict way.
 * @remarks
 * 
  * Many of the exported APIs (such as <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescription">PSGetPropertyDescription</a>) are simply wrappers around the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertysystem">IPropertySystem</a> methods. If your code calls a lot of these helper APIs in sequence, it may be worthwhile to instantiate a single <b>IPropertySystem</b> object, and call the methods directly, rather than calling the helper APIs. (To improve the performance, the helper APIs do obtain a cached instance of the <b>IPropertySystem</b> object.)
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertysystem
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertySystem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertySystem
     * @type {Guid}
     */
    static IID => Guid("{ca724e8a-c3e6-442b-88a4-6fb0db8035a3}")

    /**
     * The class identifier for PropertySystem
     * @type {Guid}
     */
    static CLSID => Guid("{b8967f85-58ae-4f46-9fb2-5d7904798f4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyDescription", "GetPropertyDescriptionByName", "GetPropertyDescriptionListFromString", "EnumeratePropertyDescriptions", "FormatForDisplay", "FormatForDisplayAlloc", "RegisterPropertySchema", "UnregisterPropertySchema", "RefreshPropertySchema"]

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertysystem-getpropertydescription
     */
    GetPropertyDescription(propkey, riid) {
        result := ComCall(3, this, "ptr", propkey, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszCanonicalName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertysystem-getpropertydescriptionbyname
     */
    GetPropertyDescriptionByName(pszCanonicalName, riid) {
        pszCanonicalName := pszCanonicalName is String ? StrPtr(pszCanonicalName) : pszCanonicalName

        result := ComCall(4, this, "ptr", pszCanonicalName, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszPropList 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertysystem-getpropertydescriptionlistfromstring
     */
    GetPropertyDescriptionListFromString(pszPropList, riid) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        result := ComCall(5, this, "ptr", pszPropList, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} filterOn 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertysystem-enumeratepropertydescriptions
     */
    EnumeratePropertyDescriptions(filterOn, riid) {
        result := ComCall(6, this, "int", filterOn, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @param {Integer} pdff 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertysystem-formatfordisplay
     */
    FormatForDisplay(key, propvar, pdff, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(7, this, "ptr", key, "ptr", propvar, "int", pdff, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @param {Integer} pdff 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertysystem-formatfordisplayalloc
     */
    FormatForDisplayAlloc(key, propvar, pdff) {
        result := ComCall(8, this, "ptr", key, "ptr", propvar, "int", pdff, "ptr*", &ppszDisplay := 0, "HRESULT")
        return ppszDisplay
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertysystem-registerpropertyschema
     */
    RegisterPropertySchema(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(9, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertysystem-unregisterpropertyschema
     */
    UnregisterPropertySchema(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertysystem-refreshpropertyschema
     */
    RefreshPropertySchema() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
