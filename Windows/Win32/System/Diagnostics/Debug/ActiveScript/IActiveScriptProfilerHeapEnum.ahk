#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerHeapEnum extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptProfilerHeapEnum
     * @type {Guid}
     */
    static IID => Guid("{32e4694e-0d37-419b-b93d-fa20ded6e8ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "GetOptionalInfo", "FreeObjectAndOptionalInfo", "GetNameIdMap"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Pointer<PROFILER_HEAP_OBJECT>>} heapObjects 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, heapObjects, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", heapObjects, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROFILER_HEAP_OBJECT>} heapObject 
     * @param {Integer} celt 
     * @param {Pointer<PROFILER_HEAP_OBJECT_OPTIONAL_INFO>} optionalInfo 
     * @returns {HRESULT} 
     */
    GetOptionalInfo(heapObject, celt, optionalInfo) {
        result := ComCall(4, this, "ptr", heapObject, "uint", celt, "ptr", optionalInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Pointer<PROFILER_HEAP_OBJECT>>} heapObjects 
     * @returns {HRESULT} 
     */
    FreeObjectAndOptionalInfo(celt, heapObjects) {
        result := ComCall(5, this, "uint", celt, "ptr*", heapObjects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Pointer<PWSTR>>>} pNameList 
     * @param {Pointer<Integer>} pcelt 
     * @returns {HRESULT} 
     */
    GetNameIdMap(pNameList, pcelt) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr*", pNameList, pceltMarshal, pcelt, "HRESULT")
        return result
    }
}
