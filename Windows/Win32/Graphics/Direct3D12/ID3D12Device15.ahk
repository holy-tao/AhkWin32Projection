#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_SHADER_RESOURCE_VIEW_DESC.ahk" { D3D12_SHADER_RESOURCE_VIEW_DESC }
#Import ".\D3D12_CPU_DESCRIPTOR_HANDLE.ahk" { D3D12_CPU_DESCRIPTOR_HANDLE }
#Import ".\ID3D12QueryHeap.ahk" { ID3D12QueryHeap }
#Import ".\D3D12_UNORDERED_ACCESS_VIEW_DESC.ahk" { D3D12_UNORDERED_ACCESS_VIEW_DESC }
#Import ".\D3D12_CONSTANT_BUFFER_VIEW_DESC.ahk" { D3D12_CONSTANT_BUFFER_VIEW_DESC }
#Import ".\D3D12_QUERY_HEAP_DESC.ahk" { D3D12_QUERY_HEAP_DESC }
#Import ".\D3D12_RENDER_TARGET_VIEW_DESC.ahk" { D3D12_RENDER_TARGET_VIEW_DESC }
#Import ".\ID3D12Device14.ahk" { ID3D12Device14 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_QUERY_TYPE.ahk" { D3D12_QUERY_TYPE }
#Import ".\D3D12_QUERY_HEAP_FLAGS.ahk" { D3D12_QUERY_HEAP_FLAGS }
#Import ".\D3D12_SAMPLER_DESC2.ahk" { D3D12_SAMPLER_DESC2 }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }
#Import ".\D3D12_DEPTH_STENCIL_VIEW_DESC.ahk" { D3D12_DEPTH_STENCIL_VIEW_DESC }
#Import ".\D3D12_REGISTER_TRIM_NOTIFICATION.ahk" { D3D12_REGISTER_TRIM_NOTIFICATION }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device15 extends ID3D12Device14 {
    /**
     * The interface identifier for ID3D12Device15
     * @type {Guid}
     */
    static IID := Guid("{76cff76f-1e9b-4450-8cdc-34f1af788e5b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device15 interfaces
    */
    struct Vtbl extends ID3D12Device14.Vtbl {
        RegisterTrimNotificationCallback            : IntPtr
        UnregisterTrimNotificationCallback          : IntPtr
        TryCreateShaderResourceView                 : IntPtr
        TryCreateUnorderedAccessView                : IntPtr
        TryCreateConstantBufferView                 : IntPtr
        TryCreateSampler2                           : IntPtr
        TryCreateRenderTargetView                   : IntPtr
        TryCreateDepthStencilView                   : IntPtr
        TryCreateSamplerFeedbackUnorderedAccessView : IntPtr
        CreateQueryHeap1                            : IntPtr
        ResolveQueryData                            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device15.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12_REGISTER_TRIM_NOTIFICATION>} pData 
     * @returns {HRESULT} 
     */
    RegisterTrimNotificationCallback(pData) {
        result := ComCall(83, this, D3D12_REGISTER_TRIM_NOTIFICATION.Ptr, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallbackCookie 
     * @returns {HRESULT} 
     */
    UnregisterTrimNotificationCallback(CallbackCookie) {
        result := ComCall(84, this, "uint", CallbackCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<D3D12_SHADER_RESOURCE_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {HRESULT} 
     */
    TryCreateShaderResourceView(pResource, pDesc, DestDescriptor) {
        result := ComCall(85, this, "ptr", pResource, D3D12_SHADER_RESOURCE_VIEW_DESC.Ptr, pDesc, D3D12_CPU_DESCRIPTOR_HANDLE, DestDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {ID3D12Resource} pCounterResource 
     * @param {Pointer<D3D12_UNORDERED_ACCESS_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {HRESULT} 
     */
    TryCreateUnorderedAccessView(pResource, pCounterResource, pDesc, DestDescriptor) {
        result := ComCall(86, this, "ptr", pResource, "ptr", pCounterResource, D3D12_UNORDERED_ACCESS_VIEW_DESC.Ptr, pDesc, D3D12_CPU_DESCRIPTOR_HANDLE, DestDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_CONSTANT_BUFFER_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {HRESULT} 
     */
    TryCreateConstantBufferView(pDesc, DestDescriptor) {
        result := ComCall(87, this, D3D12_CONSTANT_BUFFER_VIEW_DESC.Ptr, pDesc, D3D12_CPU_DESCRIPTOR_HANDLE, DestDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_SAMPLER_DESC2>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {HRESULT} 
     */
    TryCreateSampler2(pDesc, DestDescriptor) {
        result := ComCall(88, this, D3D12_SAMPLER_DESC2.Ptr, pDesc, D3D12_CPU_DESCRIPTOR_HANDLE, DestDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<D3D12_RENDER_TARGET_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {HRESULT} 
     */
    TryCreateRenderTargetView(pResource, pDesc, DestDescriptor) {
        result := ComCall(89, this, "ptr", pResource, D3D12_RENDER_TARGET_VIEW_DESC.Ptr, pDesc, D3D12_CPU_DESCRIPTOR_HANDLE, DestDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<D3D12_DEPTH_STENCIL_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {HRESULT} 
     */
    TryCreateDepthStencilView(pResource, pDesc, DestDescriptor) {
        result := ComCall(90, this, "ptr", pResource, D3D12_DEPTH_STENCIL_VIEW_DESC.Ptr, pDesc, D3D12_CPU_DESCRIPTOR_HANDLE, DestDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pTargetedResource 
     * @param {ID3D12Resource} pFeedbackResource 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {HRESULT} 
     */
    TryCreateSamplerFeedbackUnorderedAccessView(pTargetedResource, pFeedbackResource, DestDescriptor) {
        result := ComCall(91, this, "ptr", pTargetedResource, "ptr", pFeedbackResource, D3D12_CPU_DESCRIPTOR_HANDLE, DestDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_QUERY_HEAP_DESC>} pDesc 
     * @param {D3D12_QUERY_HEAP_FLAGS} Flags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateQueryHeap1(pDesc, Flags, riid) {
        result := ComCall(92, this, D3D12_QUERY_HEAP_DESC.Ptr, pDesc, D3D12_QUERY_HEAP_FLAGS, Flags, Guid.Ptr, riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * 
     * @param {ID3D12QueryHeap} pQueryHeap 
     * @param {D3D12_QUERY_TYPE} Type 
     * @param {Integer} StartIndex 
     * @param {Integer} NumQueries 
     * @param {Pointer<Void>} pResolvedQueryData 
     * @returns {HRESULT} 
     */
    ResolveQueryData(pQueryHeap, Type, StartIndex, NumQueries, pResolvedQueryData) {
        pResolvedQueryDataMarshal := pResolvedQueryData is VarRef ? "ptr" : "ptr"

        result := ComCall(93, this, "ptr", pQueryHeap, D3D12_QUERY_TYPE, Type, "uint", StartIndex, "uint", NumQueries, pResolvedQueryDataMarshal, pResolvedQueryData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12Device15.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterTrimNotificationCallback := CallbackCreate(GetMethod(implObj, "RegisterTrimNotificationCallback"), flags, 2)
        this.vtbl.UnregisterTrimNotificationCallback := CallbackCreate(GetMethod(implObj, "UnregisterTrimNotificationCallback"), flags, 2)
        this.vtbl.TryCreateShaderResourceView := CallbackCreate(GetMethod(implObj, "TryCreateShaderResourceView"), flags, 4)
        this.vtbl.TryCreateUnorderedAccessView := CallbackCreate(GetMethod(implObj, "TryCreateUnorderedAccessView"), flags, 5)
        this.vtbl.TryCreateConstantBufferView := CallbackCreate(GetMethod(implObj, "TryCreateConstantBufferView"), flags, 3)
        this.vtbl.TryCreateSampler2 := CallbackCreate(GetMethod(implObj, "TryCreateSampler2"), flags, 3)
        this.vtbl.TryCreateRenderTargetView := CallbackCreate(GetMethod(implObj, "TryCreateRenderTargetView"), flags, 4)
        this.vtbl.TryCreateDepthStencilView := CallbackCreate(GetMethod(implObj, "TryCreateDepthStencilView"), flags, 4)
        this.vtbl.TryCreateSamplerFeedbackUnorderedAccessView := CallbackCreate(GetMethod(implObj, "TryCreateSamplerFeedbackUnorderedAccessView"), flags, 4)
        this.vtbl.CreateQueryHeap1 := CallbackCreate(GetMethod(implObj, "CreateQueryHeap1"), flags, 5)
        this.vtbl.ResolveQueryData := CallbackCreate(GetMethod(implObj, "ResolveQueryData"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterTrimNotificationCallback)
        CallbackFree(this.vtbl.UnregisterTrimNotificationCallback)
        CallbackFree(this.vtbl.TryCreateShaderResourceView)
        CallbackFree(this.vtbl.TryCreateUnorderedAccessView)
        CallbackFree(this.vtbl.TryCreateConstantBufferView)
        CallbackFree(this.vtbl.TryCreateSampler2)
        CallbackFree(this.vtbl.TryCreateRenderTargetView)
        CallbackFree(this.vtbl.TryCreateDepthStencilView)
        CallbackFree(this.vtbl.TryCreateSamplerFeedbackUnorderedAccessView)
        CallbackFree(this.vtbl.CreateQueryHeap1)
        CallbackFree(this.vtbl.ResolveQueryData)
    }
}
