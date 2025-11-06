#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D10_EFFECT_SHADER_DESC.ahk
#Include .\ID3D10VertexShader.ahk
#Include .\ID3D10GeometryShader.ahk
#Include .\ID3D10PixelShader.ahk
#Include .\D3D10_SIGNATURE_PARAMETER_DESC.ahk
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
     * @returns {D3D10_EFFECT_SHADER_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getshaderdesc
     */
    GetShaderDesc(ShaderIndex) {
        pDesc := D3D10_EFFECT_SHADER_DESC()
        result := ComCall(25, this, "uint", ShaderIndex, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @returns {ID3D10VertexShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getvertexshader
     */
    GetVertexShader(ShaderIndex) {
        result := ComCall(26, this, "uint", ShaderIndex, "ptr*", &ppVS := 0, "HRESULT")
        return ID3D10VertexShader(ppVS)
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @returns {ID3D10GeometryShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getgeometryshader
     */
    GetGeometryShader(ShaderIndex) {
        result := ComCall(27, this, "uint", ShaderIndex, "ptr*", &ppGS := 0, "HRESULT")
        return ID3D10GeometryShader(ppGS)
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @returns {ID3D10PixelShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getpixelshader
     */
    GetPixelShader(ShaderIndex) {
        result := ComCall(28, this, "uint", ShaderIndex, "ptr*", &ppPS := 0, "HRESULT")
        return ID3D10PixelShader(ppPS)
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @param {Integer} Element 
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getinputsignatureelementdesc
     */
    GetInputSignatureElementDesc(ShaderIndex, Element) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(29, this, "uint", ShaderIndex, "uint", Element, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} ShaderIndex 
     * @param {Integer} Element 
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getoutputsignatureelementdesc
     */
    GetOutputSignatureElementDesc(ShaderIndex, Element) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(30, this, "uint", ShaderIndex, "uint", Element, "ptr", pDesc, "HRESULT")
        return pDesc
    }
}
