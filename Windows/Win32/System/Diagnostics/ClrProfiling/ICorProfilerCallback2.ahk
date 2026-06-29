#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\COR_PRF_GC_ROOT_FLAGS.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\COR_PRF_GC_ROOT_KIND.ahk
#Include .\ICorProfilerCallback.ahk
#Include .\COR_PRF_GC_REASON.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include ..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class ICorProfilerCallback2 extends ICorProfilerCallback {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerCallback2
     * @type {Guid}
     */
    static IID => Guid("{8a8cc829-ccf2-49fe-bbae-0f022228071a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 72

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ThreadNameChanged", "GarbageCollectionStarted", "SurvivingReferences", "GarbageCollectionFinished", "FinalizeableObjectQueued", "RootReferences2", "HandleCreated", "HandleDestroyed"]

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

        result := ComCall(73, this, "int", cGenerations, generationCollectedMarshal, generationCollected, "int", reason, "HRESULT")
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
}
