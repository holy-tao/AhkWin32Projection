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
     * Get a shader description.
     * @param {Integer} ShaderIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {D3D10_EFFECT_SHADER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_shader_desc">D3D10_EFFECT_SHADER_DESC</a>*</b>
     * 
     * A pointer to a shader description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_shader_desc">D3D10_EFFECT_SHADER_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getshaderdesc
     */
    GetShaderDesc(ShaderIndex) {
        pDesc := D3D10_EFFECT_SHADER_DESC()
        result := ComCall(25, this, "uint", ShaderIndex, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get a vertex shader.
     * @param {Integer} ShaderIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10VertexShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10vertexshader">ID3D10VertexShader</a>**</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10vertexshader">ID3D10VertexShader Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getvertexshader
     */
    GetVertexShader(ShaderIndex) {
        result := ComCall(26, this, "uint", ShaderIndex, "ptr*", &ppVS := 0, "HRESULT")
        return ID3D10VertexShader(ppVS)
    }

    /**
     * Get a geometry shader.
     * @param {Integer} ShaderIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10GeometryShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader</a>**</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getgeometryshader
     */
    GetGeometryShader(ShaderIndex) {
        result := ComCall(27, this, "uint", ShaderIndex, "ptr*", &ppGS := 0, "HRESULT")
        return ID3D10GeometryShader(ppGS)
    }

    /**
     * Get a pixel shader.
     * @param {Integer} ShaderIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10PixelShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10pixelshader">ID3D10PixelShader</a>**</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10pixelshader">ID3D10PixelShader Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getpixelshader
     */
    GetPixelShader(ShaderIndex) {
        result := ComCall(28, this, "uint", ShaderIndex, "ptr*", &ppPS := 0, "HRESULT")
        return ID3D10PixelShader(ppPS)
    }

    /**
     * Get an input-signature description.
     * @param {Integer} ShaderIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based shader index.
     * @param {Integer} Element Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based shader-element index.
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a parameter description (see <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getinputsignatureelementdesc
     */
    GetInputSignatureElementDesc(ShaderIndex, Element) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(29, this, "uint", ShaderIndex, "uint", Element, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get an output-signature description.
     * @param {Integer} ShaderIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based shader index.
     * @param {Integer} Element Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based element index.
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a parameter description (see <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getoutputsignatureelementdesc
     */
    GetOutputSignatureElementDesc(ShaderIndex, Element) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(30, this, "uint", ShaderIndex, "uint", Element, "ptr", pDesc, "HRESULT")
        return pDesc
    }
}
