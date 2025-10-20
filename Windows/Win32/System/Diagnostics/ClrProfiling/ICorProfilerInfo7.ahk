#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo6.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo7 extends ICorProfilerInfo6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerInfo7
     * @type {Guid}
     */
    static IID => Guid("{9aeecc0d-63e0-4187-8c00-e312f503f663}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 84

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ApplyMetaData", "GetInMemorySymbolsLength", "ReadInMemorySymbols"]

    /**
     * 
     * @param {Pointer} moduleId 
     * @returns {HRESULT} 
     */
    ApplyMetaData(moduleId) {
        result := ComCall(84, this, "ptr", moduleId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Pointer<Integer>} pCountSymbolBytes 
     * @returns {HRESULT} 
     */
    GetInMemorySymbolsLength(moduleId, pCountSymbolBytes) {
        result := ComCall(85, this, "ptr", moduleId, "uint*", pCountSymbolBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} symbolsReadOffset 
     * @param {Pointer<Integer>} pSymbolBytes 
     * @param {Integer} countSymbolBytes 
     * @param {Pointer<Integer>} pCountSymbolBytesRead 
     * @returns {HRESULT} 
     */
    ReadInMemorySymbols(moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead) {
        result := ComCall(86, this, "ptr", moduleId, "uint", symbolsReadOffset, "char*", pSymbolBytes, "uint", countSymbolBytes, "uint*", pCountSymbolBytesRead, "HRESULT")
        return result
    }
}
