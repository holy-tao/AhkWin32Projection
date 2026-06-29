#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\COR_PRF_GC_ROOT_KIND.ahk" { COR_PRF_GC_ROOT_KIND }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\COR_PRF_GC_ROOT_FLAGS.ahk" { COR_PRF_GC_ROOT_FLAGS }
#Import ".\ICorProfilerCallback.ahk" { ICorProfilerCallback }
#Import ".\COR_PRF_GC_REASON.ahk" { COR_PRF_GC_REASON }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback2 extends ICorProfilerCallback {
    /**
     * The interface identifier for ICorProfilerCallback2
     * @type {Guid}
     */
    static IID := Guid("{8a8cc829-ccf2-49fe-bbae-0f022228071a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback2 interfaces
    */
    struct Vtbl extends ICorProfilerCallback.Vtbl {
        ThreadNameChanged         : IntPtr
        GarbageCollectionStarted  : IntPtr
        SurvivingReferences       : IntPtr
        GarbageCollectionFinished : IntPtr
        FinalizeableObjectQueued  : IntPtr
        RootReferences2           : IntPtr
        HandleCreated             : IntPtr
        HandleDestroyed           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @param {Integer} cchName 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     */
    ThreadNameChanged(threadId, cchName, name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(72, this, "ptr", threadId, "uint", cchName, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cGenerations 
     * @param {Pointer<BOOL>} generationCollected 
     * @param {COR_PRF_GC_REASON} reason 
     * @returns {HRESULT} 
     */
    GarbageCollectionStarted(cGenerations, generationCollected, reason) {
        generationCollectedMarshal := generationCollected is VarRef ? "int*" : "ptr"

        result := ComCall(73, this, "int", cGenerations, generationCollectedMarshal, generationCollected, COR_PRF_GC_REASON, reason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cSurvivingObjectIDRanges 
     * @param {Pointer<Pointer>} objectIDRangeStart 
     * @param {Pointer<Integer>} cObjectIDRangeLength 
     * @returns {HRESULT} 
     */
    SurvivingReferences(cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength) {
        objectIDRangeStartMarshal := objectIDRangeStart is VarRef ? "ptr*" : "ptr"
        cObjectIDRangeLengthMarshal := cObjectIDRangeLength is VarRef ? "uint*" : "ptr"

        result := ComCall(74, this, "uint", cSurvivingObjectIDRanges, objectIDRangeStartMarshal, objectIDRangeStart, cObjectIDRangeLengthMarshal, cObjectIDRangeLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GarbageCollectionFinished() {
        result := ComCall(75, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} finalizerFlags 
     * @param {Pointer} _objectID 
     * @returns {HRESULT} 
     */
    FinalizeableObjectQueued(finalizerFlags, _objectID) {
        result := ComCall(76, this, "uint", finalizerFlags, "ptr", _objectID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cRootRefs 
     * @param {Pointer<Pointer>} rootRefIds 
     * @param {Pointer<COR_PRF_GC_ROOT_KIND>} rootKinds 
     * @param {Pointer<COR_PRF_GC_ROOT_FLAGS>} rootFlags 
     * @param {Pointer<Pointer>} rootIds 
     * @returns {HRESULT} 
     */
    RootReferences2(cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds) {
        rootRefIdsMarshal := rootRefIds is VarRef ? "ptr*" : "ptr"
        rootKindsMarshal := rootKinds is VarRef ? "int*" : "ptr"
        rootFlagsMarshal := rootFlags is VarRef ? "int*" : "ptr"
        rootIdsMarshal := rootIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(77, this, "uint", cRootRefs, rootRefIdsMarshal, rootRefIds, rootKindsMarshal, rootKinds, rootFlagsMarshal, rootFlags, rootIdsMarshal, rootIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} handleId 
     * @param {Pointer} initialObjectId 
     * @returns {HRESULT} 
     */
    HandleCreated(handleId, initialObjectId) {
        result := ComCall(78, this, "ptr", handleId, "ptr", initialObjectId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} handleId 
     * @returns {HRESULT} 
     */
    HandleDestroyed(handleId) {
        result := ComCall(79, this, "ptr", handleId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerCallback2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ThreadNameChanged := CallbackCreate(GetMethod(implObj, "ThreadNameChanged"), flags, 4)
        this.vtbl.GarbageCollectionStarted := CallbackCreate(GetMethod(implObj, "GarbageCollectionStarted"), flags, 4)
        this.vtbl.SurvivingReferences := CallbackCreate(GetMethod(implObj, "SurvivingReferences"), flags, 4)
        this.vtbl.GarbageCollectionFinished := CallbackCreate(GetMethod(implObj, "GarbageCollectionFinished"), flags, 1)
        this.vtbl.FinalizeableObjectQueued := CallbackCreate(GetMethod(implObj, "FinalizeableObjectQueued"), flags, 3)
        this.vtbl.RootReferences2 := CallbackCreate(GetMethod(implObj, "RootReferences2"), flags, 6)
        this.vtbl.HandleCreated := CallbackCreate(GetMethod(implObj, "HandleCreated"), flags, 3)
        this.vtbl.HandleDestroyed := CallbackCreate(GetMethod(implObj, "HandleDestroyed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ThreadNameChanged)
        CallbackFree(this.vtbl.GarbageCollectionStarted)
        CallbackFree(this.vtbl.SurvivingReferences)
        CallbackFree(this.vtbl.GarbageCollectionFinished)
        CallbackFree(this.vtbl.FinalizeableObjectQueued)
        CallbackFree(this.vtbl.RootReferences2)
        CallbackFree(this.vtbl.HandleCreated)
        CallbackFree(this.vtbl.HandleDestroyed)
    }
}
