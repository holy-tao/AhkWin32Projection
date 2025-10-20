#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo2 extends ICorProfilerInfo{
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
     * 
     * @param {Pointer} thread 
     * @param {Pointer<StackSnapshotCallback>} callback 
     * @param {Integer} infoFlags 
     * @param {Pointer<Void>} clientData 
     * @param {Pointer<Byte>} context 
     * @param {Integer} contextSize 
     * @returns {HRESULT} 
     */
    DoStackSnapshot(thread, callback, infoFlags, clientData, context, contextSize) {
        result := ComCall(36, this, "ptr", thread, "ptr", callback, "uint", infoFlags, "ptr", clientData, "char*", context, "uint", contextSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FunctionEnter2>} pFuncEnter 
     * @param {Pointer<FunctionLeave2>} pFuncLeave 
     * @param {Pointer<FunctionTailcall2>} pFuncTailcall 
     * @returns {HRESULT} 
     */
    SetEnterLeaveFunctionHooks2(pFuncEnter, pFuncLeave, pFuncTailcall) {
        result := ComCall(37, this, "ptr", pFuncEnter, "ptr", pFuncLeave, "ptr", pFuncTailcall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} funcId 
     * @param {Pointer} frameInfo 
     * @param {Pointer<UIntPtr>} pClassId 
     * @param {Pointer<UIntPtr>} pModuleId 
     * @param {Pointer<UInt32>} pToken 
     * @param {Integer} cTypeArgs 
     * @param {Pointer<UInt32>} pcTypeArgs 
     * @param {Pointer<UIntPtr>} typeArgs 
     * @returns {HRESULT} 
     */
    GetFunctionInfo2(funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs) {
        result := ComCall(38, this, "ptr", funcId, "ptr", frameInfo, "ptr*", pClassId, "ptr*", pModuleId, "uint*", pToken, "uint", cTypeArgs, "uint*", pcTypeArgs, "ptr*", typeArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pBufferLengthOffset 
     * @param {Pointer<UInt32>} pStringLengthOffset 
     * @param {Pointer<UInt32>} pBufferOffset 
     * @returns {HRESULT} 
     */
    GetStringLayout(pBufferLengthOffset, pStringLengthOffset, pBufferOffset) {
        result := ComCall(39, this, "uint*", pBufferLengthOffset, "uint*", pStringLengthOffset, "uint*", pBufferOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classID 
     * @param {Pointer<COR_FIELD_OFFSET>} rFieldOffset 
     * @param {Integer} cFieldOffset 
     * @param {Pointer<UInt32>} pcFieldOffset 
     * @param {Pointer<UInt32>} pulClassSize 
     * @returns {HRESULT} 
     */
    GetClassLayout(classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize) {
        result := ComCall(40, this, "ptr", classID, "ptr", rFieldOffset, "uint", cFieldOffset, "uint*", pcFieldOffset, "uint*", pulClassSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<UIntPtr>} pModuleId 
     * @param {Pointer<UInt32>} pTypeDefToken 
     * @param {Pointer<UIntPtr>} pParentClassId 
     * @param {Integer} cNumTypeArgs 
     * @param {Pointer<UInt32>} pcNumTypeArgs 
     * @param {Pointer<UIntPtr>} typeArgs 
     * @returns {HRESULT} 
     */
    GetClassIDInfo2(classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs) {
        result := ComCall(41, this, "ptr", classId, "ptr*", pModuleId, "uint*", pTypeDefToken, "ptr*", pParentClassId, "uint", cNumTypeArgs, "uint*", pcNumTypeArgs, "ptr*", typeArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionID 
     * @param {Integer} cCodeInfos 
     * @param {Pointer<UInt32>} pcCodeInfos 
     * @param {Pointer<COR_PRF_CODE_INFO>} codeInfos 
     * @returns {HRESULT} 
     */
    GetCodeInfo2(functionID, cCodeInfos, pcCodeInfos, codeInfos) {
        result := ComCall(42, this, "ptr", functionID, "uint", cCodeInfos, "uint*", pcCodeInfos, "ptr", codeInfos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @param {Integer} typeDef 
     * @param {Integer} cTypeArgs 
     * @param {Pointer<UIntPtr>} typeArgs 
     * @param {Pointer<UIntPtr>} pClassID 
     * @returns {HRESULT} 
     */
    GetClassFromTokenAndTypeArgs(moduleID, typeDef, cTypeArgs, typeArgs, pClassID) {
        result := ComCall(43, this, "ptr", moduleID, "uint", typeDef, "uint", cTypeArgs, "ptr*", typeArgs, "ptr*", pClassID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @param {Integer} funcDef 
     * @param {Pointer} classId 
     * @param {Integer} cTypeArgs 
     * @param {Pointer<UIntPtr>} typeArgs 
     * @param {Pointer<UIntPtr>} pFunctionID 
     * @returns {HRESULT} 
     */
    GetFunctionFromTokenAndTypeArgs(moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID) {
        result := ComCall(44, this, "ptr", moduleID, "uint", funcDef, "ptr", classId, "uint", cTypeArgs, "ptr*", typeArgs, "ptr*", pFunctionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @param {Pointer<ICorProfilerObjectEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumModuleFrozenObjects(moduleID, ppEnum) {
        result := ComCall(45, this, "ptr", moduleID, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Integer} cDimensions 
     * @param {Pointer<UInt32>} pDimensionSizes 
     * @param {Pointer<Int32>} pDimensionLowerBounds 
     * @param {Pointer<Byte>} ppData 
     * @returns {HRESULT} 
     */
    GetArrayObjectInfo(objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData) {
        result := ComCall(46, this, "ptr", objectId, "uint", cDimensions, "uint*", pDimensionSizes, "int*", pDimensionLowerBounds, "char*", ppData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<UInt32>} pBufferOffset 
     * @returns {HRESULT} 
     */
    GetBoxClassLayout(classId, pBufferOffset) {
        result := ComCall(47, this, "ptr", classId, "uint*", pBufferOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @param {Pointer<UIntPtr>} pAppDomainId 
     * @returns {HRESULT} 
     */
    GetThreadAppDomain(threadId, pAppDomainId) {
        result := ComCall(48, this, "ptr", threadId, "ptr*", pAppDomainId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer<Void>} ppAddress 
     * @returns {HRESULT} 
     */
    GetRVAStaticAddress(classId, fieldToken, ppAddress) {
        result := ComCall(49, this, "ptr", classId, "uint", fieldToken, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} appDomainId 
     * @param {Pointer<Void>} ppAddress 
     * @returns {HRESULT} 
     */
    GetAppDomainStaticAddress(classId, fieldToken, appDomainId, ppAddress) {
        result := ComCall(50, this, "ptr", classId, "uint", fieldToken, "ptr", appDomainId, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} threadId 
     * @param {Pointer<Void>} ppAddress 
     * @returns {HRESULT} 
     */
    GetThreadStaticAddress(classId, fieldToken, threadId, ppAddress) {
        result := ComCall(51, this, "ptr", classId, "uint", fieldToken, "ptr", threadId, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} contextId 
     * @param {Pointer<Void>} ppAddress 
     * @returns {HRESULT} 
     */
    GetContextStaticAddress(classId, fieldToken, contextId, ppAddress) {
        result := ComCall(52, this, "ptr", classId, "uint", fieldToken, "ptr", contextId, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer<Int32>} pFieldInfo 
     * @returns {HRESULT} 
     */
    GetStaticFieldInfo(classId, fieldToken, pFieldInfo) {
        result := ComCall(53, this, "ptr", classId, "uint", fieldToken, "int*", pFieldInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cObjectRanges 
     * @param {Pointer<UInt32>} pcObjectRanges 
     * @param {Pointer<COR_PRF_GC_GENERATION_RANGE>} ranges 
     * @returns {HRESULT} 
     */
    GetGenerationBounds(cObjectRanges, pcObjectRanges, ranges) {
        result := ComCall(54, this, "uint", cObjectRanges, "uint*", pcObjectRanges, "ptr", ranges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer<COR_PRF_GC_GENERATION_RANGE>} range 
     * @returns {HRESULT} 
     */
    GetObjectGeneration(objectId, range) {
        result := ComCall(55, this, "ptr", objectId, "ptr", range, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COR_PRF_EX_CLAUSE_INFO>} pinfo 
     * @returns {HRESULT} 
     */
    GetNotifiedExceptionClauseInfo(pinfo) {
        result := ComCall(56, this, "ptr", pinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
