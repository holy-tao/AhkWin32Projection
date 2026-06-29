#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPropTagArray.ahk" { SPropTagArray }
#Import ".\IMAPIProp.ahk" { IMAPIProp }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPropProblemArray.ahk" { SPropProblemArray }

/**
 * IPropData IMAPIProp provides the ability to retrieve and change the access for an object's properties.
 * @remarks
 * The **IPropData::IMAPIProp** interface is implemented by MAPI and used primarily by service providers that access this implementation by calling the [CreateIProp](createiprop.md) function. 
 *   
 * For more information about access levels on objects and properties, see [Permissions for Objects and Properties](permissions-for-mapi-objects-and-properties.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdataimapiprop
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct IPropData extends IMAPIProp {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropData interfaces
    */
    struct Vtbl extends IMAPIProp.Vtbl {
        HrSetObjAccess  : IntPtr
        HrSetPropAccess : IntPtr
        HrGetPropAccess : IntPtr
        HrAddObjProps   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @remarks
     * The **IPropData::HrSetObjAccess** method sets the access level for an entire object, rather than for individual properties. **HrSetObjAccess** can be used to change the access level established when the object was created.
     * @param {Integer} ulAccess > [in] A bitmask of flags that specifies the object's access level. One of the following flags can be set:
     *     
     * IPROP_READONLY 
     *   
     * > Sets the object's access level to read-only. 
     *     
     * IPROP_READWRITE 
     *   
     * > Sets the object's access level to read/write.
     * @returns {HRESULT} S_OK 
     *   
     * > The object's access level was successfully set.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdata-hrsetobjaccess
     */
    HrSetObjAccess(ulAccess) {
        result := ComCall(14, this, "uint", ulAccess, "HRESULT")
        return result
    }

    /**
     * IPropData HrSetPropAccess sets the access level or status for one or more of the object's properties.
     * @remarks
     * The **IPropData::HrSetPropAccess** method changes the access level and status for the properties that are identified by the property tags in the [SPropTagArray](sproptagarray.md) structure pointed to by the  _lpPropTagArray_ parameter. For each property, there is a corresponding entry in the _rgulAccess_ array. The entry can be set to one flag that indicates the property's access level and another flag that indicates its status.
     * @param {Pointer<SPropTagArray>} lpPropTagArray > [in] A pointer to an array of property tags that indicate the properties to be modified.
     * @param {Pointer<Integer>} rgulAccess > [in] An array of flag bitmasks. Each bitmask indicates the access levels or status, or both, for each of the properties identified in the array that the  _lpPropTagArray_ parameter points to. The two arrays are positional in that the first bitmask in  _rgulAccess_ describes the first property that  _lpPropTagArray_ points to, and so on. For each property tag, one access-level flag and one status flag can be set. The following table shows the possible flags. 
     *     
     * |**Access-level flag**|**Status flag**|
     * |:-----|:-----|
     * |IPROP_READONLY, which indicates that the property cannot be modified  <br/> |IPROP_CLEAN, which indicates that the property has not been modified. |
     * |IPROP_READWRITE, which indicates that the property can be modified. |IPROP_DIRTY, which indicates that the property has been modified. |
     * @returns {HRESULT} S_OK 
     *   
     * > The access-level and status flags have been successfully set.
     *     
     * MAPI_E_NO_ACCESS 
     *   
     * > An attempt was made to set a property on a read-only object or an object for which the caller has insufficient permissions.
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > The  _rgulAccess_ parameter contains an invalid combination of flags, such as IPROP_READONLY and IPROP_READWRITE.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdata-hrsetpropaccess
     */
    HrSetPropAccess(lpPropTagArray, rgulAccess) {
        rgulAccessMarshal := rgulAccess is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, SPropTagArray.Ptr, lpPropTagArray, rgulAccessMarshal, rgulAccess, "HRESULT")
        return result
    }

    /**
     * IPropData HrGetPropAccess retrieves the access level and status for one or more of the object's properties.
     * @remarks
     * The **IPropData::HrGetPropAccess** method retrieves a set of flags that indicates the access level and status for one or more properties.
     * @param {Pointer<Pointer<SPropTagArray>>} lppPropTagArray > [in, out] On input, an array of property tags that indicate the properties for which to retrieve access levels and status; otherwise, a pointer to NULL, which indicates that **HrGetPropAccess** should retrieve access levels and status for all properties. On output, an array of property tags for which access and status flags were retrieved. The flags are stored in the array pointed to by the  _lprgulAccess_ parameter.
     * @param {Pointer<Pointer<Integer>>} lprgulAccess > [out] A pointer to an array of flag bitmasks. Each bitmask indicates the access levels or status, or both, for each of the properties identified in the array pointed to by the  _lpPropTagArray_ parameter. The two arrays are positional in that the first bitmask that  _lprgulAccess_ points to describes the first property that  _lpPropTagArray_ points to, and so on. For each property tag, the following flags can be set: 
     *     
     * |**Access-level flag**|**Status flag**|
     * |:-----|:-----|
     * |IPROP_READONLY, which indicates that the property cannot be modified. |IPROP_CLEAN, which indicates that the property has not been modified. |
     * |IPROP_READWRITE, which indicates that the property can be modified. |IPROP_DIRTY, which indicates that the property has been modified. |
     * @returns {HRESULT} S_OK 
     *   
     * > The access level and status flags for the properties were successfully returned.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdata-hrgetpropaccess
     */
    HrGetPropAccess(lppPropTagArray, lprgulAccess) {
        lppPropTagArrayMarshal := lppPropTagArray is VarRef ? "ptr*" : "ptr"
        lprgulAccessMarshal := lprgulAccess is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, lppPropTagArrayMarshal, lppPropTagArray, lprgulAccessMarshal, lprgulAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IPropData::HrAddObjProps** method adds one or more properties of type PT_OBJECT to the object. **HrAddObjProps** provides an alternative to the [IMAPIProp::SetProps](imapiprop-setprops.md) method for object properties, because object properties cannot be created by calling **SetProps**. Adding an object property results in the property tag being included in the list of property tags that the [IMAPIProp::GetPropList](imapiprop-getproplist.md) method returns.
     * @param {Pointer<SPropTagArray>} lppPropTagArray 
     * @param {Pointer<Pointer<SPropProblemArray>>} lprgulAccess 
     * @returns {HRESULT} S_OK 
     *   
     * > The properties were successfully added.
     *     
     * MAPI_E_INVALID_TYPE 
     *   
     * > A property type other than PT_OBJECT was passed in the array that the  _lpPropTagArray_ parameter points to. 
     *     
     * MAPI_E_NO_ACCESS 
     *   
     * > The object has been set not to allow read/write permission.
     *     
     * MAPI_W_PARTIAL_COMPLETION 
     *   
     * > Some, but not all, of the properties were added.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdata-hraddobjprops
     */
    HrAddObjProps(lppPropTagArray, lprgulAccess) {
        lprgulAccessMarshal := lprgulAccess is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, SPropTagArray.Ptr, lppPropTagArray, lprgulAccessMarshal, lprgulAccess, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPropData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HrSetObjAccess := CallbackCreate(GetMethod(implObj, "HrSetObjAccess"), flags, 2)
        this.vtbl.HrSetPropAccess := CallbackCreate(GetMethod(implObj, "HrSetPropAccess"), flags, 3)
        this.vtbl.HrGetPropAccess := CallbackCreate(GetMethod(implObj, "HrGetPropAccess"), flags, 3)
        this.vtbl.HrAddObjProps := CallbackCreate(GetMethod(implObj, "HrAddObjProps"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HrSetObjAccess)
        CallbackFree(this.vtbl.HrSetPropAccess)
        CallbackFree(this.vtbl.HrGetPropAccess)
        CallbackFree(this.vtbl.HrAddObjProps)
    }
}
