#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10PixelShader.ahk" { ID3D10PixelShader }
#Import ".\ID3D10VertexShader.ahk" { ID3D10VertexShader }
#Import ".\ID3D10GeometryShader.ahk" { ID3D10GeometryShader }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }
#Import ".\D3D10_EFFECT_SHADER_DESC.ahk" { D3D10_EFFECT_SHADER_DESC }
#Import ".\D3D10_SIGNATURE_PARAMETER_DESC.ahk" { D3D10_SIGNATURE_PARAMETER_DESC }

/**
 * A shader-variable interface accesses a shader variable.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectshadervariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectShaderVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectShaderVariable
     * @type {Guid}
     */
    static IID := Guid("{80849279-c799-4797-8c33-0407a07d9e06}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectShaderVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        GetShaderDesc                 : IntPtr
        GetVertexShader               : IntPtr
        GetGeometryShader             : IntPtr
        GetPixelShader                : IntPtr
        GetInputSignatureElementDesc  : IntPtr
        GetOutputSignatureElementDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectShaderVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a shader description. (ID3D10EffectShaderVariable.GetShaderDesc)
     * @param {Integer} ShaderIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {D3D10_EFFECT_SHADER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_shader_desc">D3D10_EFFECT_SHADER_DESC</a>*</b>
     * 
     * A pointer to a shader description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_shader_desc">D3D10_EFFECT_SHADER_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getshaderdesc
     */
    GetShaderDesc(ShaderIndex) {
        pDesc := D3D10_EFFECT_SHADER_DESC()
        result := ComCall(25, this, "uint", ShaderIndex, D3D10_EFFECT_SHADER_DESC.Ptr, pDesc, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getvertexshader
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getgeometryshader
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getpixelshader
     */
    GetPixelShader(ShaderIndex) {
        result := ComCall(28, this, "uint", ShaderIndex, "ptr*", &ppPS := 0, "HRESULT")
        return ID3D10PixelShader(ppPS)
    }

    /**
     * Get an input-signature description.
     * @remarks
     * An effect contains one or more shaders; each shader has an input and output signature; each signature contains one or more elements (or parameters). The shader index identifies the shader and the element index identifies the element (or parameter) in the shader signature.
     * @param {Integer} ShaderIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based shader index.
     * @param {Integer} Element Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based shader-element index.
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a parameter description (see <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getinputsignatureelementdesc
     */
    GetInputSignatureElementDesc(ShaderIndex, Element) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(29, this, "uint", ShaderIndex, "uint", Element, D3D10_SIGNATURE_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get an output-signature description.
     * @remarks
     * An effect contains one or more shaders; each shader has an input and output signature; each signature contains one or more elements (or parameters). The shader index identifies the shader and the element index identifies the element (or parameter) in the shader signature.
     * @param {Integer} ShaderIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based shader index.
     * @param {Integer} Element Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based element index.
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a parameter description (see <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getoutputsignatureelementdesc
     */
    GetOutputSignatureElementDesc(ShaderIndex, Element) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(30, this, "uint", ShaderIndex, "uint", Element, D3D10_SIGNATURE_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    Query(iid) {
        if (ID3D10EffectShaderVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetShaderDesc := CallbackCreate(GetMethod(implObj, "GetShaderDesc"), flags, 3)
        this.vtbl.GetVertexShader := CallbackCreate(GetMethod(implObj, "GetVertexShader"), flags, 3)
        this.vtbl.GetGeometryShader := CallbackCreate(GetMethod(implObj, "GetGeometryShader"), flags, 3)
        this.vtbl.GetPixelShader := CallbackCreate(GetMethod(implObj, "GetPixelShader"), flags, 3)
        this.vtbl.GetInputSignatureElementDesc := CallbackCreate(GetMethod(implObj, "GetInputSignatureElementDesc"), flags, 4)
        this.vtbl.GetOutputSignatureElementDesc := CallbackCreate(GetMethod(implObj, "GetOutputSignatureElementDesc"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetShaderDesc)
        CallbackFree(this.vtbl.GetVertexShader)
        CallbackFree(this.vtbl.GetGeometryShader)
        CallbackFree(this.vtbl.GetPixelShader)
        CallbackFree(this.vtbl.GetInputSignatureElementDesc)
        CallbackFree(this.vtbl.GetOutputSignatureElementDesc)
    }
}
