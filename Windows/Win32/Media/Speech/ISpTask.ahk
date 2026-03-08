#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTask extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Execute"]

    /**
     * Calls the DsReplicaConsistencyCheck function, which invokes the Knowledge Consistency Checker (KCC) to verify the replication topology.
     * @param {Pointer<Void>} pvTaskData 
     * @param {Pointer<Integer>} pfContinueProcessing 
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/AD/executekcc-msad-domaincontroller
     */
    Execute(pvTaskData, pfContinueProcessing) {
        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"
        pfContinueProcessingMarshal := pfContinueProcessing is VarRef ? "int*" : "ptr"

        result := ComCall(0, this, pvTaskDataMarshal, pvTaskData, pfContinueProcessingMarshal, pfContinueProcessing, "HRESULT")
        return result
    }
}
