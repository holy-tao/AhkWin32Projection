#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Use the ISdo interface to store, retrieve, and update Server Data Objects (SDO) information.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/nn-sdoias-isdo
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct ISdo extends IDispatch {
    /**
     * The interface identifier for ISdo
     * @type {Guid}
     */
    static IID := Guid("{56bc53de-96db-11d1-bf3f-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISdo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetPropertyInfo : IntPtr
        GetProperty     : IntPtr
        PutProperty     : IntPtr
        ResetProperty   : IntPtr
        Apply           : IntPtr
        Restore         : IntPtr
        get__NewEnum    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISdo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * The GetPropertyInfo method retrieves a pointer to an ISdoPropertyInfo interface for the specified property.
     * @remarks
     * Although Server Data Objects (SDO) exposes this method, you do not need it in order to use SDO.
     * @param {Integer} Id Specifies the ID of an existing property.
     * @returns {IUnknown} Pointer to a pointer that receives the address of an <b>ISdoPropertyInfo</b> interface for the specified property.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-getpropertyinfo
     */
    GetPropertyInfo(Id) {
        result := ComCall(7, this, "int", Id, "ptr*", &ppPropertyInfo := 0, "HRESULT")
        return IUnknown(ppPropertyInfo)
    }

    /**
     * The GetProperty method retrieves the value of the specified property.
     * @param {Integer} Id Specifies the ID of an existing property.
     * @returns {VARIANT} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that contains the value of the property.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-getproperty
     */
    GetProperty(Id) {
        pValue := VARIANT()
        result := ComCall(8, this, "int", Id, VARIANT.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * The PutProperty method sets the value of the specified property.
     * @remarks
     * After you have set values using <b>ISdo::PutProperty</b>, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-apply">ISdo::Apply</a> to write the changes to persistent storage.
     * 
     * The method fails if the property is READ_ONLY or if the value is invalid.
     * @param {Integer} Id Specifies the ID of an existing property.
     * @param {Pointer<VARIANT>} pValue Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that contains the value for that property.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-putproperty
     */
    PutProperty(Id, pValue) {
        result := ComCall(9, this, "int", Id, VARIANT.Ptr, pValue, "HRESULT")
        return result
    }

    /**
     * The ResetProperty method resets the specified property to its default value.
     * @remarks
     * Very few IAS properties have default values. If you reset a property that does not have a default value, <b>E_INVALIDARG</b> is returned. In Visual Basic, an error similar to the following is returned: "Function call is invalid".
     * 
     * <div class="alert"><b>Note</b>  Internet Authentication Service (IAS) was renamed Network Policy Server (NPS) starting with Windows Server 2008.</div>
     * <div> </div>
     * @param {Integer} Id Specifies the ID of an existing property.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-resetproperty
     */
    ResetProperty(Id) {
        result := ComCall(10, this, "int", Id, "HRESULT")
        return result
    }

    /**
     * The Apply method writes to persistent storage the changes made by calls to the ISdo::PutProperty method.
     * @remarks
     * To cancel changes made by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-putproperty">ISdo::PutProperty</a>, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-restore">ISdo::Restore</a>.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-apply
     */
    Apply() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The Restore method reloads the values of the Server Data Objects (SDO) properties from persistent storage.
     * @remarks
     * Use the 
     * <b>Restore</b> method to cancel changes made by calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-putproperty">ISdo::PutProperty</a> method.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-restore
     */
    Restore() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The get__NewEnum method retrieves an IEnumVARIANT interface for the Server Data Objects (SDO) properties.
     * @remarks
     * <div class="alert"><b>Note</b>  Two underscores are used between "get" and "NewEnum" in the name of this method.</div>
     * <div> </div>
     * @returns {IUnknown} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer. Use this <b>IUnknown</b> interface pointer with 
     * its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-get__newenum
     */
    get__NewEnum() {
        result := ComCall(13, this, "ptr*", &ppEnumVARIANT := 0, "HRESULT")
        return IUnknown(ppEnumVARIANT)
    }

    Query(iid) {
        if (ISdo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyInfo := CallbackCreate(GetMethod(implObj, "GetPropertyInfo"), flags, 3)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.PutProperty := CallbackCreate(GetMethod(implObj, "PutProperty"), flags, 3)
        this.vtbl.ResetProperty := CallbackCreate(GetMethod(implObj, "ResetProperty"), flags, 2)
        this.vtbl.Apply := CallbackCreate(GetMethod(implObj, "Apply"), flags, 1)
        this.vtbl.Restore := CallbackCreate(GetMethod(implObj, "Restore"), flags, 1)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyInfo)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.PutProperty)
        CallbackFree(this.vtbl.ResetProperty)
        CallbackFree(this.vtbl.Apply)
        CallbackFree(this.vtbl.Restore)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
