#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Supports retrieving and updating individual properties in an instance of a WMI class.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbempropertyprovider
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemPropertyProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemPropertyProvider
     * @type {Guid}
     */
    static IID => Guid("{ce61e841-65bc-11d0-b6bd-00aa003240c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty", "PutProperty"]

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} strLocale 
     * @param {BSTR} strClassMapping 
     * @param {BSTR} strInstMapping 
     * @param {BSTR} strPropMapping 
     * @param {Pointer<VARIANT>} pvValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbempropertyprovider-getproperty
     */
    GetProperty(lFlags, strLocale, strClassMapping, strInstMapping, strPropMapping, pvValue) {
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale
        strClassMapping := strClassMapping is String ? BSTR.Alloc(strClassMapping).Value : strClassMapping
        strInstMapping := strInstMapping is String ? BSTR.Alloc(strInstMapping).Value : strInstMapping
        strPropMapping := strPropMapping is String ? BSTR.Alloc(strPropMapping).Value : strPropMapping

        result := ComCall(3, this, "int", lFlags, "ptr", strLocale, "ptr", strClassMapping, "ptr", strInstMapping, "ptr", strPropMapping, "ptr", pvValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} strLocale 
     * @param {BSTR} strClassMapping 
     * @param {BSTR} strInstMapping 
     * @param {BSTR} strPropMapping 
     * @param {Pointer<VARIANT>} pvValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbempropertyprovider-putproperty
     */
    PutProperty(lFlags, strLocale, strClassMapping, strInstMapping, strPropMapping, pvValue) {
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale
        strClassMapping := strClassMapping is String ? BSTR.Alloc(strClassMapping).Value : strClassMapping
        strInstMapping := strInstMapping is String ? BSTR.Alloc(strInstMapping).Value : strInstMapping
        strPropMapping := strPropMapping is String ? BSTR.Alloc(strPropMapping).Value : strPropMapping

        result := ComCall(4, this, "int", lFlags, "ptr", strLocale, "ptr", strClassMapping, "ptr", strInstMapping, "ptr", strPropMapping, "ptr", pvValue, "HRESULT")
        return result
    }
}
