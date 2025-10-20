#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The ID3D10EffectVariable interface is the base class for all effect variables.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectVariable extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectVariable
     * @type {Guid}
     */
    static IID => Guid("{ae897105-00e6-45bf-bb8e-281dd6db8e1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValid", "GetType", "GetDesc", "GetAnnotationByIndex", "GetAnnotationByName", "GetMemberByIndex", "GetMemberByName", "GetMemberBySemantic", "GetElement", "GetParentConstantBuffer", "AsScalar", "AsVector", "AsMatrix", "AsString", "AsShaderResource", "AsRenderTargetView", "AsDepthStencilView", "AsConstantBuffer", "AsShader", "AsBlend", "AsDepthStencil", "AsRasterizer", "AsSampler", "SetRawValue", "GetRawValue"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-isvalid
     */
    IsValid() {
        result := ComCall(0, this, "int")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-gettype
     */
    GetType() {
        result := ComCall(1, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_EFFECT_VARIABLE_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(2, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getannotationbyindex
     */
    GetAnnotationByIndex(Index) {
        result := ComCall(3, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getannotationbyname
     */
    GetAnnotationByName(Name) {
        result := ComCall(4, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getmemberbyindex
     */
    GetMemberByIndex(Index) {
        result := ComCall(5, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getmemberbyname
     */
    GetMemberByName(Name) {
        result := ComCall(6, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Semantic 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getmemberbysemantic
     */
    GetMemberBySemantic(Semantic) {
        result := ComCall(7, this, "ptr", Semantic, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getelement
     */
    GetElement(Index) {
        result := ComCall(8, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getparentconstantbuffer
     */
    GetParentConstantBuffer() {
        result := ComCall(9, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectScalarVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asscalar
     */
    AsScalar() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectVectorVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asvector
     */
    AsVector() {
        result := ComCall(11, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectMatrixVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asmatrix
     */
    AsMatrix() {
        result := ComCall(12, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectStringVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asstring
     */
    AsString() {
        result := ComCall(13, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectShaderResourceVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asshaderresource
     */
    AsShaderResource() {
        result := ComCall(14, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectRenderTargetViewVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asrendertargetview
     */
    AsRenderTargetView() {
        result := ComCall(15, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectDepthStencilViewVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asdepthstencilview
     */
    AsDepthStencilView() {
        result := ComCall(16, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asconstantbuffer
     */
    AsConstantBuffer() {
        result := ComCall(17, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectShaderVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asshader
     */
    AsShader() {
        result := ComCall(18, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectBlendVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asblend
     */
    AsBlend() {
        result := ComCall(19, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectDepthStencilVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asdepthstencil
     */
    AsDepthStencil() {
        result := ComCall(20, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectRasterizerVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-asrasterizer
     */
    AsRasterizer() {
        result := ComCall(21, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D10EffectSamplerVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-assampler
     */
    AsSampler() {
        result := ComCall(22, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} Offset 
     * @param {Integer} ByteCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-setrawvalue
     */
    SetRawValue(pData, Offset, ByteCount) {
        result := ComCall(23, this, "ptr", pData, "uint", Offset, "uint", ByteCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} Offset 
     * @param {Integer} ByteCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getrawvalue
     */
    GetRawValue(pData, Offset, ByteCount) {
        result := ComCall(24, this, "ptr", pData, "uint", Offset, "uint", ByteCount, "HRESULT")
        return result
    }
}
