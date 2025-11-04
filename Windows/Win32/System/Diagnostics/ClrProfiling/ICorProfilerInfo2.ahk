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
        callbackMarshal := callback is VarRef ? "ptr*" : "ptr"
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"
        contextMarshal := context is VarRef ? "char*" : "ptr"

        result := ComCall(36, this, "ptr", thread, callbackMarshal, callback, "uint", infoFlags, clientDataMarshal, clientData, contextMarshal, context, "uint", contextSize, "HRESULT")
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

        result := ComCall(37, this, pFuncEnterMarshal, pFuncEnter, pFuncLeaveMarshal, pFuncLeave, pFuncTailcallMarshal, pFuncTailcall, "HRESULT")
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

        result := ComCall(38, this, "ptr", funcId, "ptr", frameInfo, pClassIdMarshal, pClassId, pModuleIdMarshal, pModuleId, pTokenMarshal, pToken, "uint", cTypeArgs, pcTypeArgsMarshal, pcTypeArgs, typeArgsMarshal, typeArgs, "HRESULT")
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

        result := ComCall(39, this, pBufferLengthOffsetMarshal, pBufferLengthOffset, pStringLengthOffsetMarshal, pStringLengthOffset, pBufferOffsetMarshal, pBufferOffset, "HRESULT")
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

        result := ComCall(40, this, "ptr", classID, "ptr", rFieldOffset, "uint", cFieldOffset, pcFieldOffsetMarshal, pcFieldOffset, pulClassSizeMarshal, pulClassSize, "HRESULT")
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

        result := ComCall(41, this, "ptr", classId, pModuleIdMarshal, pModuleId, pTypeDefTokenMarshal, pTypeDefToken, pParentClassIdMarshal, pParentClassId, "uint", cNumTypeArgs, pcNumTypeArgsMarshal, pcNumTypeArgs, typeArgsMarshal, typeArgs, "HRESULT")
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

        result := ComCall(42, this, "ptr", functionID, "uint", cCodeInfos, pcCodeInfosMarshal, pcCodeInfos, "ptr", codeInfos, "HRESULT")
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
        typeArgsMarshal := typeArgs is VarRef ? "ptr*" : "ptr"
        pClassIDMarshal := pClassID is VarRef ? "ptr*" : "ptr"

        result := ComCall(43, this, "ptr", moduleID, "uint", typeDef, "uint", cTypeArgs, typeArgsMarshal, typeArgs, pClassIDMarshal, pClassID, "HRESULT")
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
        typeArgsMarshal := typeArgs is VarRef ? "ptr*" : "ptr"
        pFunctionIDMarshal := pFunctionID is VarRef ? "ptr*" : "ptr"

        result := ComCall(44, this, "ptr", moduleID, "uint", funcDef, "ptr", classId, "uint", cTypeArgs, typeArgsMarshal, typeArgs, pFunctionIDMarshal, pFunctionID, "HRESULT")
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
        pDimensionSizesMarshal := pDimensionSizes is VarRef ? "uint*" : "ptr"
        pDimensionLowerBoundsMarshal := pDimensionLowerBounds is VarRef ? "int*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := ComCall(46, this, "ptr", objectId, "uint", cDimensions, pDimensionSizesMarshal, pDimensionSizes, pDimensionLowerBoundsMarshal, pDimensionLowerBounds, ppDataMarshal, ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Pointer<Integer>} pBufferOffset 
     * @returns {HRESULT} 
     */
    GetBoxClassLayout(classId, pBufferOffset) {
        pBufferOffsetMarshal := pBufferOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(47, this, "ptr", classId, pBufferOffsetMarshal, pBufferOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @param {Pointer<Pointer>} pAppDomainId 
     * @returns {HRESULT} 
     */
    GetThreadAppDomain(threadId, pAppDomainId) {
        pAppDomainIdMarshal := pAppDomainId is VarRef ? "ptr*" : "ptr"

        result := ComCall(48, this, "ptr", threadId, pAppDomainIdMarshal, pAppDomainId, "HRESULT")
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
        ppAddressMarshal := ppAddress is VarRef ? "ptr*" : "ptr"

        result := ComCall(49, this, "ptr", classId, "uint", fieldToken, ppAddressMarshal, ppAddress, "HRESULT")
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
        ppAddressMarshal := ppAddress is VarRef ? "ptr*" : "ptr"

        result := ComCall(50, this, "ptr", classId, "uint", fieldToken, "ptr", appDomainId, ppAddressMarshal, ppAddress, "HRESULT")
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
        ppAddressMarshal := ppAddress is VarRef ? "ptr*" : "ptr"

        result := ComCall(51, this, "ptr", classId, "uint", fieldToken, "ptr", threadId, ppAddressMarshal, ppAddress, "HRESULT")
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
        ppAddressMarshal := ppAddress is VarRef ? "ptr*" : "ptr"

        result := ComCall(52, this, "ptr", classId, "uint", fieldToken, "ptr", contextId, ppAddressMarshal, ppAddress, "HRESULT")
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
        pFieldInfoMarshal := pFieldInfo is VarRef ? "int*" : "ptr"

        result := ComCall(53, this, "ptr", classId, "uint", fieldToken, pFieldInfoMarshal, pFieldInfo, "HRESULT")
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
        pcObjectRangesMarshal := pcObjectRanges is VarRef ? "uint*" : "ptr"

        result := ComCall(54, this, "uint", cObjectRanges, pcObjectRangesMarshal, pcObjectRanges, "ptr", ranges, "HRESULT")
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
