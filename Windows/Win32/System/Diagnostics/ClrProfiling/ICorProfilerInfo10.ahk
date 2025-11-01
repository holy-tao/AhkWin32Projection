#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo9.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo10 extends ICorProfilerInfo9{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateObjectReferences", "IsFrozenObject", "GetLOHObjectSizeThreshold", "RequestReJITWithInliners", "SuspendRuntime", "ResumeRuntime"]

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<ObjectReferenceCallback>} callback 
     * @param {Pointer<Void>} clientData 
     * @returns {HRESULT} 
     */
    EnumerateObjectReferences(objectId, callback, clientData) {
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

        result := ComCall(93, this, "ptr", objectId, "ptr", callback, clientDataMarshal, clientData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<BOOL>} pbFrozen 
     * @returns {HRESULT} 
     */
    IsFrozenObject(objectId, pbFrozen) {
        result := ComCall(94, this, "ptr", objectId, "ptr", pbFrozen, "HRESULT")
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
}
