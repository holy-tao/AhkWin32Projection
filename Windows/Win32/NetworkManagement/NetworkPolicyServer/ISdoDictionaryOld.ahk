#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ATTRIBUTEID.ahk" { ATTRIBUTEID }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Use the ISdoDictionaryOld interface to manipulate the dictionary of Remote Access Dial-In User Service (RADIUS) attributes.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/nn-sdoias-isdodictionaryold
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct ISdoDictionaryOld extends IDispatch {
    /**
     * The interface identifier for ISdoDictionaryOld
     * @type {Guid}
     */
    static IID := Guid("{d432e5f4-53d8-11d2-9a3a-00c04fb998ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISdoDictionaryOld interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        EnumAttributes      : IntPtr
        GetAttributeInfo    : IntPtr
        EnumAttributeValues : IntPtr
        CreateAttribute     : IntPtr
        GetAttributeID      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISdoDictionaryOld.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The EnumAttributes method retrieves the values of the specified attributes.
     * @remarks
     * The parameters must not be <b>NULL</b>.
     * 
     * If VT(Id) = VT_EMPTY then all the attributes are returned. Otherwise VT(Id) should be <b>VT_I4</b> and only the attributes designed are retrieved.
     * 
     * When the method returns, Id is a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> of the Ids returned, and <i>pValues</i> is a <b>SAFEARRAY</b> of the values returned.
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
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-enumattributes
     */
    EnumAttributes(Id) {
        pValues := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, Id, VARIANT.Ptr, pValues, "HRESULT")
        return pValues
    }

    /**
     * The GetAttributeInfo retrieves information for the specified attribute.
     * @remarks
     * Although Server Data Objects (SDO) exposes this method, you do not need it in order to use SDO. The use of 
     *     this method is discouraged.
     * @param {ATTRIBUTEID} Id Specifies the ID for the attribute.
     * @param {Pointer<VARIANT>} pInfoIDs Pointer to an array of information IDs. This pointer cannot be <b>NULL</b>.
     * @returns {VARIANT} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> of 
     *       information values.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-getattributeinfo
     */
    GetAttributeInfo(Id, pInfoIDs) {
        pInfoValues := VARIANT()
        result := ComCall(8, this, ATTRIBUTEID, Id, VARIANT.Ptr, pInfoIDs, VARIANT.Ptr, pInfoValues, "HRESULT")
        return pInfoValues
    }

    /**
     * The EnumAttributeValues method retrieves the values for an enumerable attribute.
     * @remarks
     * The return value is S_OK even if the attribute is not enumerable.
     * @param {ATTRIBUTEID} Id Specifies the ID of the attribute.
     * @param {Pointer<VARIANT>} pValueIds On successful return points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> of value IDs for the enumerable attribute. If the attribute is not enumerable, points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VT_EMPTY</a> variant.
     * @returns {VARIANT} On successful return points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> of value descriptions for the enumerable attribute. If the attribute is not enumerable, points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VT_EMPTY</a> variant.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-enumattributevalues
     */
    EnumAttributeValues(Id, pValueIds) {
        pValuesDesc := VARIANT()
        result := ComCall(9, this, ATTRIBUTEID, Id, VARIANT.Ptr, pValueIds, VARIANT.Ptr, pValuesDesc, "HRESULT")
        return pValuesDesc
    }

    /**
     * The CreateAttribute method creates a new attribute object and returns an IDispatch interface to it.
     * @param {ATTRIBUTEID} Id Specifies a value from the enumeration type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-attributeid">ATTRIBUTEID</a>. This value specifies the type of attribute to create.
     * @returns {IDispatch} Pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer for the created attribute object.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-createattribute
     */
    CreateAttribute(Id) {
        result := ComCall(10, this, ATTRIBUTEID, Id, "ptr*", &ppAttributeObject := 0, "HRESULT")
        return IDispatch(ppAttributeObject)
    }

    /**
     * The GetAttributeID method retrieves the ID for the specified attribute.
     * @param {BSTR} bstrAttributeName Specifies the name of the attribute. This name is either the Lightweight Directory Access Protocol (LDAP) name, or the display name for the attribute.
     * @returns {ATTRIBUTEID} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-attributeid">ATTRIBUTEID</a> that receives the ID of the specified attribute.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-getattributeid
     */
    GetAttributeID(bstrAttributeName) {
        bstrAttributeName := bstrAttributeName is String ? BSTR.Alloc(bstrAttributeName).Value : bstrAttributeName

        result := ComCall(11, this, BSTR, bstrAttributeName, "uint*", &pId := 0, "HRESULT")
        return pId
    }

    Query(iid) {
        if (ISdoDictionaryOld.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumAttributes := CallbackCreate(GetMethod(implObj, "EnumAttributes"), flags, 3)
        this.vtbl.GetAttributeInfo := CallbackCreate(GetMethod(implObj, "GetAttributeInfo"), flags, 4)
        this.vtbl.EnumAttributeValues := CallbackCreate(GetMethod(implObj, "EnumAttributeValues"), flags, 4)
        this.vtbl.CreateAttribute := CallbackCreate(GetMethod(implObj, "CreateAttribute"), flags, 3)
        this.vtbl.GetAttributeID := CallbackCreate(GetMethod(implObj, "GetAttributeID"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumAttributes)
        CallbackFree(this.vtbl.GetAttributeInfo)
        CallbackFree(this.vtbl.EnumAttributeValues)
        CallbackFree(this.vtbl.CreateAttribute)
        CallbackFree(this.vtbl.GetAttributeID)
    }
}
