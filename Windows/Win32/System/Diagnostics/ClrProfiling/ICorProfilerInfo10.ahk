#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerInfo9.ahk" { ICorProfilerInfo9 }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo10 extends ICorProfilerInfo9 {
    /**
     * The interface identifier for ICorProfilerInfo10
     * @type {Guid}
     */
    static IID := Guid("{2f1b5152-c869-40c9-aa5f-3abe026bd720}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo10 interfaces
    */
    struct Vtbl extends ICorProfilerInfo9.Vtbl {
        EnumerateObjectReferences : IntPtr
        IsFrozenObject            : IntPtr
        GetLOHObjectSizeThreshold : IntPtr
        RequestReJITWithInliners  : IntPtr
        SuspendRuntime            : IntPtr
        ResumeRuntime             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo10.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} _objectId 
     * @param {Pointer<ObjectReferenceCallback>} callback 
     * @param {Pointer<Void>} clientData 
     * @returns {HRESULT} 
     */
    EnumerateObjectReferences(_objectId, callback, clientData) {
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

        result := ComCall(93, this, "ptr", _objectId, "ptr", callback, clientDataMarshal, clientData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} _objectId 
     * @param {Pointer<BOOL>} pbFrozen 
     * @returns {HRESULT} 
     */
    IsFrozenObject(_objectId, pbFrozen) {
        pbFrozenMarshal := pbFrozen is VarRef ? "int*" : "ptr"

        result := ComCall(94, this, "ptr", _objectId, pbFrozenMarshal, pbFrozen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pThreshold 
     * @returns {HRESULT} 
     */
    GetLOHObjectSizeThreshold(pThreshold) {
        pThresholdMarshal := pThreshold is VarRef ? "uint*" : "ptr"

        result := ComCall(95, this, pThresholdMarshal, pThreshold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRejitFlags 
     * @param {Integer} cFunctions 
     * @param {Pointer<Pointer>} moduleIds 
     * @param {Pointer<Integer>} methodIds 
     * @returns {HRESULT} 
     */
    RequestReJITWithInliners(dwRejitFlags, cFunctions, moduleIds, methodIds) {
        moduleIdsMarshal := moduleIds is VarRef ? "ptr*" : "ptr"
        methodIdsMarshal := methodIds is VarRef ? "uint*" : "ptr"

        result := ComCall(96, this, "uint", dwRejitFlags, "uint", cFunctions, moduleIdsMarshal, moduleIds, methodIdsMarshal, methodIds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspendRuntime() {
        result := ComCall(97, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResumeRuntime() {
        result := ComCall(98, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerInfo10.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateObjectReferences := CallbackCreate(GetMethod(implObj, "EnumerateObjectReferences"), flags, 4)
        this.vtbl.IsFrozenObject := CallbackCreate(GetMethod(implObj, "IsFrozenObject"), flags, 3)
        this.vtbl.GetLOHObjectSizeThreshold := CallbackCreate(GetMethod(implObj, "GetLOHObjectSizeThreshold"), flags, 2)
        this.vtbl.RequestReJITWithInliners := CallbackCreate(GetMethod(implObj, "RequestReJITWithInliners"), flags, 5)
        this.vtbl.SuspendRuntime := CallbackCreate(GetMethod(implObj, "SuspendRuntime"), flags, 1)
        this.vtbl.ResumeRuntime := CallbackCreate(GetMethod(implObj, "ResumeRuntime"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateObjectReferences)
        CallbackFree(this.vtbl.IsFrozenObject)
        CallbackFree(this.vtbl.GetLOHObjectSizeThreshold)
        CallbackFree(this.vtbl.RequestReJITWithInliners)
        CallbackFree(this.vtbl.SuspendRuntime)
        CallbackFree(this.vtbl.ResumeRuntime)
    }
}
