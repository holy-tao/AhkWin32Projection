#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A shader-variable interface accesses a shader variable.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectshadervariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectShaderVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectShaderVariable
     * @type {Guid}
     */
    static IID => Guid("{80849279-c799-4797-8c33-0407a07d9e06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetShaderDesc", "GetVertexShader", "GetGeometryShader", "GetPixelShader", "GetInputSignatureElementDesc", "GetOutputSignatureElementDesc"]

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @param {Pointer<D3D10_EFFECT_SHADER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getshaderdesc
     */
    GetShaderDesc(ShaderIndex, pDesc) {
        result := ComCall(25, this, "uint", ShaderIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @param {Pointer<ID3D10VertexShader>} ppVS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getvertexshader
     */
    GetVertexShader(ShaderIndex, ppVS) {
        result := ComCall(26, this, "uint", ShaderIndex, "ptr*", ppVS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @param {Pointer<ID3D10GeometryShader>} ppGS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getgeometryshader
     */
    GetGeometryShader(ShaderIndex, ppGS) {
        result := ComCall(27, this, "uint", ShaderIndex, "ptr*", ppGS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @param {Pointer<ID3D10PixelShader>} ppPS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getpixelshader
     */
    GetPixelShader(ShaderIndex, ppPS) {
        result := ComCall(28, this, "uint", ShaderIndex, "ptr*", ppPS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @param {Integer} Element 
     * @param {Pointer<D3D10_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getinputsignatureelementdesc
     */
    GetInputSignatureElementDesc(ShaderIndex, Element, pDesc) {
        result := ComCall(29, this, "uint", ShaderIndex, "uint", Element, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @param {Integer} Element 
     * @param {Pointer<D3D10_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getoutputsignatureelementdesc
     */
    GetOutputSignatureElementDesc(ShaderIndex, Element, pDesc) {
        result := ComCall(30, this, "uint", ShaderIndex, "uint", Element, "ptr", pDesc, "HRESULT")
        return result
    }
}
