#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback3.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback4 extends ICorProfilerCallback3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerCallback4
     * @type {Guid}
     */
    static IID => Guid("{7b63b2e3-107d-4d48-b2f6-f61e229470d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 83

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReJITCompilationStarted", "GetReJITParameters", "ReJITCompilationFinished", "ReJITError", "MovedReferences2", "SurvivingReferences2"]

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} rejitId 
     * @param {BOOL} fIsSafeToBlock 
     * @returns {HRESULT} 
     */
    ReJITCompilationStarted(functionId, rejitId, fIsSafeToBlock) {
        result := ComCall(83, this, "ptr", functionId, "ptr", rejitId, "int", fIsSafeToBlock, "HRESULT")
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
        result := ComCall(85, this, "ptr", functionId, "ptr", rejitId, "int", hrStatus, "int", fIsSafeToBlock, "HRESULT")
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
}
