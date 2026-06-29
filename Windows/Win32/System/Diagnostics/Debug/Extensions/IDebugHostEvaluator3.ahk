#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostEvaluator2.ahk" { IDebugHostEvaluator2 }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostEvaluator3 extends IDebugHostEvaluator2 {
    /**
     * The interface identifier for IDebugHostEvaluator3
     * @type {Guid}
     */
    static IID := Guid("{d2419f4a-7e8d-4c15-a499-73902b015abb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostEvaluator3 interfaces
    */
    struct Vtbl extends IDebugHostEvaluator2.Vtbl {
        Compare : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostEvaluator3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} pLeft 
     * @param {IModelObject} pRight 
     * @returns {IModelObject} 
     */
    Compare(pLeft, pRight) {
        result := ComCall(6, this, "ptr", pLeft, "ptr", pRight, "ptr*", &ppResult := 0, "HRESULT")
        return IModelObject(ppResult)
    }

    Query(iid) {
        if (IDebugHostEvaluator3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compare := CallbackCreate(GetMethod(implObj, "Compare"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Compare)
    }
}
