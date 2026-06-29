#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISdo.ahk" { ISdo }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct ITemplateSdo extends ISdo {
    /**
     * The interface identifier for ITemplateSdo
     * @type {Guid}
     */
    static IID := Guid("{8aa85302-d2e2-4e20-8b1f-a571e437d6c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITemplateSdo interfaces
    */
    struct Vtbl extends ISdo.Vtbl {
        AddToCollection    : IntPtr
        AddToSdo           : IntPtr
        AddToSdoAsProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITemplateSdo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {IDispatch} pCollection 
     * @param {Pointer<IDispatch>} ppItem 
     * @returns {HRESULT} 
     */
    AddToCollection(bstrName, pCollection, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(14, this, BSTR, bstrName, "ptr", pCollection, IDispatch.Ptr, ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {IDispatch} pSdoTarget 
     * @param {Pointer<IDispatch>} ppItem 
     * @returns {HRESULT} 
     */
    AddToSdo(bstrName, pSdoTarget, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(15, this, BSTR, bstrName, "ptr", pSdoTarget, IDispatch.Ptr, ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pSdoTarget 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    AddToSdoAsProperty(pSdoTarget, id) {
        result := ComCall(16, this, "ptr", pSdoTarget, "int", id, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITemplateSdo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddToCollection := CallbackCreate(GetMethod(implObj, "AddToCollection"), flags, 4)
        this.vtbl.AddToSdo := CallbackCreate(GetMethod(implObj, "AddToSdo"), flags, 4)
        this.vtbl.AddToSdoAsProperty := CallbackCreate(GetMethod(implObj, "AddToSdoAsProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddToCollection)
        CallbackFree(this.vtbl.AddToSdo)
        CallbackFree(this.vtbl.AddToSdoAsProperty)
    }
}
