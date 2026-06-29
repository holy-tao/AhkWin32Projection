#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D10_SIGNATURE_PARAMETER_DESC.ahk" { D3D10_SIGNATURE_PARAMETER_DESC }
#Import "..\Direct3D\D3D_PRIMITIVE.ahk" { D3D_PRIMITIVE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D10ShaderReflectionConstantBuffer.ahk" { ID3D10ShaderReflectionConstantBuffer }
#Import ".\ID3D10ShaderReflectionVariable.ahk" { ID3D10ShaderReflectionVariable }
#Import ".\D3D10_SHADER_INPUT_BIND_DESC.ahk" { D3D10_SHADER_INPUT_BIND_DESC }
#Import ".\D3D10_SHADER_DESC.ahk" { D3D10_SHADER_DESC }

/**
 * A shader-reflection interface accesses shader information. (ID3D10ShaderReflection1)
 * @remarks
 * This interface requires Windows Vista Service Pack 1.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nn-d3d10_1shader-id3d10shaderreflection1
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10ShaderReflection1 extends IUnknown {
    /**
     * The interface identifier for ID3D10ShaderReflection1
     * @type {Guid}
     */
    static IID := Guid("{c3457783-a846-47ce-9520-cea6f66e7447}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10ShaderReflection1 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDesc                       : IntPtr
        GetConstantBufferByIndex      : IntPtr
        GetConstantBufferByName       : IntPtr
        GetResourceBindingDesc        : IntPtr
        GetInputParameterDesc         : IntPtr
        GetOutputParameterDesc        : IntPtr
        GetVariableByName             : IntPtr
        GetResourceBindingDescByName  : IntPtr
        GetMovInstructionCount        : IntPtr
        GetMovcInstructionCount       : IntPtr
        GetConversionInstructionCount : IntPtr
        GetBitwiseInstructionCount    : IntPtr
        GetGSInputPrimitive           : IntPtr
        IsLevel9Shader                : IntPtr
        IsSampleFrequencyShader       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10ShaderReflection1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {D3D10_SHADER_DESC} 
     */
    GetDesc() {
        pDesc := D3D10_SHADER_DESC()
        result := ComCall(3, this, D3D10_SHADER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10ShaderReflectionConstantBuffer} 
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, ID3D10ShaderReflectionConstantBuffer)
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10ShaderReflectionConstantBuffer} 
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, ID3D10ShaderReflectionConstantBuffer)
        return result
    }

    /**
     * 
     * @param {Integer} ResourceIndex 
     * @returns {D3D10_SHADER_INPUT_BIND_DESC} 
     */
    GetResourceBindingDesc(ResourceIndex) {
        pDesc := D3D10_SHADER_INPUT_BIND_DESC()
        result := ComCall(6, this, "uint", ResourceIndex, D3D10_SHADER_INPUT_BIND_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} 
     */
    GetInputParameterDesc(ParameterIndex) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(7, this, "uint", ParameterIndex, D3D10_SIGNATURE_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} 
     */
    GetOutputParameterDesc(ParameterIndex) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(8, this, "uint", ParameterIndex, D3D10_SIGNATURE_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a variable by name. (ID3D10ShaderReflection1.GetVariableByName)
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a>*</b>
     * 
     * A pointer to a string containing the variable name.
     * @returns {ID3D10ShaderReflectionVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable">ID3D10ShaderReflectionVariable</a>*</b>
     * 
     * Returns a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable">ID3D10ShaderReflectionVariable Interface</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(9, this, "ptr", Name, ID3D10ShaderReflectionVariable)
        return result
    }

    /**
     * Gets a resource binding description by name.
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a>*</b>
     * 
     * A pointer to a string containing the variable name.
     * @returns {D3D10_SHADER_INPUT_BIND_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_input_bind_desc">D3D10_SHADER_INPUT_BIND_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_input_bind_desc">D3D10_SHADER_INPUT_BIND_DESC</a> structure that will be populated with resource binding information.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getresourcebindingdescbyname
     */
    GetResourceBindingDescByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        pDesc := D3D10_SHADER_INPUT_BIND_DESC()
        result := ComCall(10, this, "ptr", Name, D3D10_SHADER_INPUT_BIND_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets the number of Mov instructions. (ID3D10ShaderReflection1.GetMovInstructionCount)
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the number of Mov instructions.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getmovinstructioncount
     */
    GetMovInstructionCount() {
        result := ComCall(11, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the number of Movc instructions. (ID3D10ShaderReflection1.GetMovcInstructionCount)
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the number of Movc instructions.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getmovcinstructioncount
     */
    GetMovcInstructionCount() {
        result := ComCall(12, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the number of conversion instructions used in a shader.
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a UINT that will contain the conversion instruction count when the method returns.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getconversioninstructioncount
     */
    GetConversionInstructionCount() {
        result := ComCall(13, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the number of bitwise instructions. (ID3D10ShaderReflection1.GetBitwiseInstructionCount)
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the number of bitwise instructions.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getbitwiseinstructioncount
     */
    GetBitwiseInstructionCount() {
        result := ComCall(14, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the geometry-shader input-primitive description. (ID3D10ShaderReflection1.GetGSInputPrimitive)
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @returns {D3D_PRIMITIVE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive">D3D10_PRIMITIVE</a>*</b>
     * 
     * A pointer to the input-primitive type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive">D3D10_PRIMITIVE</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getgsinputprimitive
     */
    GetGSInputPrimitive() {
        result := ComCall(15, this, "int*", &pPrim := 0, "HRESULT")
        return pPrim
    }

    /**
     * Indicates whether a shader was compiled in Direct3D 10 on Direct3D 9 mode.
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to a BOOL variable that will be set true if the shader was compiled in Direct3D 10 on Direct3D 9 mode; otherwise false.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-islevel9shader
     */
    IsLevel9Shader() {
        result := ComCall(16, this, BOOL.Ptr, &pbLevel9Shader := 0, "HRESULT")
        return pbLevel9Shader
    }

    /**
     * Indicates whether a pixel shader is intended to run a pixel frequency or sample frequency.
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to a BOOL variable that will be set to true if the shader is intended to run at sample frequency; false otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-issamplefrequencyshader
     */
    IsSampleFrequencyShader() {
        result := ComCall(17, this, BOOL.Ptr, &pbSampleFrequency := 0, "HRESULT")
        return pbSampleFrequency
    }

    Query(iid) {
        if (ID3D10ShaderReflection1.IID.Equals(iid)) {
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
        this.vtbl.GetVariableByName := CallbackCreate(GetMethod(implObj, "GetVariableByName"), flags, 2)
        this.vtbl.GetResourceBindingDescByName := CallbackCreate(GetMethod(implObj, "GetResourceBindingDescByName"), flags, 3)
        this.vtbl.GetMovInstructionCount := CallbackCreate(GetMethod(implObj, "GetMovInstructionCount"), flags, 2)
        this.vtbl.GetMovcInstructionCount := CallbackCreate(GetMethod(implObj, "GetMovcInstructionCount"), flags, 2)
        this.vtbl.GetConversionInstructionCount := CallbackCreate(GetMethod(implObj, "GetConversionInstructionCount"), flags, 2)
        this.vtbl.GetBitwiseInstructionCount := CallbackCreate(GetMethod(implObj, "GetBitwiseInstructionCount"), flags, 2)
        this.vtbl.GetGSInputPrimitive := CallbackCreate(GetMethod(implObj, "GetGSInputPrimitive"), flags, 2)
        this.vtbl.IsLevel9Shader := CallbackCreate(GetMethod(implObj, "IsLevel9Shader"), flags, 2)
        this.vtbl.IsSampleFrequencyShader := CallbackCreate(GetMethod(implObj, "IsSampleFrequencyShader"), flags, 2)
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
        CallbackFree(this.vtbl.GetVariableByName)
        CallbackFree(this.vtbl.GetResourceBindingDescByName)
        CallbackFree(this.vtbl.GetMovInstructionCount)
        CallbackFree(this.vtbl.GetMovcInstructionCount)
        CallbackFree(this.vtbl.GetConversionInstructionCount)
        CallbackFree(this.vtbl.GetBitwiseInstructionCount)
        CallbackFree(this.vtbl.GetGSInputPrimitive)
        CallbackFree(this.vtbl.IsLevel9Shader)
        CallbackFree(this.vtbl.IsSampleFrequencyShader)
    }
}
