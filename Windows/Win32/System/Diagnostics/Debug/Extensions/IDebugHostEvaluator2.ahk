#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostEvaluator.ahk" { IDebugHostEvaluator }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostEvaluator2 extends IDebugHostEvaluator {
    /**
     * The interface identifier for IDebugHostEvaluator2
     * @type {Guid}
     */
    static IID := Guid("{a117a435-1fb4-4092-a2ab-a929576c1e87}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostEvaluator2 interfaces
    */
    struct Vtbl extends IDebugHostEvaluator.Vtbl {
        AssignTo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostEvaluator2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} assignmentReference 
     * @param {IModelObject} assignmentValue 
     * @param {Pointer<IModelObject>} assignmentResult 
     * @param {Pointer<IKeyStore>} assignmentMetadata 
     * @returns {HRESULT} 
     */
    AssignTo(assignmentReference, assignmentValue, assignmentResult, assignmentMetadata) {
        result := ComCall(5, this, "ptr", assignmentReference, "ptr", assignmentValue, IModelObject.Ptr, assignmentResult, IKeyStore.Ptr, assignmentMetadata, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostEvaluator2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AssignTo := CallbackCreate(GetMethod(implObj, "AssignTo"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AssignTo)
    }
}
