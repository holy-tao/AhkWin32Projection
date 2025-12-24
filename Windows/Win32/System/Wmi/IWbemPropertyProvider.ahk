#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
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
     * The IWbemPropertyProvider::GetProperty method is called by Windows Management to retrieve an individual property value.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @param {BSTR} strLocale String indicating the desired locale in cases where the returned property value can be localized. If the property cannot be localized, the implementation can ignore this value.
     * @param {BSTR} strClassMapping Literal copy of the string value for the <b>ClassContext</b> qualifier for the class. This points to a valid <b>BSTR</b>, which is treated as read-only, or <b>NULL</b> if the qualifier does not exist.
     * @param {BSTR} strInstMapping Literal copy of the string value for the <b>InstanceContext</b> qualifier for the instance. This must point to a valid <b>BSTR</b>, which is treated as read-only, or <b>NULL</b> if the qualifier does not exist.
     * @param {BSTR} strPropMapping Literal copy of the value of the <b>PropertyContext</b> qualifier for the property. This must point to a valid <b>BSTR</b>, which is treated as read-only, or <b>NULL</b> if the qualifier does not exist.
     * @returns {VARIANT} Pointer to an uninitialized <b>VARIANT</b> that receives the value for the property. The implementation must call <b>VariantInit</b> and return the value. If an error occurs, the implementation is expected to ignore the pointer.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbempropertyprovider-getproperty
     */
    GetProperty(lFlags, strLocale, strClassMapping, strInstMapping, strPropMapping) {
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale
        strClassMapping := strClassMapping is String ? BSTR.Alloc(strClassMapping).Value : strClassMapping
        strInstMapping := strInstMapping is String ? BSTR.Alloc(strInstMapping).Value : strInstMapping
        strPropMapping := strPropMapping is String ? BSTR.Alloc(strPropMapping).Value : strPropMapping

        pvValue := VARIANT()
        result := ComCall(3, this, "int", lFlags, "ptr", strLocale, "ptr", strClassMapping, "ptr", strInstMapping, "ptr", strPropMapping, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * The IWbemPropertyProvider::PutProperty method is called by Windows Management to update a property value supported by a property provider.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @param {BSTR} strLocale String indicating the desired locale in cases where the returned property value can be localized. If the property cannot be localized, the implementation can ignore this value.
     * @param {BSTR} strClassMapping Literal copy of the string value for the <b>ClassContext</b> qualifier for the class. This points to a valid <b>BSTR</b>, which is treated as read-only, or <b>NULL</b> if the qualifier does not exist.
     * @param {BSTR} strInstMapping Literal copy of the string value for the <b>InstanceContext</b> qualifier for the instance. This must point to a valid <b>BSTR</b>, which is treated as read-only, or <b>NULL</b> if the qualifier does not exist.
     * @param {BSTR} strPropMapping Literal copy of the value of the <b>PropertyContext</b> qualifier for the property. This must point to a valid <b>BSTR</b>, which is treated as read-only, or <b>NULL</b> if the qualifier does not exist.
     * @param {Pointer<VARIANT>} pvValue Pointer to an existing <b>VARIANT</b> that contains the value to be written.
     * @returns {HRESULT} This method must return <b>WBEM_S_NO_ERROR</b> if the operation succeeds, or <b>WBEM_S_FALSE</b> if the operation fails.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbempropertyprovider-putproperty
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
