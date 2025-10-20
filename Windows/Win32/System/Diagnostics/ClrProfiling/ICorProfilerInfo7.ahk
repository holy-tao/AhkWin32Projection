#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo6.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo7 extends ICorProfilerInfo6{
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
     * 
     * @param {Pointer} moduleId 
     * @returns {HRESULT} 
     */
    ApplyMetaData(moduleId) {
        result := ComCall(84, this, "ptr", moduleId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Pointer<UInt32>} pCountSymbolBytes 
     * @returns {HRESULT} 
     */
    GetInMemorySymbolsLength(moduleId, pCountSymbolBytes) {
        result := ComCall(85, this, "ptr", moduleId, "uint*", pCountSymbolBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} symbolsReadOffset 
     * @param {Pointer<Byte>} pSymbolBytes 
     * @param {Integer} countSymbolBytes 
     * @param {Pointer<UInt32>} pCountSymbolBytesRead 
     * @returns {HRESULT} 
     */
    ReadInMemorySymbols(moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead) {
        result := ComCall(86, this, "ptr", moduleId, "uint", symbolsReadOffset, "char*", pSymbolBytes, "uint", countSymbolBytes, "uint*", pCountSymbolBytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
