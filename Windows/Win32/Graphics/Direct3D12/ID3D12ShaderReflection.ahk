#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_SHADER_DESC.ahk
#Include .\D3D12_SHADER_INPUT_BIND_DESC.ahk
#Include .\D3D12_SIGNATURE_PARAMETER_DESC.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A shader-reflection interface accesses shader information. (ID3D12ShaderReflection)
 * @remarks
 * An <b>ID3D12ShaderReflection</b> interface can be retrieved for a shader by using <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dreflect">D3DReflect</a>.
 * 
 * > [!NOTE]
 * > This function from `d3dcompiler.dll` supports Shader Model 2 - 5.1. For Shader Model 6 shader reflection, see `dxcompiler.dll` and  [Using dxc.exe and dxcompiler.dll](https://github.com/microsoft/DirectXShaderCompiler/wiki/Using-dxc.exe-and-dxcompiler.dll).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12shaderreflection
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ShaderReflection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12ShaderReflection
     * @type {Guid}
     */
    static IID => Guid("{5a58797d-a72c-478d-8ba2-efc6b0efe88e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetConstantBufferByIndex", "GetConstantBufferByName", "GetResourceBindingDesc", "GetInputParameterDesc", "GetOutputParameterDesc", "GetPatchConstantParameterDesc", "GetVariableByName", "GetResourceBindingDescByName", "GetMovInstructionCount", "GetMovcInstructionCount", "GetConversionInstructionCount", "GetBitwiseInstructionCount", "GetGSInputPrimitive", "IsSampleFrequencyShader", "GetNumInterfaceSlots", "GetMinFeatureLevel", "GetThreadGroupSize", "GetRequiresFlags"]

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
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
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
        result := ComCall(4, this, "uint", Index, "ptr")
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

        result := ComCall(5, this, "ptr", Name, "ptr")
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
        result := ComCall(6, this, "uint", ResourceIndex, "ptr", pDesc, "HRESULT")
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
        result := ComCall(7, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
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
        result := ComCall(8, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
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
        result := ComCall(9, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
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

        result := ComCall(10, this, "ptr", Name, "ptr")
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
        result := ComCall(11, this, "ptr", Name, "ptr", pDesc, "HRESULT")
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
        result := ComCall(12, this, "uint")
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
        result := ComCall(13, this, "uint")
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
        result := ComCall(14, this, "uint")
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
        result := ComCall(15, this, "uint")
        return result
    }

    /**
     * Gets the geometry-shader input-primitive description. (ID3D12ShaderReflection.GetGSInputPrimitive)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive">D3D_PRIMITIVE</a></b>
     * 
     * The input-primitive description.  See
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology">D3D_PRIMITIVE_TOPOLOGY</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getgsinputprimitive
     */
    GetGSInputPrimitive() {
        result := ComCall(16, this, "int")
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
        result := ComCall(17, this, "int")
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
        result := ComCall(18, this, "uint")
        return result
    }

    /**
     * Gets the minimum feature level. (ID3D12ShaderReflection.GetMinFeatureLevel)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {Integer} 
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

        result := ComCall(20, this, pSizeXMarshal, pSizeX, pSizeYMarshal, pSizeY, pSizeZMarshal, pSizeZ, "uint")
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
        result := ComCall(21, this, "uint")
        return result
    }
}
