#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D10_SHADER_TYPE_DESC.ahk" { D3D10_SHADER_TYPE_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * This shader-reflection interface provides access to variable type. (ID3D10ShaderReflectionType)
 * @remarks
 * The get a shader-reflection-type interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionvariable-gettype">ID3D10ShaderReflectionVariable::GetType</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10ShaderReflectionType extends Win32ComInterface {
    /**
     * The interface identifier for ID3D10ShaderReflectionType
     * @type {Guid}
     */
    static IID := Guid("{c530ad7d-9b16-4395-a979-ba2ecff83add}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10ShaderReflectionType interfaces
    */
    struct Vtbl {
        GetDesc              : IntPtr
        GetMemberTypeByIndex : IntPtr
        GetMemberTypeByName  : IntPtr
        GetMemberTypeName    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10ShaderReflectionType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the description of a shader-reflection-variable type. (ID3D10ShaderReflectionType.GetDesc)
     * @param {Pointer<D3D10_SHADER_TYPE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_type_desc">D3D10_SHADER_TYPE_DESC</a>*</b>
     * 
     * A pointer to a shader-type description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_type_desc">D3D10_SHADER_TYPE_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(0, this, D3D10_SHADER_TYPE_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * The ID3D10ShaderReflectionType::GetMemberTypeByIndex (d3d10shader.h) method gets a shader-reflection-variable type by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D10ShaderReflectionType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getmembertypebyindex
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(1, this, "uint", Index, ID3D10ShaderReflectionType)
        return result
    }

    /**
     * Get a shader-reflection-variable type by name. (ID3D10ShaderReflectionType.GetMemberTypeByName)
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Member name.
     * @returns {ID3D10ShaderReflectionType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getmembertypebyname
     */
    GetMemberTypeByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, ID3D10ShaderReflectionType)
        return result
    }

    /**
     * Get a shader-reflection-variable type. (ID3D10ShaderReflectionType.GetMemberTypeName)
     * @param {Integer} Index Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * A zero-based index to a member of the struct type.
     * @returns {PSTR} Type: **[LPCSTR](/windows/desktop/winprog/windows-data-types)**
     * 
     * The member name in the form of a stringified value of the [D3D_SHADER_VARIABLE_TYPE](../d3dcommon/ne-d3dcommon-d3d_shader_variable_type.md) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getmembertypename
     */
    GetMemberTypeName(Index) {
        result := ComCall(3, this, "uint", Index, PSTR)
        return result
    }

    Query(iid) {
        if (ID3D10ShaderReflectionType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
