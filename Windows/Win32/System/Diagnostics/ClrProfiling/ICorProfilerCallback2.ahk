#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback2 extends ICorProfilerCallback{
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
     * 
     * @param {Pointer} threadId 
     * @param {Integer} cchName 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     */
    ThreadNameChanged(threadId, cchName, name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(72, this, "ptr", threadId, "uint", cchName, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cGenerations 
     * @param {Pointer<BOOL>} generationCollected 
     * @param {Integer} reason 
     * @returns {HRESULT} 
     */
    GarbageCollectionStarted(cGenerations, generationCollected, reason) {
        result := ComCall(73, this, "int", cGenerations, "ptr", generationCollected, "int", reason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cSurvivingObjectIDRanges 
     * @param {Pointer<UIntPtr>} objectIDRangeStart 
     * @param {Pointer<UInt32>} cObjectIDRangeLength 
     * @returns {HRESULT} 
     */
    SurvivingReferences(cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength) {
        result := ComCall(74, this, "uint", cSurvivingObjectIDRanges, "ptr*", objectIDRangeStart, "uint*", cObjectIDRangeLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GarbageCollectionFinished() {
        result := ComCall(75, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} finalizerFlags 
     * @param {Pointer} objectID 
     * @returns {HRESULT} 
     */
    FinalizeableObjectQueued(finalizerFlags, objectID) {
        result := ComCall(76, this, "uint", finalizerFlags, "ptr", objectID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cRootRefs 
     * @param {Pointer<UIntPtr>} rootRefIds 
     * @param {Pointer<Int32>} rootKinds 
     * @param {Pointer<Int32>} rootFlags 
     * @param {Pointer<UIntPtr>} rootIds 
     * @returns {HRESULT} 
     */
    RootReferences2(cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds) {
        result := ComCall(77, this, "uint", cRootRefs, "ptr*", rootRefIds, "int*", rootKinds, "int*", rootFlags, "ptr*", rootIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} handleId 
     * @param {Pointer} initialObjectId 
     * @returns {HRESULT} 
     */
    HandleCreated(handleId, initialObjectId) {
        result := ComCall(78, this, "ptr", handleId, "ptr", initialObjectId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} handleId 
     * @returns {HRESULT} 
     */
    HandleDestroyed(handleId) {
        result := ComCall(79, this, "ptr", handleId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
