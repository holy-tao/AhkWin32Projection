#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo13.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo14 extends ICorProfilerInfo13{
    /**
     * The interface identifier for ICorProfilerInfo14
     * @type {Guid}
     */
    static IID => Guid("{f460e352-d76d-4fe9-835f-f6af9d6e862d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 111

    /**
     * 
     * @param {Pointer<ICorProfilerObjectEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateNonGCObjects(ppEnum) {
        result := ComCall(111, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cObjectRanges 
     * @param {Pointer<UInt32>} pcObjectRanges 
     * @param {Pointer<COR_PRF_NONGC_HEAP_RANGE>} ranges 
     * @returns {HRESULT} 
     */
    GetNonGCHeapBounds(cObjectRanges, pcObjectRanges, ranges) {
        result := ComCall(112, this, "uint", cObjectRanges, "uint*", pcObjectRanges, "ptr", ranges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} providerName 
     * @param {Pointer<EventPipeProviderCallback>} pCallback 
     * @param {Pointer<UIntPtr>} pProvider 
     * @returns {HRESULT} 
     */
    EventPipeCreateProvider2(providerName, pCallback, pProvider) {
        providerName := providerName is String ? StrPtr(providerName) : providerName

        result := ComCall(113, this, "ptr", providerName, "ptr", pCallback, "ptr*", pProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
