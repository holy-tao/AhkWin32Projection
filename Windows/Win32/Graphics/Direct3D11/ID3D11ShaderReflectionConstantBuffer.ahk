#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11ShaderReflectionVariable.ahk" { ID3D11ShaderReflectionVariable }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D11_SHADER_BUFFER_DESC.ahk" { D3D11_SHADER_BUFFER_DESC }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * This shader-reflection interface provides access to a constant buffer. (ID3D11ShaderReflectionConstantBuffer)
 * @remarks
 * To create a constant-buffer interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getconstantbufferbyindex">ID3D11ShaderReflection::GetConstantBufferByIndex</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getconstantbufferbyname">ID3D11ShaderReflection::GetConstantBufferByName</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionconstantbuffer
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11ShaderReflectionConstantBuffer extends Win32ComInterface {
    /**
     * The interface identifier for ID3D11ShaderReflectionConstantBuffer
     * @type {Guid}
     */
    static IID := Guid("{eb62d63d-93dd-4318-8ae8-c6f83ad371b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11ShaderReflectionConstantBuffer interfaces
    */
    struct Vtbl {
        GetDesc            : IntPtr
        GetVariableByIndex : IntPtr
        GetVariableByName  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11ShaderReflectionConstantBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a constant-buffer description. (ID3D11ShaderReflectionConstantBuffer.GetDesc)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Pointer<D3D11_SHADER_BUFFER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_buffer_desc">D3D11_SHADER_BUFFER_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_buffer_desc">D3D11_SHADER_BUFFER_DESC</a>, which represents a shader-buffer description.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectionconstantbuffer-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(0, this, D3D11_SHADER_BUFFER_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * The ID3D11ShaderReflectionConstantBuffer::GetVariableByIndex (d3d11shader.h) method gets a shader-reflection variable by index.
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D11ShaderReflectionVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionvariable">ID3D11ShaderReflectionVariable</a>*</b>
     * 
     * A pointer to a shader-reflection variable interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionvariable">ID3D11ShaderReflectionVariable Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectionconstantbuffer-getvariablebyindex
     */
    GetVariableByIndex(Index) {
        result := ComCall(1, this, "uint", Index, ID3D11ShaderReflectionVariable)
        return result
    }

    /**
     * Get a shader-reflection variable by name. (ID3D11ShaderReflectionConstantBuffer.GetVariableByName)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Variable name.
     * @returns {ID3D11ShaderReflectionVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionvariable">ID3D11ShaderReflectionVariable</a>*</b>
     * 
     * Returns a sentinel object (end of list marker). To determine if GetVariableByName successfully completed, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-getdesc">ID3D11ShaderReflectionVariable::GetDesc</a> and check the returned <b>HRESULT</b>; any return value other than success means that GetVariableByName failed.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectionconstantbuffer-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, ID3D11ShaderReflectionVariable)
        return result
    }

    Query(iid) {
        if (ID3D11ShaderReflectionConstantBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
