#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10ShaderReflectionType.ahk" { ID3D10ShaderReflectionType }
#Import ".\D3D10_SHADER_VARIABLE_DESC.ahk" { D3D10_SHADER_VARIABLE_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This shader-reflection interface provides access to a variable. (ID3D10ShaderReflectionVariable)
 * @remarks
 * To get a shader-reflection-variable interface, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getvariablebyindex">ID3D10ShaderReflectionConstantBuffer::GetVariableByIndex</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10ShaderReflectionVariable extends Win32ComInterface {
    /**
     * The interface identifier for ID3D10ShaderReflectionVariable
     * @type {Guid}
     */
    static IID := Guid("{1bf63c95-2650-405d-99c1-3636bd1da0a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10ShaderReflectionVariable interfaces
    */
    struct Vtbl {
        GetDesc : IntPtr
        GetType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10ShaderReflectionVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a shader-variable description. (ID3D10ShaderReflectionVariable.GetDesc)
     * @returns {D3D10_SHADER_VARIABLE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_variable_desc">D3D10_SHADER_VARIABLE_DESC</a>*</b>
     * 
     * A pointer to a shader-variable description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_variable_desc">D3D10_SHADER_VARIABLE_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionvariable-getdesc
     */
    GetDesc() {
        pDesc := D3D10_SHADER_VARIABLE_DESC()
        result := ComCall(0, this, D3D10_SHADER_VARIABLE_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get a shader-variable type. (ID3D10ShaderReflectionVariable.GetType)
     * @returns {ID3D10ShaderReflectionType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionvariable-gettype
     */
    GetType() {
        result := ComCall(1, this, ID3D10ShaderReflectionType)
        return result
    }

    Query(iid) {
        if (ID3D10ShaderReflectionVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
