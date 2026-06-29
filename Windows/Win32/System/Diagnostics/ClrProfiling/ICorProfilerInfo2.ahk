#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\COR_PRF_CODE_INFO.ahk" { COR_PRF_CODE_INFO }
#Import ".\COR_PRF_EX_CLAUSE_INFO.ahk" { COR_PRF_EX_CLAUSE_INFO }
#Import "..\..\WinRT\Metadata\COR_FIELD_OFFSET.ahk" { COR_FIELD_OFFSET }
#Import ".\ICorProfilerObjectEnum.ahk" { ICorProfilerObjectEnum }
#Import ".\COR_PRF_GC_GENERATION_RANGE.ahk" { COR_PRF_GC_GENERATION_RANGE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\COR_PRF_STATIC_TYPE.ahk" { COR_PRF_STATIC_TYPE }
#Import ".\ICorProfilerInfo.ahk" { ICorProfilerInfo }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo2 extends ICorProfilerInfo {
    /**
     * The interface identifier for ICorProfilerInfo2
     * @type {Guid}
     */
    static IID := Guid("{cc0935cd-a518-487d-b0bb-a93214e65478}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo2 interfaces
    */
    struct Vtbl extends ICorProfilerInfo.Vtbl {
        DoStackSnapshot                 : IntPtr
        SetEnterLeaveFunctionHooks2     : IntPtr
        GetFunctionInfo2                : IntPtr
        GetStringLayout                 : IntPtr
        GetClassLayout                  : IntPtr
        GetClassIDInfo2                 : IntPtr
        GetCodeInfo2                    : IntPtr
        GetClassFromTokenAndTypeArgs    : IntPtr
        GetFunctionFromTokenAndTypeArgs : IntPtr
        EnumModuleFrozenObjects         : IntPtr
        GetArrayObjectInfo              : IntPtr
        GetBoxClassLayout               : IntPtr
        GetThreadAppDomain              : IntPtr
        GetRVAStaticAddress             : IntPtr
        GetAppDomainStaticAddress       : IntPtr
        GetThreadStaticAddress          : IntPtr
        GetContextStaticAddress         : IntPtr
        GetStaticFieldInfo              : IntPtr
        GetGenerationBounds             : IntPtr
        GetObjectGeneration             : IntPtr
        GetNotifiedExceptionClauseInfo  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} thread 
     * @param {Pointer<Pointer<StackSnapshotCallback>>} callback 
     * @param {Integer} infoFlags 
     * @param {Pointer<Void>} clientData 
     * @param {Pointer<Integer>} _context 
     * @param {Integer} contextSize 
     * @returns {HRESULT} 
     */
    DoStackSnapshot(thread, callback, infoFlags, clientData, _context, contextSize) {
        callbackMarshal := callback is VarRef ? "ptr*" : "ptr"
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"
        _contextMarshal := _context is VarRef ? "char*" : "ptr"

        result := ComCall(36, this, "ptr", thread, callbackMarshal, callback, "uint", infoFlags, clientDataMarshal, clientData, _contextMarshal, _context, "uint", contextSize, "HRESULT")
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

        result := ComCall(40, this, "ptr", classID, COR_FIELD_OFFSET.Ptr, rFieldOffset, "uint", cFieldOffset, pcFieldOffsetMarshal, pcFieldOffset, pulClassSizeMarshal, pulClassSize, "HRESULT")
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

        result := ComCall(42, this, "ptr", functionID, "uint", cCodeInfos, pcCodeInfosMarshal, pcCodeInfos, COR_PRF_CODE_INFO.Ptr, codeInfos, "HRESULT")
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

        result := ComCall(43, this, "ptr", moduleID, "uint", typeDef, "uint", cTypeArgs, typeArgsMarshal, typeArgs, "ptr*", &pClassID := 0, "HRESULT")
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

        result := ComCall(44, this, "ptr", moduleID, "uint", funcDef, "ptr", classId, "uint", cTypeArgs, typeArgsMarshal, typeArgs, "ptr*", &pFunctionID := 0, "HRESULT")
        return pFunctionID
    }

    /**
     * 
     * @param {Pointer} moduleID 
     * @returns {ICorProfilerObjectEnum} 
     */
    EnumModuleFrozenObjects(moduleID) {
        result := ComCall(45, this, "ptr", moduleID, "ptr*", &ppEnum := 0, "HRESULT")
        return ICorProfilerObjectEnum(ppEnum)
    }

    /**
     * 
     * @param {Pointer} _objectId 
     * @param {Integer} cDimensions 
     * @param {Pointer<Integer>} pDimensionSizes 
     * @param {Pointer<Integer>} pDimensionLowerBounds 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @returns {HRESULT} 
     */
    GetArrayObjectInfo(_objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData) {
        pDimensionSizesMarshal := pDimensionSizes is VarRef ? "uint*" : "ptr"
        pDimensionLowerBoundsMarshal := pDimensionLowerBounds is VarRef ? "int*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := ComCall(46, this, "ptr", _objectId, "uint", cDimensions, pDimensionSizesMarshal, pDimensionSizes, pDimensionLowerBoundsMarshal, pDimensionLowerBounds, ppDataMarshal, ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @returns {Integer} 
     */
    GetBoxClassLayout(classId) {
        result := ComCall(47, this, "ptr", classId, "uint*", &pBufferOffset := 0, "HRESULT")
        return pBufferOffset
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @returns {Pointer} 
     */
    GetThreadAppDomain(threadId) {
        result := ComCall(48, this, "ptr", threadId, "ptr*", &pAppDomainId := 0, "HRESULT")
        return pAppDomainId
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @returns {Pointer<Void>} 
     */
    GetRVAStaticAddress(classId, fieldToken) {
        result := ComCall(49, this, "ptr", classId, "uint", fieldToken, "ptr*", &ppAddress := 0, "HRESULT")
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
        result := ComCall(50, this, "ptr", classId, "uint", fieldToken, "ptr", appDomainId, "ptr*", &ppAddress := 0, "HRESULT")
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
        result := ComCall(51, this, "ptr", classId, "uint", fieldToken, "ptr", threadId, "ptr*", &ppAddress := 0, "HRESULT")
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
        result := ComCall(52, this, "ptr", classId, "uint", fieldToken, "ptr", contextId, "ptr*", &ppAddress := 0, "HRESULT")
        return ppAddress
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {Integer} fieldToken 
     * @returns {COR_PRF_STATIC_TYPE} 
     */
    GetStaticFieldInfo(classId, fieldToken) {
        result := ComCall(53, this, "ptr", classId, "uint", fieldToken, "int*", &pFieldInfo := 0, "HRESULT")
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

        result := ComCall(54, this, "uint", cObjectRanges, pcObjectRangesMarshal, pcObjectRanges, COR_PRF_GC_GENERATION_RANGE.Ptr, ranges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} _objectId 
     * @returns {COR_PRF_GC_GENERATION_RANGE} 
     */
    GetObjectGeneration(_objectId) {
        range := COR_PRF_GC_GENERATION_RANGE()
        result := ComCall(55, this, "ptr", _objectId, COR_PRF_GC_GENERATION_RANGE.Ptr, range, "HRESULT")
        return range
    }

    /**
     * 
     * @returns {COR_PRF_EX_CLAUSE_INFO} 
     */
    GetNotifiedExceptionClauseInfo() {
        pinfo := COR_PRF_EX_CLAUSE_INFO()
        result := ComCall(56, this, COR_PRF_EX_CLAUSE_INFO.Ptr, pinfo, "HRESULT")
        return pinfo
    }

    Query(iid) {
        if (ICorProfilerInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoStackSnapshot := CallbackCreate(GetMethod(implObj, "DoStackSnapshot"), flags, 7)
        this.vtbl.SetEnterLeaveFunctionHooks2 := CallbackCreate(GetMethod(implObj, "SetEnterLeaveFunctionHooks2"), flags, 4)
        this.vtbl.GetFunctionInfo2 := CallbackCreate(GetMethod(implObj, "GetFunctionInfo2"), flags, 9)
        this.vtbl.GetStringLayout := CallbackCreate(GetMethod(implObj, "GetStringLayout"), flags, 4)
        this.vtbl.GetClassLayout := CallbackCreate(GetMethod(implObj, "GetClassLayout"), flags, 6)
        this.vtbl.GetClassIDInfo2 := CallbackCreate(GetMethod(implObj, "GetClassIDInfo2"), flags, 8)
        this.vtbl.GetCodeInfo2 := CallbackCreate(GetMethod(implObj, "GetCodeInfo2"), flags, 5)
        this.vtbl.GetClassFromTokenAndTypeArgs := CallbackCreate(GetMethod(implObj, "GetClassFromTokenAndTypeArgs"), flags, 6)
        this.vtbl.GetFunctionFromTokenAndTypeArgs := CallbackCreate(GetMethod(implObj, "GetFunctionFromTokenAndTypeArgs"), flags, 7)
        this.vtbl.EnumModuleFrozenObjects := CallbackCreate(GetMethod(implObj, "EnumModuleFrozenObjects"), flags, 3)
        this.vtbl.GetArrayObjectInfo := CallbackCreate(GetMethod(implObj, "GetArrayObjectInfo"), flags, 6)
        this.vtbl.GetBoxClassLayout := CallbackCreate(GetMethod(implObj, "GetBoxClassLayout"), flags, 3)
        this.vtbl.GetThreadAppDomain := CallbackCreate(GetMethod(implObj, "GetThreadAppDomain"), flags, 3)
        this.vtbl.GetRVAStaticAddress := CallbackCreate(GetMethod(implObj, "GetRVAStaticAddress"), flags, 4)
        this.vtbl.GetAppDomainStaticAddress := CallbackCreate(GetMethod(implObj, "GetAppDomainStaticAddress"), flags, 5)
        this.vtbl.GetThreadStaticAddress := CallbackCreate(GetMethod(implObj, "GetThreadStaticAddress"), flags, 5)
        this.vtbl.GetContextStaticAddress := CallbackCreate(GetMethod(implObj, "GetContextStaticAddress"), flags, 5)
        this.vtbl.GetStaticFieldInfo := CallbackCreate(GetMethod(implObj, "GetStaticFieldInfo"), flags, 4)
        this.vtbl.GetGenerationBounds := CallbackCreate(GetMethod(implObj, "GetGenerationBounds"), flags, 4)
        this.vtbl.GetObjectGeneration := CallbackCreate(GetMethod(implObj, "GetObjectGeneration"), flags, 3)
        this.vtbl.GetNotifiedExceptionClauseInfo := CallbackCreate(GetMethod(implObj, "GetNotifiedExceptionClauseInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoStackSnapshot)
        CallbackFree(this.vtbl.SetEnterLeaveFunctionHooks2)
        CallbackFree(this.vtbl.GetFunctionInfo2)
        CallbackFree(this.vtbl.GetStringLayout)
        CallbackFree(this.vtbl.GetClassLayout)
        CallbackFree(this.vtbl.GetClassIDInfo2)
        CallbackFree(this.vtbl.GetCodeInfo2)
        CallbackFree(this.vtbl.GetClassFromTokenAndTypeArgs)
        CallbackFree(this.vtbl.GetFunctionFromTokenAndTypeArgs)
        CallbackFree(this.vtbl.EnumModuleFrozenObjects)
        CallbackFree(this.vtbl.GetArrayObjectInfo)
        CallbackFree(this.vtbl.GetBoxClassLayout)
        CallbackFree(this.vtbl.GetThreadAppDomain)
        CallbackFree(this.vtbl.GetRVAStaticAddress)
        CallbackFree(this.vtbl.GetAppDomainStaticAddress)
        CallbackFree(this.vtbl.GetThreadStaticAddress)
        CallbackFree(this.vtbl.GetContextStaticAddress)
        CallbackFree(this.vtbl.GetStaticFieldInfo)
        CallbackFree(this.vtbl.GetGenerationBounds)
        CallbackFree(this.vtbl.GetObjectGeneration)
        CallbackFree(this.vtbl.GetNotifiedExceptionClauseInfo)
    }
}
