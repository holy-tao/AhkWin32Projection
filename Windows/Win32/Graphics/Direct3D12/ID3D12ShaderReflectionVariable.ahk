#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12ShaderReflectionConstantBuffer.ahk" { ID3D12ShaderReflectionConstantBuffer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12ShaderReflectionType.ahk" { ID3D12ShaderReflectionType }
#Import ".\D3D12_SHADER_VARIABLE_DESC.ahk" { D3D12_SHADER_VARIABLE_DESC }

/**
 * This shader-reflection interface provides access to a variable. (ID3D12ShaderReflectionVariable)
 * @remarks
 * To get a shader-reflection-variable interface, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getvariablebyname">ID3D12ShaderReflection::GetVariableByName</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12ShaderReflectionVariable extends Win32ComInterface {
    /**
     * The interface identifier for ID3D12ShaderReflectionVariable
     * @type {Guid}
     */
    static IID := Guid("{8337a8a6-a216-444a-b2f4-314733a73aea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12ShaderReflectionVariable interfaces
    */
    struct Vtbl {
        GetDesc          : IntPtr
        GetType          : IntPtr
        GetBuffer        : IntPtr
        GetInterfaceSlot : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12ShaderReflectionVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a shader-variable description.
     * @remarks
     * This method can be used to determine if the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable">ID3D12ShaderReflectionVariable Interface</a> is valid, the method returns <b>E_FAIL</b> when the variable is not valid.
     *         
     * 
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {D3D12_SHADER_VARIABLE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_shader_variable_desc">D3D12_SHADER_VARIABLE_DESC</a>*</b>
     * 
     * A pointer to a shader-variable description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_shader_variable_desc">D3D12_SHADER_VARIABLE_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-getdesc
     */
    GetDesc() {
        pDesc := D3D12_SHADER_VARIABLE_DESC()
        result := ComCall(0, this, D3D12_SHADER_VARIABLE_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a shader-variable type.
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {ID3D12ShaderReflectionType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-gettype
     */
    GetType() {
        result := ComCall(1, this, ID3D12ShaderReflectionType)
        return result
    }

    /**
     * Returns the ID3D12ShaderReflectionConstantBuffer of the present ID3D12ShaderReflectionVariable.
     * @returns {ID3D12ShaderReflectionConstantBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a>*</b>
     * 
     * Returns a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a> of the present <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable">ID3D12ShaderReflectionVariable</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-getbuffer
     */
    GetBuffer() {
        result := ComCall(2, this, ID3D12ShaderReflectionConstantBuffer)
        return result
    }

    /**
     * Gets the corresponding interface slot for a variable that represents an interface pointer. (ID3D12ShaderReflectionVariable.GetInterfaceSlot)
     * @remarks
     * GetInterfaceSlot gets the corresponding slot in a dynamic linkage array for an interface instance.
     *           The returned slot number is used to set an interface instance to a particular class instance.
     *           See the HLSL <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking-class">Interfaces and Classes</a> overview for additional information.
     *         
     * 
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} uArrayIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the array element to get the slot number for.
     *             For a non-array variable this value will be zero.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the index of the interface in the interface array.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-getinterfaceslot
     */
    GetInterfaceSlot(uArrayIndex) {
        result := ComCall(3, this, "uint", uArrayIndex, UInt32)
        return result
    }

    Query(iid) {
        if (ID3D12ShaderReflectionVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
