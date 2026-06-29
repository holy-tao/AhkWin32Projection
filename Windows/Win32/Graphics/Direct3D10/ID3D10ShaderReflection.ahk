#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D10_SHADER_DESC.ahk" { D3D10_SHADER_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10ShaderReflectionConstantBuffer.ahk" { ID3D10ShaderReflectionConstantBuffer }
#Import ".\D3D10_SIGNATURE_PARAMETER_DESC.ahk" { D3D10_SIGNATURE_PARAMETER_DESC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\D3D10_SHADER_INPUT_BIND_DESC.ahk" { D3D10_SHADER_INPUT_BIND_DESC }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A shader-reflection interface accesses shader information. (ID3D10ShaderReflection)
 * @remarks
 * Create the interface by calling <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10reflectshader">D3DX10ReflectShader</a>. Since it is a COM interface, creating the interface increases a reference count and the interface must be released when it is no longer needed. The remaining shader-reflection interfaces are not COM interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nn-d3d10shader-id3d10shaderreflection
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10ShaderReflection extends IUnknown {
    /**
     * The interface identifier for ID3D10ShaderReflection
     * @type {Guid}
     */
    static IID := Guid("{d40e20b6-f8f7-42ad-ab20-4baf8f15dfaa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10ShaderReflection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDesc                  : IntPtr
        GetConstantBufferByIndex : IntPtr
        GetConstantBufferByName  : IntPtr
        GetResourceBindingDesc   : IntPtr
        GetInputParameterDesc    : IntPtr
        GetOutputParameterDesc   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10ShaderReflection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a shader description. (ID3D10ShaderReflection.GetDesc)
     * @returns {D3D10_SHADER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_desc">D3D10_SHADER_DESC</a>*</b>
     * 
     * A pointer to a shader description. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_desc">D3D10_SHADER_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D10_SHADER_DESC()
        result := ComCall(3, this, D3D10_SHADER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * The ID3D10ShaderReflection::GetConstantBufferByIndex (d3d10shader.h) method gets a constant buffer by index.
     * @remarks
     * A constant buffer supplies either scalar constants or texture constants to a shader. A shader can use one or more constant buffers. For best performance, separate constants into buffers based on the frequency they are updated.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D10ShaderReflectionConstantBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer">ID3D10ShaderReflectionConstantBuffer</a>*</b>
     * 
     * A pointer to a constant buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer">ID3D10ShaderReflectionConstantBuffer Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, ID3D10ShaderReflectionConstantBuffer)
        return result
    }

    /**
     * Get a constant buffer by name. (ID3D10ShaderReflection.GetConstantBufferByName)
     * @remarks
     * A constant buffer supplies either scalar constants or texture constants to a shader. A shader can use one or more constant buffers. For best performance, separate constants into buffers based on the frequency they are updated.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The constant-buffer name.
     * @returns {ID3D10ShaderReflectionConstantBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer">ID3D10ShaderReflectionConstantBuffer</a>*</b>
     * 
     * A pointer to a constant buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer">ID3D10ShaderReflectionConstantBuffer Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyname
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, ID3D10ShaderReflectionConstantBuffer)
        return result
    }

    /**
     * Get a description of the resources bound to a shader.
     * @remarks
     * A shader consists of executable code (the compiled HLSL functions) and a set of resources that supply the shader with input data. This API gets a list of the resources that are bound as inputs to the shader.
     * @param {Integer} ResourceIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based resource index.
     * @returns {D3D10_SHADER_INPUT_BIND_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_input_bind_desc">D3D10_SHADER_INPUT_BIND_DESC</a>*</b>
     * 
     * A pointer to an input-binding description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_input_bind_desc">D3D10_SHADER_INPUT_BIND_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getresourcebindingdesc
     */
    GetResourceBindingDesc(ResourceIndex) {
        pDesc := D3D10_SHADER_INPUT_BIND_DESC()
        result := ComCall(6, this, "uint", ResourceIndex, D3D10_SHADER_INPUT_BIND_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get an input-parameter description for a shader. (ID3D10ShaderReflection.GetInputParameterDesc)
     * @remarks
     * An input-parameter description is also called a shader signature. The shader signature contains information about the input parameters such as the order or parameters, their data type, and a parameter semantic.
     * @param {Integer} ParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based parameter index.
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a shader-input-signature description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getinputparameterdesc
     */
    GetInputParameterDesc(ParameterIndex) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(7, this, "uint", ParameterIndex, D3D10_SIGNATURE_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get an output-parameter description for a shader. (ID3D10ShaderReflection.GetOutputParameterDesc)
     * @remarks
     * An output-parameter description is also called a shader signature. The shader signature contains information about the output parameters such as the order or parameters, their data type, and a parameter semantic.
     * @param {Integer} ParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based parameter index.
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a shader-output-parameter description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getoutputparameterdesc
     */
    GetOutputParameterDesc(ParameterIndex) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(8, this, "uint", ParameterIndex, D3D10_SIGNATURE_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    Query(iid) {
        if (ID3D10ShaderReflection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
        this.vtbl.GetConstantBufferByIndex := CallbackCreate(GetMethod(implObj, "GetConstantBufferByIndex"), flags, 2)
        this.vtbl.GetConstantBufferByName := CallbackCreate(GetMethod(implObj, "GetConstantBufferByName"), flags, 2)
        this.vtbl.GetResourceBindingDesc := CallbackCreate(GetMethod(implObj, "GetResourceBindingDesc"), flags, 3)
        this.vtbl.GetInputParameterDesc := CallbackCreate(GetMethod(implObj, "GetInputParameterDesc"), flags, 3)
        this.vtbl.GetOutputParameterDesc := CallbackCreate(GetMethod(implObj, "GetOutputParameterDesc"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
        CallbackFree(this.vtbl.GetConstantBufferByIndex)
        CallbackFree(this.vtbl.GetConstantBufferByName)
        CallbackFree(this.vtbl.GetResourceBindingDesc)
        CallbackFree(this.vtbl.GetInputParameterDesc)
        CallbackFree(this.vtbl.GetOutputParameterDesc)
    }
}
