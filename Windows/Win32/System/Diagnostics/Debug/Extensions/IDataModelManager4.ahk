#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelManager3.ahk" { IDataModelManager3 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelManager4 extends IDataModelManager3 {
    /**
     * The interface identifier for IDataModelManager4
     * @type {Guid}
     */
    static IID := Guid("{8898ad97-3a2e-421c-953f-035e15426b7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelManager4 interfaces
    */
    struct Vtbl extends IDataModelManager3.Vtbl {
        CreateSyntheticObjectFromKeyStore : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelManager4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {IKeyStore} parentStore 
     * @returns {IModelObject} 
     */
    CreateSyntheticObjectFromKeyStore(_context, parentStore) {
        result := ComCall(27, this, "ptr", _context, "ptr", parentStore, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    Query(iid) {
        if (IDataModelManager4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSyntheticObjectFromKeyStore := CallbackCreate(GetMethod(implObj, "CreateSyntheticObjectFromKeyStore"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSyntheticObjectFromKeyStore)
    }
}
