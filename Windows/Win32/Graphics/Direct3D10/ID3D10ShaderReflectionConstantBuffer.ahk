#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D10_SHADER_BUFFER_DESC.ahk" { D3D10_SHADER_BUFFER_DESC }
#Import ".\ID3D10ShaderReflectionVariable.ahk" { ID3D10ShaderReflectionVariable }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * This shader-reflection interface provides access to a constant buffer. (ID3D10ShaderReflectionConstantBuffer)
 * @remarks
 * To create a constant-buffer interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyindex">ID3D10ShaderReflection::GetConstantBufferByIndex</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyname">ID3D10ShaderReflection::GetConstantBufferByName</a>. This is not a COM interface; therefore, you do not need to worry about reference counts or releasing the interface when you are done with it.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10ShaderReflectionConstantBuffer extends Win32ComInterface {
    /**
     * The interface identifier for ID3D10ShaderReflectionConstantBuffer
     * @type {Guid}
     */
    static IID := Guid("{66c66a94-dddd-4b62-a66a-f0da33c2b4d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10ShaderReflectionConstantBuffer interfaces
    */
    struct Vtbl {
        GetDesc            : IntPtr
        GetVariableByIndex : IntPtr
        GetVariableByName  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10ShaderReflectionConstantBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a constant-buffer description. (ID3D10ShaderReflectionConstantBuffer.GetDesc)
     * @returns {D3D10_SHADER_BUFFER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_buffer_desc">D3D10_SHADER_BUFFER_DESC</a>*</b>
     * 
     * A pointer to a shader-buffer description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_buffer_desc">D3D10_SHADER_BUFFER_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getdesc
     */
    GetDesc() {
        pDesc := D3D10_SHADER_BUFFER_DESC()
        result := ComCall(0, this, D3D10_SHADER_BUFFER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * The ID3D10ShaderReflectionConstantBuffer::GetVariableByIndex (d3d10shader.h) method gets a shader-reflection variable by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D10ShaderReflectionVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable">ID3D10ShaderReflectionVariable</a>*</b>
     * 
     * A pointer to a shader-reflection variable interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable">ID3D10ShaderReflectionVariable Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getvariablebyindex
     */
    GetVariableByIndex(Index) {
        result := ComCall(1, this, "uint", Index, ID3D10ShaderReflectionVariable)
        return result
    }

    /**
     * Get a shader-reflection variable by name. (ID3D10ShaderReflectionConstantBuffer.GetVariableByName)
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Variable name.
     * @returns {ID3D10ShaderReflectionVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable">ID3D10ShaderReflectionVariable</a>*</b>
     * 
     * A pointer to a shader-reflection variable interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable">ID3D10ShaderReflectionVariable Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, ID3D10ShaderReflectionVariable)
        return result
    }

    Query(iid) {
        if (ID3D10ShaderReflectionConstantBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
