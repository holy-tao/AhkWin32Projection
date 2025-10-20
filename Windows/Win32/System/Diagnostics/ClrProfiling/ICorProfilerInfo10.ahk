#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo9.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo10 extends ICorProfilerInfo9{
    /**
     * The interface identifier for ICorProfilerInfo10
     * @type {Guid}
     */
    static IID => Guid("{2f1b5152-c869-40c9-aa5f-3abe026bd720}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 93

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<ObjectReferenceCallback>} callback 
     * @param {Pointer<Void>} clientData 
     * @returns {HRESULT} 
     */
    EnumerateObjectReferences(objectId, callback, clientData) {
        result := ComCall(93, this, "ptr", objectId, "ptr", callback, "ptr", clientData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<BOOL>} pbFrozen 
     * @returns {HRESULT} 
     */
    IsFrozenObject(objectId, pbFrozen) {
        result := ComCall(94, this, "ptr", objectId, "ptr", pbFrozen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pThreshold 
     * @returns {HRESULT} 
     */
    GetLOHObjectSizeThreshold(pThreshold) {
        result := ComCall(95, this, "uint*", pThreshold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRejitFlags 
     * @param {Integer} cFunctions 
     * @param {Pointer<UIntPtr>} moduleIds 
     * @param {Pointer<UInt32>} methodIds 
     * @returns {HRESULT} 
     */
    RequestReJITWithInliners(dwRejitFlags, cFunctions, moduleIds, methodIds) {
        result := ComCall(96, this, "uint", dwRejitFlags, "uint", cFunctions, "ptr*", moduleIds, "uint*", methodIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspendRuntime() {
        result := ComCall(97, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResumeRuntime() {
        result := ComCall(98, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
