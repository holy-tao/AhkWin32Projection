#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_SHADER_RESOURCE_VIEW_DESC.ahk
#Include .\ID3D12QueryHeap.ahk
#Include .\D3D12_QUERY_HEAP_DESC.ahk
#Include .\D3D12_CPU_DESCRIPTOR_HANDLE.ahk
#Include .\D3D12_SAMPLER_DESC2.ahk
#Include .\D3D12_CONSTANT_BUFFER_VIEW_DESC.ahk
#Include .\ID3D12Device14.ahk
#Include .\D3D12_REGISTER_TRIM_NOTIFICATION.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_QUERY_HEAP_FLAGS.ahk
#Include .\D3D12_RENDER_TARGET_VIEW_DESC.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\D3D12_QUERY_TYPE.ahk
#Include .\ID3D12Resource.ahk
#Include .\D3D12_DEPTH_STENCIL_VIEW_DESC.ahk
#Include .\D3D12_UNORDERED_ACCESS_VIEW_DESC.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class ID3D12Device15 extends ID3D12Device14 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device15
     * @type {Guid}
     */
    static IID => Guid("{76cff76f-1e9b-4450-8cdc-34f1af788e5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 83

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterTrimNotificationCallback", "UnregisterTrimNotificationCallback", "TryCreateShaderResourceView", "TryCreateUnorderedAccessView", "TryCreateConstantBufferView", "TryCreateSampler2", "TryCreateRenderTargetView", "TryCreateDepthStencilView", "TryCreateSamplerFeedbackUnorderedAccessView", "CreateQueryHeap1", "ResolveQueryData"]

    /**
     * 
     * @param {Pointer<D3D12_REGISTER_TRIM_NOTIFICATION>} pData 
     * @returns {HRESULT} 
     */
    RegisterTrimNotificationCallback(pData) {
        result := ComCall(83, this, "ptr", pData, "HRESULT")
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
        result := ComCall(85, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor, "HRESULT")
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
        result := ComCall(86, this, "ptr", pResource, "ptr", pCounterResource, "ptr", pDesc, "ptr", DestDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_CONSTANT_BUFFER_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {HRESULT} 
     */
    TryCreateConstantBufferView(pDesc, DestDescriptor) {
        result := ComCall(87, this, "ptr", pDesc, "ptr", DestDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_SAMPLER_DESC2>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {HRESULT} 
     */
    TryCreateSampler2(pDesc, DestDescriptor) {
        result := ComCall(88, this, "ptr", pDesc, "ptr", DestDescriptor, "HRESULT")
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
        result := ComCall(89, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor, "HRESULT")
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
        result := ComCall(90, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor, "HRESULT")
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
        result := ComCall(91, this, "ptr", pTargetedResource, "ptr", pFeedbackResource, "ptr", DestDescriptor, "HRESULT")
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
        result := ComCall(92, this, "ptr", pDesc, "int", Flags, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
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

        result := ComCall(93, this, "ptr", pQueryHeap, "int", Type, "uint", StartIndex, "uint", NumQueries, pResolvedQueryDataMarshal, pResolvedQueryData, "HRESULT")
        return result
    }
}
