#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\COR_PRF_CODE_INFO.ahk" { COR_PRF_CODE_INFO }
#Import ".\ICorProfilerThreadEnum.ahk" { ICorProfilerThreadEnum }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerFunctionEnum.ahk" { ICorProfilerFunctionEnum }
#Import ".\COR_DEBUG_IL_TO_NATIVE_MAP.ahk" { COR_DEBUG_IL_TO_NATIVE_MAP }
#Import ".\ICorProfilerInfo3.ahk" { ICorProfilerInfo3 }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo4 extends ICorProfilerInfo3 {
    /**
     * The interface identifier for ICorProfilerInfo4
     * @type {Guid}
     */
    static IID := Guid("{0d8fdcaa-6257-47bf-b1bf-94dac88466ee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo4 interfaces
    */
    struct Vtbl extends ICorProfilerInfo3.Vtbl {
        EnumThreads             : IntPtr
        InitializeCurrentThread : IntPtr
        RequestReJIT            : IntPtr
        RequestRevert           : IntPtr
        GetCodeInfo3            : IntPtr
        GetFunctionFromIP2      : IntPtr
        GetReJITIDs             : IntPtr
        GetILToNativeMapping2   : IntPtr
        EnumJITedFunctions2     : IntPtr
        GetObjectSize2          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ICorProfilerThreadEnum} 
     */
    EnumThreads() {
        result := ComCall(71, this, "ptr*", &ppEnum := 0, "HRESULT")
        return ICorProfilerThreadEnum(ppEnum)
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
        moduleIdsMarshal := moduleIds is VarRef ? "ptr*" : "ptr"
        methodIdsMarshal := methodIds is VarRef ? "uint*" : "ptr"

        result := ComCall(73, this, "uint", cFunctions, moduleIdsMarshal, moduleIds, methodIdsMarshal, methodIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cFunctions 
     * @param {Pointer<Pointer>} moduleIds 
     * @param {Pointer<Integer>} methodIds 
     * @returns {HRESULT} 
     */
    RequestRevert(cFunctions, moduleIds, methodIds) {
        moduleIdsMarshal := moduleIds is VarRef ? "ptr*" : "ptr"
        methodIdsMarshal := methodIds is VarRef ? "uint*" : "ptr"

        result := ComCall(74, this, "uint", cFunctions, moduleIdsMarshal, moduleIds, methodIdsMarshal, methodIds, "int*", &_status := 0, "HRESULT")
        return _status
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
        pcCodeInfosMarshal := pcCodeInfos is VarRef ? "uint*" : "ptr"

        result := ComCall(75, this, "ptr", functionID, "ptr", reJitId, "uint", cCodeInfos, pcCodeInfosMarshal, pcCodeInfos, COR_PRF_CODE_INFO.Ptr, codeInfos, "HRESULT")
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
        ipMarshal := ip is VarRef ? "char*" : "ptr"
        pFunctionIdMarshal := pFunctionId is VarRef ? "ptr*" : "ptr"
        pReJitIdMarshal := pReJitId is VarRef ? "ptr*" : "ptr"

        result := ComCall(76, this, ipMarshal, ip, pFunctionIdMarshal, pFunctionId, pReJitIdMarshal, pReJitId, "HRESULT")
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
        pcReJitIdsMarshal := pcReJitIds is VarRef ? "uint*" : "ptr"
        reJitIdsMarshal := reJitIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(77, this, "ptr", functionId, "uint", cReJitIds, pcReJitIdsMarshal, pcReJitIds, reJitIdsMarshal, reJitIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} reJitId 
     * @param {Integer} cMap 
     * @param {Pointer<Integer>} pcMap 
     * @param {Pointer<COR_DEBUG_IL_TO_NATIVE_MAP>} _map 
     * @returns {HRESULT} 
     */
    GetILToNativeMapping2(functionId, reJitId, cMap, pcMap, _map) {
        pcMapMarshal := pcMap is VarRef ? "uint*" : "ptr"

        result := ComCall(78, this, "ptr", functionId, "ptr", reJitId, "uint", cMap, pcMapMarshal, pcMap, COR_DEBUG_IL_TO_NATIVE_MAP.Ptr, _map, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ICorProfilerFunctionEnum} 
     */
    EnumJITedFunctions2() {
        result := ComCall(79, this, "ptr*", &ppEnum := 0, "HRESULT")
        return ICorProfilerFunctionEnum(ppEnum)
    }

    /**
     * 
     * @param {Pointer} _objectId 
     * @returns {Pointer} 
     */
    GetObjectSize2(_objectId) {
        result := ComCall(80, this, "ptr", _objectId, "ptr*", &pcSize := 0, "HRESULT")
        return pcSize
    }

    Query(iid) {
        if (ICorProfilerInfo4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumThreads := CallbackCreate(GetMethod(implObj, "EnumThreads"), flags, 2)
        this.vtbl.InitializeCurrentThread := CallbackCreate(GetMethod(implObj, "InitializeCurrentThread"), flags, 1)
        this.vtbl.RequestReJIT := CallbackCreate(GetMethod(implObj, "RequestReJIT"), flags, 4)
        this.vtbl.RequestRevert := CallbackCreate(GetMethod(implObj, "RequestRevert"), flags, 5)
        this.vtbl.GetCodeInfo3 := CallbackCreate(GetMethod(implObj, "GetCodeInfo3"), flags, 6)
        this.vtbl.GetFunctionFromIP2 := CallbackCreate(GetMethod(implObj, "GetFunctionFromIP2"), flags, 4)
        this.vtbl.GetReJITIDs := CallbackCreate(GetMethod(implObj, "GetReJITIDs"), flags, 5)
        this.vtbl.GetILToNativeMapping2 := CallbackCreate(GetMethod(implObj, "GetILToNativeMapping2"), flags, 6)
        this.vtbl.EnumJITedFunctions2 := CallbackCreate(GetMethod(implObj, "EnumJITedFunctions2"), flags, 2)
        this.vtbl.GetObjectSize2 := CallbackCreate(GetMethod(implObj, "GetObjectSize2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumThreads)
        CallbackFree(this.vtbl.InitializeCurrentThread)
        CallbackFree(this.vtbl.RequestReJIT)
        CallbackFree(this.vtbl.RequestRevert)
        CallbackFree(this.vtbl.GetCodeInfo3)
        CallbackFree(this.vtbl.GetFunctionFromIP2)
        CallbackFree(this.vtbl.GetReJITIDs)
        CallbackFree(this.vtbl.GetILToNativeMapping2)
        CallbackFree(this.vtbl.EnumJITedFunctions2)
        CallbackFree(this.vtbl.GetObjectSize2)
    }
}
