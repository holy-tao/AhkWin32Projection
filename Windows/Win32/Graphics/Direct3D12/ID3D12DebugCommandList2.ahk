#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12DebugCommandList.ahk" { ID3D12DebugCommandList }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE.ahk" { D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DebugCommandList2 extends ID3D12DebugCommandList {
    /**
     * The interface identifier for ID3D12DebugCommandList2
     * @type {Guid}
     */
    static IID := Guid("{aeb575cf-4e06-48be-ba3b-c450fc96652e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DebugCommandList2 interfaces
    */
    struct Vtbl extends ID3D12DebugCommandList.Vtbl {
        SetDebugParameter : IntPtr
        GetDebugParameter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DebugCommandList2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE} Type 
     * @param {Integer} pData 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     */
    SetDebugParameter(Type, pData, DataSize) {
        result := ComCall(6, this, D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE, Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE} Type 
     * @param {Integer} pData 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     */
    GetDebugParameter(Type, pData, DataSize) {
        result := ComCall(7, this, D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE, Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12DebugCommandList2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDebugParameter := CallbackCreate(GetMethod(implObj, "SetDebugParameter"), flags, 4)
        this.vtbl.GetDebugParameter := CallbackCreate(GetMethod(implObj, "GetDebugParameter"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDebugParameter)
        CallbackFree(this.vtbl.GetDebugParameter)
    }
}
