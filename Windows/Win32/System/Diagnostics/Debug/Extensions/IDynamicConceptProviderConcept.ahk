#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDynamicConceptProviderConcept extends IUnknown {
    /**
     * The interface identifier for IDynamicConceptProviderConcept
     * @type {Guid}
     */
    static IID := Guid("{95a7f7dd-602e-483f-9d06-a15c0ee13174}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDynamicConceptProviderConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetConcept         : IntPtr
        SetConcept         : IntPtr
        NotifyParent       : IntPtr
        NotifyParentChange : IntPtr
        NotifyDestruct     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDynamicConceptProviderConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<Guid>} conceptId 
     * @param {Pointer<IUnknown>} conceptInterface 
     * @param {Pointer<IKeyStore>} conceptMetadata 
     * @param {Pointer<Boolean>} hasConcept 
     * @returns {HRESULT} 
     */
    GetConcept(contextObject, conceptId, conceptInterface, conceptMetadata, hasConcept) {
        hasConceptMarshal := hasConcept is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", contextObject, Guid.Ptr, conceptId, IUnknown.Ptr, conceptInterface, IKeyStore.Ptr, conceptMetadata, hasConceptMarshal, hasConcept, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<Guid>} conceptId 
     * @param {IUnknown} conceptInterface 
     * @param {IKeyStore} conceptMetadata 
     * @returns {HRESULT} 
     */
    SetConcept(contextObject, conceptId, conceptInterface, conceptMetadata) {
        result := ComCall(4, this, "ptr", contextObject, Guid.Ptr, conceptId, "ptr", conceptInterface, "ptr", conceptMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} parentModel 
     * @returns {HRESULT} 
     */
    NotifyParent(parentModel) {
        result := ComCall(5, this, "ptr", parentModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} parentModel 
     * @returns {HRESULT} 
     */
    NotifyParentChange(parentModel) {
        result := ComCall(6, this, "ptr", parentModel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyDestruct() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDynamicConceptProviderConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConcept := CallbackCreate(GetMethod(implObj, "GetConcept"), flags, 6)
        this.vtbl.SetConcept := CallbackCreate(GetMethod(implObj, "SetConcept"), flags, 5)
        this.vtbl.NotifyParent := CallbackCreate(GetMethod(implObj, "NotifyParent"), flags, 2)
        this.vtbl.NotifyParentChange := CallbackCreate(GetMethod(implObj, "NotifyParentChange"), flags, 2)
        this.vtbl.NotifyDestruct := CallbackCreate(GetMethod(implObj, "NotifyDestruct"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConcept)
        CallbackFree(this.vtbl.SetConcept)
        CallbackFree(this.vtbl.NotifyParent)
        CallbackFree(this.vtbl.NotifyParentChange)
        CallbackFree(this.vtbl.NotifyDestruct)
    }
}
