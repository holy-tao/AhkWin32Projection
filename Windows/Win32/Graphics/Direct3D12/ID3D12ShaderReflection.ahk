#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_SHADER_DESC.ahk" { D3D12_SHADER_DESC }
#Import ".\D3D12_SHADER_INPUT_BIND_DESC.ahk" { D3D12_SHADER_INPUT_BIND_DESC }
#Import ".\ID3D12ShaderReflectionConstantBuffer.ahk" { ID3D12ShaderReflectionConstantBuffer }
#Import ".\ID3D12ShaderReflectionVariable.ahk" { ID3D12ShaderReflectionVariable }
#Import "..\Direct3D\D3D_PRIMITIVE.ahk" { D3D_PRIMITIVE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\D3D12_SIGNATURE_PARAMETER_DESC.ahk" { D3D12_SIGNATURE_PARAMETER_DESC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Direct3D\D3D_FEATURE_LEVEL.ahk" { D3D_FEATURE_LEVEL }

/**
 * A shader-reflection interface accesses shader information. (ID3D12ShaderReflection)
 * @remarks
 * An <b>ID3D12ShaderReflection</b> interface can be retrieved for a shader by using <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dreflect">D3DReflect</a>.
 * 
 * > [!NOTE]
 * > This function from `d3dcompiler.dll` supports Shader Model 2 - 5.1. For Shader Model 6 shader reflection, see `dxcompiler.dll` and  [Using dxc.exe and dxcompiler.dll](https://github.com/microsoft/DirectXShaderCompiler/wiki/Using-dxc.exe-and-dxcompiler.dll).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12shaderreflection
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12ShaderReflection extends IUnknown {
    /**
     * The interface identifier for ID3D12ShaderReflection
     * @type {Guid}
     */
    static IID := Guid("{5a58797d-a72c-478d-8ba2-efc6b0efe88e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12ShaderReflection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDesc                       : IntPtr
        GetConstantBufferByIndex      : IntPtr
        GetConstantBufferByName       : IntPtr
        GetResourceBindingDesc        : IntPtr
        GetInputParameterDesc         : IntPtr
        GetOutputParameterDesc        : IntPtr
        GetPatchConstantParameterDesc : IntPtr
        GetVariableByName             : IntPtr
        GetResourceBindingDescByName  : IntPtr
        GetMovInstructionCount        : IntPtr
        GetMovcInstructionCount       : IntPtr
        GetConversionInstructionCount : IntPtr
        GetBitwiseInstructionCount    : IntPtr
        GetGSInputPrimitive           : IntPtr
        IsSampleFrequencyShader       : IntPtr
        GetNumInterfaceSlots          : IntPtr
        GetMinFeatureLevel            : IntPtr
        GetThreadGroupSize            : IntPtr
        GetRequiresFlags              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12ShaderReflection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a shader description.
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {D3D12_SHADER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_shader_desc">D3D12_SHADER_DESC</a>*</b>
     * 
     * A shader description, as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_shader_desc">D3D12_SHADER_DESC</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D12_SHADER_DESC()
        result := ComCall(3, this, D3D12_SHADER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a constant buffer by index.
     * @remarks
     * A constant buffer supplies either scalar constants or texture constants to a shader. A shader can use one or more constant buffers. For best performance, separate constants into buffers based on the frequency they are updated.
     *       
     * 
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D12ShaderReflectionConstantBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a>*</b>
     * 
     * A pointer to a constant buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, ID3D12ShaderReflectionConstantBuffer)
        return result
    }

    /**
     * Gets a constant buffer by name.
     * @remarks
     * A constant buffer supplies either scalar constants or texture constants to a shader.
     *         A shader can use one or more constant buffers.
     *         For best performance, separate constants into buffers based on the frequency they are updated.
     *       
     * 
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The constant-buffer name.
     * @returns {ID3D12ShaderReflectionConstantBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a>*</b>
     * 
     * A pointer to a constant buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getconstantbufferbyname
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, ID3D12ShaderReflectionConstantBuffer)
        return result
    }

    /**
     * Gets a description of how a resource is bound to a shader. (ID3D12ShaderReflection.GetResourceBindingDesc)
     * @remarks
     * A shader consists of executable code (the compiled HLSL functions) and a set of resources that supply the shader with input data. <b>GetResourceBindingDesc</b> gets information about how one resource in the set is bound as an input to the shader. The  <i>ResourceIndex</i> parameter specifies the index for the resource.
     *       
     * 
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} ResourceIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based resource index.
     * @returns {D3D12_SHADER_INPUT_BIND_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc">D3D12_SHADER_INPUT_BIND_DESC</a>*</b>
     * 
     * A pointer to an input-binding description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc">D3D12_SHADER_INPUT_BIND_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getresourcebindingdesc
     */
    GetResourceBindingDesc(ResourceIndex) {
        pDesc := D3D12_SHADER_INPUT_BIND_DESC()
        result := ComCall(6, this, "uint", ResourceIndex, D3D12_SHADER_INPUT_BIND_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets an input-parameter description for a shader.
     * @remarks
     * An input-parameter description is also called a shader signature.
     *         The shader signature contains information about the input parameters such as the order or parameters, their data type, and a parameter semantic.
     *       
     * 
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} ParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based parameter index.
     * @returns {D3D12_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_signature_parameter_desc">D3D12_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a shader-input-signature description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_signature_parameter_desc">D3D12_SIGNATURE_PARAMETER_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getinputparameterdesc
     */
    GetInputParameterDesc(ParameterIndex) {
        pDesc := D3D12_SIGNATURE_PARAMETER_DESC()
        result := ComCall(7, this, "uint", ParameterIndex, D3D12_SIGNATURE_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets an output-parameter description for a shader.
     * @remarks
     * An output-parameter description is also called a shader signature. The shader signature contains information about the output parameters such as the order or parameters, their data type, and a parameter semantic.
     *       
     * 
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} ParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based parameter index.
     * @returns {D3D12_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_signature_parameter_desc">D3D12_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A shader-output-parameter description, as a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_signature_parameter_desc">D3D12_SIGNATURE_PARAMETER_DESC</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getoutputparameterdesc
     */
    GetOutputParameterDesc(ParameterIndex) {
        pDesc := D3D12_SIGNATURE_PARAMETER_DESC()
        result := ComCall(8, this, "uint", ParameterIndex, D3D12_SIGNATURE_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a patch-constant parameter description for a shader.
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} ParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based parameter index.
     * @returns {D3D12_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_signature_parameter_desc">D3D12_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a shader-input-signature description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_signature_parameter_desc">D3D12_SIGNATURE_PARAMETER_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getpatchconstantparameterdesc
     */
    GetPatchConstantParameterDesc(ParameterIndex) {
        pDesc := D3D12_SIGNATURE_PARAMETER_DESC()
        result := ComCall(9, this, "uint", ParameterIndex, D3D12_SIGNATURE_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a variable by name. (ID3D12ShaderReflection.GetVariableByName)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A pointer to a string containing the variable name.
     * @returns {ID3D12ShaderReflectionVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable">ID3D12ShaderReflectionVariable</a>*</b>
     * 
     * Returns a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable">ID3D12ShaderReflectionVariable Interface</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(10, this, "ptr", Name, ID3D12ShaderReflectionVariable)
        return result
    }

    /**
     * Gets a description of how a resource is bound to a shader. (ID3D12ShaderReflection.GetResourceBindingDescByName)
     * @remarks
     * A shader consists of executable code (the compiled HLSL functions) and a set of resources that supply the shader with input data. <b>GetResourceBindingDescByName</b> gets information about how one resource in the set is bound as an input to the shader. The  <i>Name</i> parameter specifies the name of the resource.
     *       
     * 
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The constant-buffer name of the resource.
     * @returns {D3D12_SHADER_INPUT_BIND_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc">D3D12_SHADER_INPUT_BIND_DESC</a>*</b>
     * 
     * A pointer to an input-binding description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc">D3D12_SHADER_INPUT_BIND_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getresourcebindingdescbyname
     */
    GetResourceBindingDescByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        pDesc := D3D12_SHADER_INPUT_BIND_DESC()
        result := ComCall(11, this, "ptr", Name, D3D12_SHADER_INPUT_BIND_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets the number of Mov instructions. (ID3D12ShaderReflection.GetMovInstructionCount)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the number of Mov instructions.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getmovinstructioncount
     */
    GetMovInstructionCount() {
        result := ComCall(12, this, UInt32)
        return result
    }

    /**
     * Gets the number of Movc instructions. (ID3D12ShaderReflection.GetMovcInstructionCount)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the number of Movc instructions.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getmovcinstructioncount
     */
    GetMovcInstructionCount() {
        result := ComCall(13, this, UInt32)
        return result
    }

    /**
     * Gets the number of conversion instructions. (ID3D12ShaderReflection.GetConversionInstructionCount)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the number of conversion instructions.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getconversioninstructioncount
     */
    GetConversionInstructionCount() {
        result := ComCall(14, this, UInt32)
        return result
    }

    /**
     * Gets the number of bitwise instructions. (ID3D12ShaderReflection.GetBitwiseInstructionCount)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bitwise instructions.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getbitwiseinstructioncount
     */
    GetBitwiseInstructionCount() {
        result := ComCall(15, this, UInt32)
        return result
    }

    /**
     * Gets the geometry-shader input-primitive description. (ID3D12ShaderReflection.GetGSInputPrimitive)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {D3D_PRIMITIVE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive">D3D_PRIMITIVE</a></b>
     * 
     * The input-primitive description.  See
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology">D3D_PRIMITIVE_TOPOLOGY</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getgsinputprimitive
     */
    GetGSInputPrimitive() {
        result := ComCall(16, this, D3D_PRIMITIVE)
        return result
    }

    /**
     * Indicates whether a shader is a sample frequency shader. (ID3D12ShaderReflection.IsSampleFrequencyShader)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns true if the shader is a sample frequency shader; otherwise returns false.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-issamplefrequencyshader
     */
    IsSampleFrequencyShader() {
        result := ComCall(17, this, BOOL)
        return result
    }

    /**
     * Gets the number of interface slots in a shader. (ID3D12ShaderReflection.GetNumInterfaceSlots)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of interface slots in the shader.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getnuminterfaceslots
     */
    GetNumInterfaceSlots() {
        result := ComCall(18, this, UInt32)
        return result
    }

    /**
     * Gets the minimum feature level. (ID3D12ShaderReflection.GetMinFeatureLevel)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {D3D_FEATURE_LEVEL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getminfeaturelevel
     */
    GetMinFeatureLevel() {
        result := ComCall(19, this, "int*", &pLevel := 0, "HRESULT")
        return pLevel
    }

    /**
     * Retrieves the sizes, in units of threads, of the X, Y, and Z dimensions of the shader's thread-group grid. (ID3D12ShaderReflection.GetThreadGroupSize)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     *         
     * 
     * When a compute shader is written it defines the actions of a single thread group only. If multiple thread groups are required, it is the role of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-dispatch">ID3D12GraphicsCommandList::Dispatch</a> call to issue multiple thread groups.
     * @param {Pointer<Integer>} pSizeX Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the size, in threads, of the x-dimension of the thread-group grid. The maximum size is 1024.
     * @param {Pointer<Integer>} pSizeY Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the size, in threads, of the y-dimension of the thread-group grid. The maximum size is 1024.
     * @param {Pointer<Integer>} pSizeZ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the size, in threads, of the z-dimension of the thread-group grid. The maximum size is 64.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the total size, in threads, of the thread-group grid by calculating the product of the size of each dimension.
     *             
     * 
     * 
     * ``` syntax
     * *pSizeX * *pSizeY * *pSizeZ;
     * ```
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getthreadgroupsize
     */
    GetThreadGroupSize(pSizeX, pSizeY, pSizeZ) {
        pSizeXMarshal := pSizeX is VarRef ? "uint*" : "ptr"
        pSizeYMarshal := pSizeY is VarRef ? "uint*" : "ptr"
        pSizeZMarshal := pSizeZ is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pSizeXMarshal, pSizeX, pSizeYMarshal, pSizeY, pSizeZMarshal, pSizeZ, UInt32)
        return result
    }

    /**
     * Gets a group of flags that indicates the requirements of a shader. (ID3D12ShaderReflection.GetRequiresFlags)
     * @remarks
     * Here is how the D3D12Shader.h header defines the shader requirements flags:
     *         
     * 
     * 
     * ```cpp
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * A value that contains a combination of one or more shader requirements #define flags; each flag specifies a requirement of the shader.
     *               A default value of 0 means there are no requirements.
     *             
     * 
     * <table>
     * <tr>
     * <th>Shader requirement #define flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_DOUBLES</b></td>
     * <td>Shader requires that the graphics driver and hardware support double data type.
     *                   </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_EARLY_DEPTH_STENCIL</b></td>
     * <td>Shader requires an early depth stencil.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_UAVS_AT_EVERY_STAGE</b></td>
     * <td>Shader requires unordered access views (UAVs) at every pipeline stage.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_64_UAVS</b></td>
     * <td>Shader requires 64 UAVs.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_MINIMUM_PRECISION</b></td>
     * <td>Shader requires the graphics driver and hardware to support minimum precision.
     *                   For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/using-hlsl-minimum-precision">Using HLSL minimum precision</a>.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_11_1_DOUBLE_EXTENSIONS</b></td>
     * <td>Shader requires that the graphics driver and hardware support extended doubles instructions.
     *                   For more info, see the <b>ExtendedDoublesShaderInstructions</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a>.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_11_1_SHADER_EXTENSIONS</b></td>
     * <td>Shader requires that the graphics driver and hardware support the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-msad4">msad4</a> intrinsic function in shaders.
     *                   For more info, see the <b>SAD4ShaderInstructions</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a>.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_LEVEL_9_COMPARISON_FILTERING</b></td>
     * <td>Shader requires that the graphics driver and hardware support Direct3D 9 shadow support.
     *                   </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_TILED_RESOURCES</b></td>
     * <td>Shader requires that the graphics driver and hardware support tiled resources.
     *                   </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_STENCIL_REF</b></td>
     * <td>Shader requires a reference value for depth stencil tests.
     *                   For more info, see the <b>PSSpecifiedStencilRefSupported</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure,
     *                   and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-omsetstencilref">ID3D12GraphicsCommandList::OMSetStencilRef</a>.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_INNER_COVERAGE</b></td>
     * <td>Shader requires that the graphics driver and hardware support inner coverage.For more info, see the enumeration constants D3D_NAME_INNER_COVERAGE and D3D11_NAME_INNER_COVERAGE in <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_name">D3D_NAME</a>.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_TYPED_UAV_LOAD_ADDITIONAL_FORMATS</b></td>
     * <td>Shader requires that the graphics driver and hardware support the loading of additional formats for typed unordered-access views (UAVs).
     *                   See the <b>TypedUAVLoadAdditionalFormats</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_ROVS</b></td>
     * <td>Shader requires that the graphics driver and hardware support rasterizer ordered views (ROVs).
     *                   See <a href="https://docs.microsoft.com/windows/desktop/direct3d12/rasterizer-order-views">Rasterizer Ordered Views</a>.
     *                 </td>
     * </tr>
     * <tr>
     * <td><b>D3D_SHADER_REQUIRES_VIEWPORT_AND_RT_ARRAY_INDEX_FROM_ANY_SHADER_FEEDING_RASTERIZER</b></td>
     * <td>Shader requires that the graphics driver and hardware support viewport and render target array index values from any shader-feeding rasterizer.For more info, see the member <b>VPAndRTArrayIndexFromAnyShaderFeedingRasterizerSupportedWithoutGSEmulation</b> of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure.
     *                 </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getrequiresflags
     */
    GetRequiresFlags() {
        result := ComCall(21, this, Int64)
        return result
    }

    Query(iid) {
        if (ID3D12ShaderReflection.IID.Equals(iid)) {
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
        this.vtbl.GetPatchConstantParameterDesc := CallbackCreate(GetMethod(implObj, "GetPatchConstantParameterDesc"), flags, 3)
        this.vtbl.GetVariableByName := CallbackCreate(GetMethod(implObj, "GetVariableByName"), flags, 2)
        this.vtbl.GetResourceBindingDescByName := CallbackCreate(GetMethod(implObj, "GetResourceBindingDescByName"), flags, 3)
        this.vtbl.GetMovInstructionCount := CallbackCreate(GetMethod(implObj, "GetMovInstructionCount"), flags, 1)
        this.vtbl.GetMovcInstructionCount := CallbackCreate(GetMethod(implObj, "GetMovcInstructionCount"), flags, 1)
        this.vtbl.GetConversionInstructionCount := CallbackCreate(GetMethod(implObj, "GetConversionInstructionCount"), flags, 1)
        this.vtbl.GetBitwiseInstructionCount := CallbackCreate(GetMethod(implObj, "GetBitwiseInstructionCount"), flags, 1)
        this.vtbl.GetGSInputPrimitive := CallbackCreate(GetMethod(implObj, "GetGSInputPrimitive"), flags, 1)
        this.vtbl.IsSampleFrequencyShader := CallbackCreate(GetMethod(implObj, "IsSampleFrequencyShader"), flags, 1)
        this.vtbl.GetNumInterfaceSlots := CallbackCreate(GetMethod(implObj, "GetNumInterfaceSlots"), flags, 1)
        this.vtbl.GetMinFeatureLevel := CallbackCreate(GetMethod(implObj, "GetMinFeatureLevel"), flags, 2)
        this.vtbl.GetThreadGroupSize := CallbackCreate(GetMethod(implObj, "GetThreadGroupSize"), flags, 4)
        this.vtbl.GetRequiresFlags := CallbackCreate(GetMethod(implObj, "GetRequiresFlags"), flags, 1)
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
        CallbackFree(this.vtbl.GetPatchConstantParameterDesc)
        CallbackFree(this.vtbl.GetVariableByName)
        CallbackFree(this.vtbl.GetResourceBindingDescByName)
        CallbackFree(this.vtbl.GetMovInstructionCount)
        CallbackFree(this.vtbl.GetMovcInstructionCount)
        CallbackFree(this.vtbl.GetConversionInstructionCount)
        CallbackFree(this.vtbl.GetBitwiseInstructionCount)
        CallbackFree(this.vtbl.GetGSInputPrimitive)
        CallbackFree(this.vtbl.IsSampleFrequencyShader)
        CallbackFree(this.vtbl.GetNumInterfaceSlots)
        CallbackFree(this.vtbl.GetMinFeatureLevel)
        CallbackFree(this.vtbl.GetThreadGroupSize)
        CallbackFree(this.vtbl.GetRequiresFlags)
    }
}
