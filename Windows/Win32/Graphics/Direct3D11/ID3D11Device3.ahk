#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Texture2D1.ahk
#Include .\ID3D11Texture3D1.ahk
#Include .\ID3D11RasterizerState2.ahk
#Include .\ID3D11ShaderResourceView1.ahk
#Include .\ID3D11UnorderedAccessView1.ahk
#Include .\ID3D11RenderTargetView1.ahk
#Include .\ID3D11Query1.ahk
#Include .\ID3D11DeviceContext3.ahk
#Include .\ID3D11Device2.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device3 adds new methods to those in ID3D11Device2.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11device3
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device3 extends ID3D11Device2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Device3
     * @type {Guid}
     */
    static IID => Guid("{a05c8c37-d2c6-4732-b3a0-9ce0b0dc9ae6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 54

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTexture2D1", "CreateTexture3D1", "CreateRasterizerState2", "CreateShaderResourceView1", "CreateUnorderedAccessView1", "CreateRenderTargetView1", "CreateQuery1", "GetImmediateContext3", "CreateDeferredContext3", "WriteToSubresource", "ReadFromSubresource"]

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE2D_DESC1>} pDesc1 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @returns {ID3D11Texture2D1} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-createtexture2d1
     */
    CreateTexture2D1(pDesc1, pInitialData) {
        result := ComCall(54, this, "ptr", pDesc1, "ptr", pInitialData, "ptr*", &ppTexture2D := 0, "HRESULT")
        return ID3D11Texture2D1(ppTexture2D)
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE3D_DESC1>} pDesc1 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @returns {ID3D11Texture3D1} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-createtexture3d1
     */
    CreateTexture3D1(pDesc1, pInitialData) {
        result := ComCall(55, this, "ptr", pDesc1, "ptr", pInitialData, "ptr*", &ppTexture3D := 0, "HRESULT")
        return ID3D11Texture3D1(ppTexture3D)
    }

    /**
     * 
     * @param {Pointer<D3D11_RASTERIZER_DESC2>} pRasterizerDesc 
     * @returns {ID3D11RasterizerState2} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-createrasterizerstate2
     */
    CreateRasterizerState2(pRasterizerDesc) {
        result := ComCall(56, this, "ptr", pRasterizerDesc, "ptr*", &ppRasterizerState := 0, "HRESULT")
        return ID3D11RasterizerState2(ppRasterizerState)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_SHADER_RESOURCE_VIEW_DESC1>} pDesc1 
     * @returns {ID3D11ShaderResourceView1} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-createshaderresourceview1
     */
    CreateShaderResourceView1(pResource, pDesc1) {
        result := ComCall(57, this, "ptr", pResource, "ptr", pDesc1, "ptr*", &ppSRView1 := 0, "HRESULT")
        return ID3D11ShaderResourceView1(ppSRView1)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC1>} pDesc1 
     * @returns {ID3D11UnorderedAccessView1} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-createunorderedaccessview1
     */
    CreateUnorderedAccessView1(pResource, pDesc1) {
        result := ComCall(58, this, "ptr", pResource, "ptr", pDesc1, "ptr*", &ppUAView1 := 0, "HRESULT")
        return ID3D11UnorderedAccessView1(ppUAView1)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC1>} pDesc1 
     * @returns {ID3D11RenderTargetView1} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-createrendertargetview1
     */
    CreateRenderTargetView1(pResource, pDesc1) {
        result := ComCall(59, this, "ptr", pResource, "ptr", pDesc1, "ptr*", &ppRTView1 := 0, "HRESULT")
        return ID3D11RenderTargetView1(ppRTView1)
    }

    /**
     * 
     * @param {Pointer<D3D11_QUERY_DESC1>} pQueryDesc1 
     * @returns {ID3D11Query1} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-createquery1
     */
    CreateQuery1(pQueryDesc1) {
        result := ComCall(60, this, "ptr", pQueryDesc1, "ptr*", &ppQuery1 := 0, "HRESULT")
        return ID3D11Query1(ppQuery1)
    }

    /**
     * 
     * @param {Pointer<ID3D11DeviceContext3>} ppImmediateContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-getimmediatecontext3
     */
    GetImmediateContext3(ppImmediateContext) {
        ComCall(61, this, "ptr*", ppImmediateContext)
    }

    /**
     * 
     * @param {Integer} ContextFlags 
     * @returns {ID3D11DeviceContext3} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-createdeferredcontext3
     */
    CreateDeferredContext3(ContextFlags) {
        result := ComCall(62, this, "uint", ContextFlags, "ptr*", &ppDeferredContext := 0, "HRESULT")
        return ID3D11DeviceContext3(ppDeferredContext)
    }

    /**
     * 
     * @param {ID3D11Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<D3D11_BOX>} pDstBox 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} SrcRowPitch 
     * @param {Integer} SrcDepthPitch 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-writetosubresource
     */
    WriteToSubresource(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(63, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, pSrcDataMarshal, pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch)
    }

    /**
     * 
     * @param {Pointer<Void>} pDstData 
     * @param {Integer} DstRowPitch 
     * @param {Integer} DstDepthPitch 
     * @param {ID3D11Resource} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Pointer<D3D11_BOX>} pSrcBox 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11device3-readfromsubresource
     */
    ReadFromSubresource(pDstData, DstRowPitch, DstDepthPitch, pSrcResource, SrcSubresource, pSrcBox) {
        pDstDataMarshal := pDstData is VarRef ? "ptr" : "ptr"

        ComCall(64, this, pDstDataMarshal, pDstData, "uint", DstRowPitch, "uint", DstDepthPitch, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox)
    }
}
