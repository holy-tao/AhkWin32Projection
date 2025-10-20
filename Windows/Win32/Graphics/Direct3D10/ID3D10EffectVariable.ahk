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
     * 
     * @returns {BOOL} 
     */
    IsValid() {
        result := ComCall(0, this, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectType>} 
     */
    GetType() {
        result := ComCall(1, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_EFFECT_VARIABLE_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetDesc(pDesc) {
        result := ComCall(2, this, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Pointer<ID3D10EffectVariable>} 
     */
    GetAnnotationByIndex(Index) {
        result := ComCall(3, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {Pointer<ID3D10EffectVariable>} 
     */
    GetAnnotationByName(Name) {
        result := ComCall(4, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Pointer<ID3D10EffectVariable>} 
     */
    GetMemberByIndex(Index) {
        result := ComCall(5, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {Pointer<ID3D10EffectVariable>} 
     */
    GetMemberByName(Name) {
        result := ComCall(6, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Semantic 
     * @returns {Pointer<ID3D10EffectVariable>} 
     */
    GetMemberBySemantic(Semantic) {
        result := ComCall(7, this, "ptr", Semantic, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Pointer<ID3D10EffectVariable>} 
     */
    GetElement(Index) {
        result := ComCall(8, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectConstantBuffer>} 
     */
    GetParentConstantBuffer() {
        result := ComCall(9, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectScalarVariable>} 
     */
    AsScalar() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectVectorVariable>} 
     */
    AsVector() {
        result := ComCall(11, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectMatrixVariable>} 
     */
    AsMatrix() {
        result := ComCall(12, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectStringVariable>} 
     */
    AsString() {
        result := ComCall(13, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectShaderResourceVariable>} 
     */
    AsShaderResource() {
        result := ComCall(14, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectRenderTargetViewVariable>} 
     */
    AsRenderTargetView() {
        result := ComCall(15, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectDepthStencilViewVariable>} 
     */
    AsDepthStencilView() {
        result := ComCall(16, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectConstantBuffer>} 
     */
    AsConstantBuffer() {
        result := ComCall(17, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectShaderVariable>} 
     */
    AsShader() {
        result := ComCall(18, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectBlendVariable>} 
     */
    AsBlend() {
        result := ComCall(19, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectDepthStencilVariable>} 
     */
    AsDepthStencil() {
        result := ComCall(20, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectRasterizerVariable>} 
     */
    AsRasterizer() {
        result := ComCall(21, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D10EffectSamplerVariable>} 
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
     */
    SetRawValue(pData, Offset, ByteCount) {
        result := ComCall(23, this, "ptr", pData, "uint", Offset, "uint", ByteCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} Offset 
     * @param {Integer} ByteCount 
     * @returns {HRESULT} 
     */
    GetRawValue(pData, Offset, ByteCount) {
        result := ComCall(24, this, "ptr", pData, "uint", Offset, "uint", ByteCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
