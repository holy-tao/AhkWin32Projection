#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdoDictionaryOld interface to manipulate the dictionary of Remote Access Dial-In User Service (RADIUS) attributes.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/nn-sdoias-isdodictionaryold
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdoDictionaryOld extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISdoDictionaryOld
     * @type {Guid}
     */
    static IID => Guid("{d432e5f4-53d8-11d2-9a3a-00c04fb998ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumAttributes", "GetAttributeInfo", "EnumAttributeValues", "CreateAttribute", "GetAttributeID"]

    /**
     * The EnumAttributes method retrieves the values of the specified attributes.
     * @param {Pointer<VARIANT>} Id On input, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> 
     *        that specifies the attributes to enumerate. If the type of this 
     *        <b>VARIANT</b>, given by 
     *        <b>V_VT</b>(Id), is 
     *        <b>VT_EMPTY</b>, 
     *        <b>ISdoDictionaryOld::EnumAttributes</b> 
     *        enumerates all the attributes. If the type is <b>VT_I4</b>, then the value of the 
     *        <b>VARIANT</b> is the ID of the attribute 
     *        to enumerate.
     * 
     * On output, pointer to a 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the IDs of 
     *        the enumerated attributes.
     * @returns {VARIANT} Pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains 
     *       the values of the enumerated attributes.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdodictionaryold-enumattributes
     */
    EnumAttributes(Id) {
        pValues := VARIANT()
        result := ComCall(7, this, "ptr", Id, "ptr", pValues, "HRESULT")
        return pValues
    }

    /**
     * The GetAttributeInfo retrieves information for the specified attribute.
     * @param {Integer} Id Specifies the ID for the attribute.
     * @param {Pointer<VARIANT>} pInfoIDs Pointer to an array of information IDs. This pointer cannot be <b>NULL</b>.
     * @returns {VARIANT} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> of 
     *       information values.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdodictionaryold-getattributeinfo
     */
    GetAttributeInfo(Id, pInfoIDs) {
        pInfoValues := VARIANT()
        result := ComCall(8, this, "uint", Id, "ptr", pInfoIDs, "ptr", pInfoValues, "HRESULT")
        return pInfoValues
    }

    /**
     * The EnumAttributeValues method retrieves the values for an enumerable attribute.
     * @param {Integer} Id Specifies the ID of the attribute.
     * @param {Pointer<VARIANT>} pValueIds On successful return points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> of value IDs for the enumerable attribute. If the attribute is not enumerable, points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VT_EMPTY</a> variant.
     * @returns {VARIANT} On successful return points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> of value descriptions for the enumerable attribute. If the attribute is not enumerable, points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VT_EMPTY</a> variant.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdodictionaryold-enumattributevalues
     */
    EnumAttributeValues(Id, pValueIds) {
        pValuesDesc := VARIANT()
        result := ComCall(9, this, "uint", Id, "ptr", pValueIds, "ptr", pValuesDesc, "HRESULT")
        return pValuesDesc
    }

    /**
     * The CreateAttribute method creates a new attribute object and returns an IDispatch interface to it.
     * @param {Integer} Id Specifies a value from the enumeration type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-attributeid">ATTRIBUTEID</a>. This value specifies the type of attribute to create.
     * @returns {IDispatch} Pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer for the created attribute object.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdodictionaryold-createattribute
     */
    CreateAttribute(Id) {
        result := ComCall(10, this, "uint", Id, "ptr*", &ppAttributeObject := 0, "HRESULT")
        return IDispatch(ppAttributeObject)
    }

    /**
     * The GetAttributeID method retrieves the ID for the specified attribute.
     * @param {BSTR} bstrAttributeName Specifies the name of the attribute. This name is either the Lightweight Directory Access Protocol (LDAP) name, or the display name for the attribute.
     * @returns {Integer} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-attributeid">ATTRIBUTEID</a> that receives the ID of the specified attribute.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdodictionaryold-getattributeid
     */
    GetAttributeID(bstrAttributeName) {
        bstrAttributeName := bstrAttributeName is String ? BSTR.Alloc(bstrAttributeName).Value : bstrAttributeName

        result := ComCall(11, this, "ptr", bstrAttributeName, "uint*", &pId := 0, "HRESULT")
        return pId
    }
}
