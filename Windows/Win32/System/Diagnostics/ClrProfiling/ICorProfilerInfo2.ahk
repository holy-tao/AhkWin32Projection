#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerObjectEnum.ahk
#Include .\COR_PRF_GC_GENERATION_RANGE.ahk
#Include .\COR_PRF_EX_CLAUSE_INFO.ahk
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
     * @param {Pointer<Integer>} context_ 
     * @param {Integer} contextSize 
     * @returns {HRESULT} 
     */
    DoStackSnapshot(thread, callback, infoFlags, clientData, context_, contextSize) {
        callbackMarshal := callback is VarRef ? "ptr*" : "ptr"
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"
        context_Marshal := context_ is VarRef ? "char*" : "ptr"

        result := ComCall(36, this, "ptr", thread, callbackMarshal, callback, "uint", infoFlags, clientDataMarshal, clientData, context_Marshal, context_, "uint", contextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        pFuncEnterMarshal := pFuncEnter is VarRef ? "ptr*" : "ptr"
        pFuncLeaveMarshal := pFuncLeave is VarRef ? "ptr*" : "ptr"
        pFuncTailcallMarshal := pFuncTailcall is VarRef ? "ptr*" : "ptr"

        result := ComCall(37, this, pFuncEnterMarshal, pFuncEnter, pFuncLeaveMarshal, pFuncLeave, pFuncTailcallMarshal, pFuncTailcall, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        pClassIdMarshal := pClassId is VarRef ? "ptr*" : "ptr"
        pModuleIdMarshal := pModuleId is VarRef ? "ptr*" : "ptr"
        pTokenMarshal := pToken is VarRef ? "uint*" : "ptr"
        pcTypeArgsMarshal := pcTypeArgs is VarRef ? "uint*" : "ptr"
        typeArgsMarshal := typeArgs is VarRef ? "ptr*" : "ptr"

        result := ComCall(38, this, "ptr", funcId, "ptr", frameInfo, pClassIdMarshal, pClassId, pModuleIdMarshal, pModuleId, pTokenMarshal, pToken, "uint", cTypeArgs, pcTypeArgsMarshal, pcTypeArgs, typeArgsMarshal, typeArgs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        pBufferLengthOffsetMarshal := pBufferLengthOffset is VarRef ? "uint*" : "ptr"
        pStringLengthOffsetMarshal := pStringLengthOffset is VarRef ? "uint*" : "ptr"
        pBufferOffsetMarshal := pBufferOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, pBufferLengthOffsetMarshal, pBufferLengthOffset, pStringLengthOffsetMarshal, pStringLengthOffset, pBufferOffsetMarshal, pBufferOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        pcFieldOffsetMarshal := pcFieldOffset is VarRef ? "uint*" : "ptr"
        pulClassSizeMarshal := pulClassSize is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, "ptr", classID, "ptr", rFieldOffset, "uint", cFieldOffset, pcFieldOffsetMarshal, pcFieldOffset, pulClassSizeMarshal, pulClassSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        pModuleIdMarshal := pModuleId is VarRef ? "ptr*" : "ptr"
        pTypeDefTokenMarshal := pTypeDefToken is VarRef ? "uint*" : "ptr"
        pParentClassIdMarshal := pParentClassId is VarRef ? "ptr*" : "ptr"
        pcNumTypeArgsMarshal := pcNumTypeArgs is VarRef ? "uint*" : "ptr"
        typeArgsMarshal := typeArgs is VarRef ? "ptr*" : "ptr"

        result := ComCall(41, this, "ptr", classId, pModuleIdMarshal, pModuleId, pTypeDefTokenMarshal, pTypeDefToken, pParentClassIdMarshal, pParentClassId, "uint", cNumTypeArgs, pcNumTypeArgsMarshal, pcNumTypeArgs, typeArgsMarshal, typeArgs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        pcCodeInfosMarshal := pcCodeInfos is VarRef ? "uint*" : "ptr"

        result := ComCall(42, this, "ptr", functionID, "uint", cCodeInfos, pcCodeInfosMarshal, pcCodeInfos, "ptr", codeInfos, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @param {Integer} typeDef 
     * @param {Integer} cTypeArgs 
     * @param {Pointer<Pointer>} typeArgs 
     * @returns {Pointer} 
     */
    GetClassFromTokenAndTypeArgs(moduleID, typeDef, cTypeArgs, typeArgs) {
        typeArgsMarshal := typeArgs is VarRef ? "ptr*" : "ptr"

        result := ComCall(43, this, "ptr", moduleID, "uint", typeDef, "uint", cTypeArgs, typeArgsMarshal, typeArgs, "ptr*", &pClassID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pClassID
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @param {Integer} funcDef 
     * @param {Pointer} classId 
     * @param {Integer} cTypeArgs 
     * @param {Pointer<Pointer>} typeArgs 
     * @returns {Pointer} 
     */
    GetFunctionFromTokenAndTypeArgs(moduleID, funcDef, classId, cTypeArgs, typeArgs) {
        typeArgsMarshal := typeArgs is VarRef ? "ptr*" : "ptr"

        result := ComCall(44, this, "ptr", moduleID, "uint", funcDef, "ptr", classId, "uint", cTypeArgs, typeArgsMarshal, typeArgs, "ptr*", &pFunctionID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFunctionID
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @returns {ICorProfilerObjectEnum} 
     */
    EnumModuleFrozenObjects(moduleID) {
        result := ComCall(45, this, "ptr", moduleID, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICorProfilerObjectEnum(ppEnum)
    }

    /**
     * 
     * @param {Pointer} objectId_ 
     * @param {Integer} cDimensions 
     * @param {Pointer<Integer>} pDimensionSizes 
     * @param {Pointer<Integer>} pDimensionLowerBounds 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @returns {HRESULT} 
     */
    GetArrayObjectInfo(objectId_, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData) {
        pDimensionSizesMarshal := pDimensionSizes is VarRef ? "uint*" : "ptr"
        pDimensionLowerBoundsMarshal := pDimensionLowerBounds is VarRef ? "int*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := ComCall(46, this, "ptr", objectId_, "uint", cDimensions, pDimensionSizesMarshal, pDimensionSizes, pDimensionLowerBoundsMarshal, pDimensionLowerBounds, ppDataMarshal, ppData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @returns {Integer} 
     */
    GetBoxClassLayout(classId) {
        result := ComCall(47, this, "ptr", classId, "uint*", &pBufferOffset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBufferOffset
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @returns {Pointer} 
     */
    GetThreadAppDomain(threadId) {
        result := ComCall(48, this, "ptr", threadId, "ptr*", &pAppDomainId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pAppDomainId
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @returns {Pointer<Void>} 
     */
    GetRVAStaticAddress(classId, fieldToken) {
        result := ComCall(49, this, "ptr", classId, "uint", fieldToken, "ptr*", &ppAddress := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAddress
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} appDomainId 
     * @returns {Pointer<Void>} 
     */
    GetAppDomainStaticAddress(classId, fieldToken, appDomainId) {
        result := ComCall(50, this, "ptr", classId, "uint", fieldToken, "ptr", appDomainId, "ptr*", &ppAddress := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAddress
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} threadId 
     * @returns {Pointer<Void>} 
     */
    GetThreadStaticAddress(classId, fieldToken, threadId) {
        result := ComCall(51, this, "ptr", classId, "uint", fieldToken, "ptr", threadId, "ptr*", &ppAddress := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAddress
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @param {Pointer} contextId 
     * @returns {Pointer<Void>} 
     */
    GetContextStaticAddress(classId, fieldToken, contextId) {
        result := ComCall(52, this, "ptr", classId, "uint", fieldToken, "ptr", contextId, "ptr*", &ppAddress := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAddress
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @returns {Integer} 
     */
    GetStaticFieldInfo(classId, fieldToken) {
        result := ComCall(53, this, "ptr", classId, "uint", fieldToken, "int*", &pFieldInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFieldInfo
    }

    /**
     * 
     * @param {Integer} cObjectRanges 
     * @param {Pointer<Integer>} pcObjectRanges 
     * @param {Pointer<COR_PRF_GC_GENERATION_RANGE>} ranges 
     * @returns {HRESULT} 
     */
    GetGenerationBounds(cObjectRanges, pcObjectRanges, ranges) {
        pcObjectRangesMarshal := pcObjectRanges is VarRef ? "uint*" : "ptr"

        result := ComCall(54, this, "uint", cObjectRanges, pcObjectRangesMarshal, pcObjectRanges, "ptr", ranges, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} objectId_ 
     * @returns {COR_PRF_GC_GENERATION_RANGE} 
     */
    GetObjectGeneration(objectId_) {
        range := COR_PRF_GC_GENERATION_RANGE()
        result := ComCall(55, this, "ptr", objectId_, "ptr", range, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return range
    }

    /**
     * 
     * @returns {COR_PRF_EX_CLAUSE_INFO} 
     */
    GetNotifiedExceptionClauseInfo() {
        pinfo := COR_PRF_EX_CLAUSE_INFO()
        result := ComCall(56, this, "ptr", pinfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pinfo
    }
}
