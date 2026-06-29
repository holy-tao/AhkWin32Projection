#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\FsrmFileConditionType.ahk" { FsrmFileConditionType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmFileCondition extends IDispatch {
    /**
     * The interface identifier for IFsrmFileCondition
     * @type {Guid}
     */
    static IID := Guid("{70684ffc-691a-4a1a-b922-97752e138cc1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmFileCondition interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type : IntPtr
        Delete   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmFileCondition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {FsrmFileConditionType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {FsrmFileConditionType} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmFileCondition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.Delete)
    }
}
