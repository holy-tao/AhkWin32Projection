#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ICorProfilerFunctionControl.ahk" { ICorProfilerFunctionControl }
#Import ".\ICorProfilerCallback3.ahk" { ICorProfilerCallback3 }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback4 extends ICorProfilerCallback3 {
    /**
     * The interface identifier for ICorProfilerCallback4
     * @type {Guid}
     */
    static IID := Guid("{7b63b2e3-107d-4d48-b2f6-f61e229470d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback4 interfaces
    */
    struct Vtbl extends ICorProfilerCallback3.Vtbl {
        ReJITCompilationStarted  : IntPtr
        GetReJITParameters       : IntPtr
        ReJITCompilationFinished : IntPtr
        ReJITError               : IntPtr
        MovedReferences2         : IntPtr
        SurvivingReferences2     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} rejitId 
     * @param {BOOL} fIsSafeToBlock 
     * @returns {HRESULT} 
     */
    ReJITCompilationStarted(functionId, rejitId, fIsSafeToBlock) {
        result := ComCall(83, this, "ptr", functionId, "ptr", rejitId, BOOL, fIsSafeToBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} methodId 
     * @param {ICorProfilerFunctionControl} pFunctionControl 
     * @returns {HRESULT} 
     */
    GetReJITParameters(moduleId, methodId, pFunctionControl) {
        result := ComCall(84, this, "ptr", moduleId, "uint", methodId, "ptr", pFunctionControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} rejitId 
     * @param {HRESULT} hrStatus 
     * @param {BOOL} fIsSafeToBlock 
     * @returns {HRESULT} 
     */
    ReJITCompilationFinished(functionId, rejitId, hrStatus, fIsSafeToBlock) {
        result := ComCall(85, this, "ptr", functionId, "ptr", rejitId, "int", hrStatus, BOOL, fIsSafeToBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} methodId 
     * @param {Pointer} functionId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    ReJITError(moduleId, methodId, functionId, hrStatus) {
        result := ComCall(86, this, "ptr", moduleId, "uint", methodId, "ptr", functionId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cMovedObjectIDRanges 
     * @param {Pointer<Pointer>} oldObjectIDRangeStart 
     * @param {Pointer<Pointer>} newObjectIDRangeStart 
     * @param {Pointer<Pointer>} cObjectIDRangeLength 
     * @returns {HRESULT} 
     */
    MovedReferences2(cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength) {
        oldObjectIDRangeStartMarshal := oldObjectIDRangeStart is VarRef ? "ptr*" : "ptr"
        newObjectIDRangeStartMarshal := newObjectIDRangeStart is VarRef ? "ptr*" : "ptr"
        cObjectIDRangeLengthMarshal := cObjectIDRangeLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(87, this, "uint", cMovedObjectIDRanges, oldObjectIDRangeStartMarshal, oldObjectIDRangeStart, newObjectIDRangeStartMarshal, newObjectIDRangeStart, cObjectIDRangeLengthMarshal, cObjectIDRangeLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cSurvivingObjectIDRanges 
     * @param {Pointer<Pointer>} objectIDRangeStart 
     * @param {Pointer<Pointer>} cObjectIDRangeLength 
     * @returns {HRESULT} 
     */
    SurvivingReferences2(cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength) {
        objectIDRangeStartMarshal := objectIDRangeStart is VarRef ? "ptr*" : "ptr"
        cObjectIDRangeLengthMarshal := cObjectIDRangeLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(88, this, "uint", cSurvivingObjectIDRanges, objectIDRangeStartMarshal, objectIDRangeStart, cObjectIDRangeLengthMarshal, cObjectIDRangeLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerCallback4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReJITCompilationStarted := CallbackCreate(GetMethod(implObj, "ReJITCompilationStarted"), flags, 4)
        this.vtbl.GetReJITParameters := CallbackCreate(GetMethod(implObj, "GetReJITParameters"), flags, 4)
        this.vtbl.ReJITCompilationFinished := CallbackCreate(GetMethod(implObj, "ReJITCompilationFinished"), flags, 5)
        this.vtbl.ReJITError := CallbackCreate(GetMethod(implObj, "ReJITError"), flags, 5)
        this.vtbl.MovedReferences2 := CallbackCreate(GetMethod(implObj, "MovedReferences2"), flags, 5)
        this.vtbl.SurvivingReferences2 := CallbackCreate(GetMethod(implObj, "SurvivingReferences2"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReJITCompilationStarted)
        CallbackFree(this.vtbl.GetReJITParameters)
        CallbackFree(this.vtbl.ReJITCompilationFinished)
        CallbackFree(this.vtbl.ReJITError)
        CallbackFree(this.vtbl.MovedReferences2)
        CallbackFree(this.vtbl.SurvivingReferences2)
    }
}
