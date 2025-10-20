#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo3.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo4 extends ICorProfilerInfo3{
    /**
     * The interface identifier for ICorProfilerInfo4
     * @type {Guid}
     */
    static IID => Guid("{0d8fdcaa-6257-47bf-b1bf-94dac88466ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 71

    /**
     * 
     * @param {Pointer<ICorProfilerThreadEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumThreads(ppEnum) {
        result := ComCall(71, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeCurrentThread() {
        result := ComCall(72, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cFunctions 
     * @param {Pointer<UIntPtr>} moduleIds 
     * @param {Pointer<UInt32>} methodIds 
     * @returns {HRESULT} 
     */
    RequestReJIT(cFunctions, moduleIds, methodIds) {
        result := ComCall(73, this, "uint", cFunctions, "ptr*", moduleIds, "uint*", methodIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cFunctions 
     * @param {Pointer<UIntPtr>} moduleIds 
     * @param {Pointer<UInt32>} methodIds 
     * @param {Pointer<HRESULT>} status 
     * @returns {HRESULT} 
     */
    RequestRevert(cFunctions, moduleIds, methodIds, status) {
        result := ComCall(74, this, "uint", cFunctions, "ptr*", moduleIds, "uint*", methodIds, "ptr", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionID 
     * @param {Pointer} reJitId 
     * @param {Integer} cCodeInfos 
     * @param {Pointer<UInt32>} pcCodeInfos 
     * @param {Pointer<COR_PRF_CODE_INFO>} codeInfos 
     * @returns {HRESULT} 
     */
    GetCodeInfo3(functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos) {
        result := ComCall(75, this, "ptr", functionID, "ptr", reJitId, "uint", cCodeInfos, "uint*", pcCodeInfos, "ptr", codeInfos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ip 
     * @param {Pointer<UIntPtr>} pFunctionId 
     * @param {Pointer<UIntPtr>} pReJitId 
     * @returns {HRESULT} 
     */
    GetFunctionFromIP2(ip, pFunctionId, pReJitId) {
        result := ComCall(76, this, "char*", ip, "ptr*", pFunctionId, "ptr*", pReJitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Integer} cReJitIds 
     * @param {Pointer<UInt32>} pcReJitIds 
     * @param {Pointer<UIntPtr>} reJitIds 
     * @returns {HRESULT} 
     */
    GetReJITIDs(functionId, cReJitIds, pcReJitIds, reJitIds) {
        result := ComCall(77, this, "ptr", functionId, "uint", cReJitIds, "uint*", pcReJitIds, "ptr*", reJitIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} reJitId 
     * @param {Integer} cMap 
     * @param {Pointer<UInt32>} pcMap 
     * @param {Pointer<COR_DEBUG_IL_TO_NATIVE_MAP>} map 
     * @returns {HRESULT} 
     */
    GetILToNativeMapping2(functionId, reJitId, cMap, pcMap, map) {
        result := ComCall(78, this, "ptr", functionId, "ptr", reJitId, "uint", cMap, "uint*", pcMap, "ptr", map, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICorProfilerFunctionEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumJITedFunctions2(ppEnum) {
        result := ComCall(79, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<UIntPtr>} pcSize 
     * @returns {HRESULT} 
     */
    GetObjectSize2(objectId, pcSize) {
        result := ComCall(80, this, "ptr", objectId, "ptr*", pcSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
