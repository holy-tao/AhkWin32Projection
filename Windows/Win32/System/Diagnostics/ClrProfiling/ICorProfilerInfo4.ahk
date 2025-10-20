#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo3.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo4 extends ICorProfilerInfo3{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumThreads", "InitializeCurrentThread", "RequestReJIT", "RequestRevert", "GetCodeInfo3", "GetFunctionFromIP2", "GetReJITIDs", "GetILToNativeMapping2", "EnumJITedFunctions2", "GetObjectSize2"]

    /**
     * 
     * @param {Pointer<ICorProfilerThreadEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumThreads(ppEnum) {
        result := ComCall(71, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeCurrentThread() {
        result := ComCall(72, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cFunctions 
     * @param {Pointer<Pointer>} moduleIds 
     * @param {Pointer<Integer>} methodIds 
     * @returns {HRESULT} 
     */
    RequestReJIT(cFunctions, moduleIds, methodIds) {
        result := ComCall(73, this, "uint", cFunctions, "ptr*", moduleIds, "uint*", methodIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cFunctions 
     * @param {Pointer<Pointer>} moduleIds 
     * @param {Pointer<Integer>} methodIds 
     * @param {Pointer<HRESULT>} status 
     * @returns {HRESULT} 
     */
    RequestRevert(cFunctions, moduleIds, methodIds, status) {
        result := ComCall(74, this, "uint", cFunctions, "ptr*", moduleIds, "uint*", methodIds, "ptr", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionID 
     * @param {Pointer} reJitId 
     * @param {Integer} cCodeInfos 
     * @param {Pointer<Integer>} pcCodeInfos 
     * @param {Pointer<COR_PRF_CODE_INFO>} codeInfos 
     * @returns {HRESULT} 
     */
    GetCodeInfo3(functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos) {
        result := ComCall(75, this, "ptr", functionID, "ptr", reJitId, "uint", cCodeInfos, "uint*", pcCodeInfos, "ptr", codeInfos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ip 
     * @param {Pointer<Pointer>} pFunctionId 
     * @param {Pointer<Pointer>} pReJitId 
     * @returns {HRESULT} 
     */
    GetFunctionFromIP2(ip, pFunctionId, pReJitId) {
        result := ComCall(76, this, "char*", ip, "ptr*", pFunctionId, "ptr*", pReJitId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Integer} cReJitIds 
     * @param {Pointer<Integer>} pcReJitIds 
     * @param {Pointer<Pointer>} reJitIds 
     * @returns {HRESULT} 
     */
    GetReJITIDs(functionId, cReJitIds, pcReJitIds, reJitIds) {
        result := ComCall(77, this, "ptr", functionId, "uint", cReJitIds, "uint*", pcReJitIds, "ptr*", reJitIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} reJitId 
     * @param {Integer} cMap 
     * @param {Pointer<Integer>} pcMap 
     * @param {Pointer<COR_DEBUG_IL_TO_NATIVE_MAP>} map 
     * @returns {HRESULT} 
     */
    GetILToNativeMapping2(functionId, reJitId, cMap, pcMap, map) {
        result := ComCall(78, this, "ptr", functionId, "ptr", reJitId, "uint", cMap, "uint*", pcMap, "ptr", map, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICorProfilerFunctionEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumJITedFunctions2(ppEnum) {
        result := ComCall(79, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<Pointer>} pcSize 
     * @returns {HRESULT} 
     */
    GetObjectSize2(objectId, pcSize) {
        result := ComCall(80, this, "ptr", objectId, "ptr*", pcSize, "HRESULT")
        return result
    }
}
