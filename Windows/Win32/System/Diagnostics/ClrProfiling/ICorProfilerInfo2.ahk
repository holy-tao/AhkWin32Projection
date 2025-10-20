#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo2 extends ICorProfilerInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerInfo2
     * @type {Guid}
     */
    static IID => Guid("{cc0935cd-a518-487d-b0bb-a93214e65478}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 36

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DoStackSnapshot", "SetEnterLeaveFunctionHooks2", "GetFunctionInfo2", "GetStringLayout", "GetClassLayout", "GetClassIDInfo2", "GetCodeInfo2", "GetClassFromTokenAndTypeArgs", "GetFunctionFromTokenAndTypeArgs", "EnumModuleFrozenObjects", "GetArrayObjectInfo", "GetBoxClassLayout", "GetThreadAppDomain", "GetRVAStaticAddress", "GetAppDomainStaticAddress", "GetThreadStaticAddress", "GetContextStaticAddress", "GetStaticFieldInfo", "GetGenerationBounds", "GetObjectGeneration", "GetNotifiedExceptionClauseInfo"]

    /**
     * 
     * @param {Pointer} thread 
     * @param {Pointer<Pointer<StackSnapshotCallback>>} callback 
     * @param {Integer} infoFlags 
     * @param {Pointer<Void>} clientData 
     * @param {Pointer<Integer>} context 
     * @param {Integer} contextSize 
     * @returns {HRESULT} 
     */
    DoStackSnapshot(thread, callback, infoFlags, clientData, context, contextSize) {
        result := ComCall(36, this, "ptr", thread, "ptr*", callback, "uint", infoFlags, "ptr", clientData, "char*", context, "uint", contextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<FunctionEnter2>>} pFuncEnter 
     * @param {Pointer<Pointer<FunctionLeave2>>} pFuncLeave 
     * @param {Pointer<Pointer<FunctionTailcall2>>} pFuncTailcall 
     * @returns {HRESULT} 
     */
    SetEnterLeaveFunctionHooks2(pFuncEnter, pFuncLeave, pFuncTailcall) {
        result := ComCall(37, this, "ptr*", pFuncEnter, "ptr*", pFuncLeave, "ptr*", pFuncTailcall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} funcId 
     * @param {Pointer} frameInfo 
     * @param {Pointer<Pointer>} pClassId 
     * @param {Pointer<Pointer>} pModuleId 
     * @param {Pointer<Integer>} pToken 
     * @param {Integer} cTypeArgs 
     * @param {Pointer<Integer>} pcTypeArgs 
     * @param {Pointer<Pointer>} typeArgs 
     * @returns {HRESULT} 
     */
    GetFunctionInfo2(funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs) {
        result := ComCall(38, this, "ptr", funcId, "ptr", frameInfo, "ptr*", pClassId, "ptr*", pModuleId, "uint*", pToken, "uint", cTypeArgs, "uint*", pcTypeArgs, "ptr*", typeArgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBufferLengthOffset 
     * @param {Pointer<Integer>} pStringLengthOffset 
     * @param {Pointer<Integer>} pBufferOffset 
     * @returns {HRESULT} 
     */
    GetStringLayout(pBufferLengthOffset, pStringLengthOffset, pBufferOffset) {
        result := ComCall(39, this, "uint*", pBufferLengthOffset, "uint*", pStringLengthOffset, "uint*", pBufferOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classID 
     * @param {Pointer<COR_FIELD_OFFSET>} rFieldOffset 
     * @param {Integer} cFieldOffset 
     * @param {Pointer<Integer>} pcFieldOffset 
     * @param {Pointer<Integer>} pulClassSize 
     * @returns {HRESULT} 
     */
    GetClassLayout(classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize) {
        result := ComCall(40, this, "ptr", classID, "ptr", rFieldOffset, "uint", cFieldOffset, "uint*", pcFieldOffset, "uint*", pulClassSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<Pointer>} pModuleId 
     * @param {Pointer<Integer>} pTypeDefToken 
     * @param {Pointer<Pointer>} pParentClassId 
     * @param {Integer} cNumTypeArgs 
     * @param {Pointer<Integer>} pcNumTypeArgs 
     * @param {Pointer<Pointer>} typeArgs 
     * @returns {HRESULT} 
     */
    GetClassIDInfo2(classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs) {
        result := ComCall(41, this, "ptr", classId, "ptr*", pModuleId, "uint*", pTypeDefToken, "ptr*", pParentClassId, "uint", cNumTypeArgs, "uint*", pcNumTypeArgs, "ptr*", typeArgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionID 
     * @param {Integer} cCodeInfos 
     * @param {Pointer<Integer>} pcCodeInfos 
     * @param {Pointer<COR_PRF_CODE_INFO>} codeInfos 
     * @returns {HRESULT} 
     */
    GetCodeInfo2(functionID, cCodeInfos, pcCodeInfos, codeInfos) {
        result := ComCall(42, this, "ptr", functionID, "uint", cCodeInfos, "uint*", pcCodeInfos, "ptr", codeInfos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @param {Integer} typeDef 
     * @param {Integer} cTypeArgs 
     * @param {Pointer<Pointer>} typeArgs 
     * @param {Pointer<Pointer>} pClassID 
     * @returns {HRESULT} 
     */
    GetClassFromTokenAndTypeArgs(moduleID, typeDef, cTypeArgs, typeArgs, pClassID) {
        result := ComCall(43, this, "ptr", moduleID, "uint", typeDef, "uint", cTypeArgs, "ptr*", typeArgs, "ptr*", pClassID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @param {Integer} funcDef 
     * @param {Pointer} classId 
     * @param {Integer} cTypeArgs 
     * @param {Pointer<Pointer>} typeArgs 
     * @param {Pointer<Pointer>} pFunctionID 
     * @returns {HRESULT} 
     */
    GetFunctionFromTokenAndTypeArgs(moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID) {
        result := ComCall(44, this, "ptr", moduleID, "uint", funcDef, "ptr", classId, "uint", cTypeArgs, "ptr*", typeArgs, "ptr*", pFunctionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @param {Pointer<ICorProfilerObjectEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumModuleFrozenObjects(moduleID, ppEnum) {
        result := ComCall(45, this, "ptr", moduleID, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Integer} cDimensions 
     * @param {Pointer<Integer>} pDimensionSizes 
     * @param {Pointer<Integer>} pDimensionLowerBounds 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @returns {HRESULT} 
     */
    GetArrayObjectInfo(objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData) {
        result := ComCall(46, this, "ptr", objectId, "uint", cDimensions, "uint*", pDimensionSizes, "int*", pDimensionLowerBounds, "ptr*", ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<Integer>} pBufferOffset 
     * @returns {HRESULT} 
     */
    GetBoxClassLayout(classId, pBufferOffset) {
        result := ComCall(47, this, "ptr", classId, "uint*", pBufferOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @param {Pointer<Pointer>} pAppDomainId 
     * @returns {HRESULT} 
     */
    GetThreadAppDomain(threadId, pAppDomainId) {
        result := ComCall(48, this, "ptr", threadId, "ptr*", pAppDomainId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer<Pointer<Void>>} ppAddress 
     * @returns {HRESULT} 
     */
    GetRVAStaticAddress(classId, fieldToken, ppAddress) {
        result := ComCall(49, this, "ptr", classId, "uint", fieldToken, "ptr*", ppAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} appDomainId 
     * @param {Pointer<Pointer<Void>>} ppAddress 
     * @returns {HRESULT} 
     */
    GetAppDomainStaticAddress(classId, fieldToken, appDomainId, ppAddress) {
        result := ComCall(50, this, "ptr", classId, "uint", fieldToken, "ptr", appDomainId, "ptr*", ppAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} threadId 
     * @param {Pointer<Pointer<Void>>} ppAddress 
     * @returns {HRESULT} 
     */
    GetThreadStaticAddress(classId, fieldToken, threadId, ppAddress) {
        result := ComCall(51, this, "ptr", classId, "uint", fieldToken, "ptr", threadId, "ptr*", ppAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} contextId 
     * @param {Pointer<Pointer<Void>>} ppAddress 
     * @returns {HRESULT} 
     */
    GetContextStaticAddress(classId, fieldToken, contextId, ppAddress) {
        result := ComCall(52, this, "ptr", classId, "uint", fieldToken, "ptr", contextId, "ptr*", ppAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer<Integer>} pFieldInfo 
     * @returns {HRESULT} 
     */
    GetStaticFieldInfo(classId, fieldToken, pFieldInfo) {
        result := ComCall(53, this, "ptr", classId, "uint", fieldToken, "int*", pFieldInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cObjectRanges 
     * @param {Pointer<Integer>} pcObjectRanges 
     * @param {Pointer<COR_PRF_GC_GENERATION_RANGE>} ranges 
     * @returns {HRESULT} 
     */
    GetGenerationBounds(cObjectRanges, pcObjectRanges, ranges) {
        result := ComCall(54, this, "uint", cObjectRanges, "uint*", pcObjectRanges, "ptr", ranges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<COR_PRF_GC_GENERATION_RANGE>} range 
     * @returns {HRESULT} 
     */
    GetObjectGeneration(objectId, range) {
        result := ComCall(55, this, "ptr", objectId, "ptr", range, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COR_PRF_EX_CLAUSE_INFO>} pinfo 
     * @returns {HRESULT} 
     */
    GetNotifiedExceptionClauseInfo(pinfo) {
        result := ComCall(56, this, "ptr", pinfo, "HRESULT")
        return result
    }
}
