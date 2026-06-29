#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\COR_PRF_CODE_INFO.ahk" { COR_PRF_CODE_INFO }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerInfo8.ahk" { ICorProfilerInfo8 }
#Import ".\COR_DEBUG_IL_TO_NATIVE_MAP.ahk" { COR_DEBUG_IL_TO_NATIVE_MAP }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo9 extends ICorProfilerInfo8 {
    /**
     * The interface identifier for ICorProfilerInfo9
     * @type {Guid}
     */
    static IID := Guid("{008170db-f8cc-4796-9a51-dc8aa0b47012}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo9 interfaces
    */
    struct Vtbl extends ICorProfilerInfo8.Vtbl {
        GetNativeCodeStartAddresses : IntPtr
        GetILToNativeMapping3       : IntPtr
        GetCodeInfo4                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} functionID 
     * @param {Pointer} reJitId 
     * @param {Integer} cCodeStartAddresses 
     * @param {Pointer<Integer>} pcCodeStartAddresses 
     * @param {Pointer<Pointer>} codeStartAddresses 
     * @returns {HRESULT} 
     */
    GetNativeCodeStartAddresses(functionID, reJitId, cCodeStartAddresses, pcCodeStartAddresses, codeStartAddresses) {
        pcCodeStartAddressesMarshal := pcCodeStartAddresses is VarRef ? "uint*" : "ptr"
        codeStartAddressesMarshal := codeStartAddresses is VarRef ? "ptr*" : "ptr"

        result := ComCall(90, this, "ptr", functionID, "ptr", reJitId, "uint", cCodeStartAddresses, pcCodeStartAddressesMarshal, pcCodeStartAddresses, codeStartAddressesMarshal, codeStartAddresses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pNativeCodeStartAddress 
     * @param {Integer} cMap 
     * @param {Pointer<Integer>} pcMap 
     * @param {Pointer<COR_DEBUG_IL_TO_NATIVE_MAP>} _map 
     * @returns {HRESULT} 
     */
    GetILToNativeMapping3(pNativeCodeStartAddress, cMap, pcMap, _map) {
        pcMapMarshal := pcMap is VarRef ? "uint*" : "ptr"

        result := ComCall(91, this, "ptr", pNativeCodeStartAddress, "uint", cMap, pcMapMarshal, pcMap, COR_DEBUG_IL_TO_NATIVE_MAP.Ptr, _map, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pNativeCodeStartAddress 
     * @param {Integer} cCodeInfos 
     * @param {Pointer<Integer>} pcCodeInfos 
     * @param {Pointer<COR_PRF_CODE_INFO>} codeInfos 
     * @returns {HRESULT} 
     */
    GetCodeInfo4(pNativeCodeStartAddress, cCodeInfos, pcCodeInfos, codeInfos) {
        pcCodeInfosMarshal := pcCodeInfos is VarRef ? "uint*" : "ptr"

        result := ComCall(92, this, "ptr", pNativeCodeStartAddress, "uint", cCodeInfos, pcCodeInfosMarshal, pcCodeInfos, COR_PRF_CODE_INFO.Ptr, codeInfos, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerInfo9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNativeCodeStartAddresses := CallbackCreate(GetMethod(implObj, "GetNativeCodeStartAddresses"), flags, 6)
        this.vtbl.GetILToNativeMapping3 := CallbackCreate(GetMethod(implObj, "GetILToNativeMapping3"), flags, 5)
        this.vtbl.GetCodeInfo4 := CallbackCreate(GetMethod(implObj, "GetCodeInfo4"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNativeCodeStartAddresses)
        CallbackFree(this.vtbl.GetILToNativeMapping3)
        CallbackFree(this.vtbl.GetCodeInfo4)
    }
}
