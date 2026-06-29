#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_SHADER_TYPE_DESC.ahk" { D3D11_SHADER_TYPE_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * This shader-reflection interface provides access to variable type. (ID3D11ShaderReflectionType)
 * @remarks
 * The get a shader-reflection-type interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-gettype">ID3D11ShaderReflectionVariable::GetType</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11ShaderReflectionType extends Win32ComInterface {
    /**
     * The interface identifier for ID3D11ShaderReflectionType
     * @type {Guid}
     */
    static IID := Guid("{6e6ffa6a-9bae-4613-a51e-91652d508c21}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11ShaderReflectionType interfaces
    */
    struct Vtbl {
        GetDesc              : IntPtr
        GetMemberTypeByIndex : IntPtr
        GetMemberTypeByName  : IntPtr
        GetMemberTypeName    : IntPtr
        IsEqual              : IntPtr
        GetSubType           : IntPtr
        GetBaseClass         : IntPtr
        GetNumInterfaces     : IntPtr
        GetInterfaceByIndex  : IntPtr
        IsOfType             : IntPtr
        ImplementsInterface  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11ShaderReflectionType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the description of a shader-reflection-variable type. (ID3D11ShaderReflectionType.GetDesc)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {D3D11_SHADER_TYPE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_type_desc">D3D11_SHADER_TYPE_DESC</a>*</b>
     * 
     * A pointer to a shader-type description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_type_desc">D3D11_SHADER_TYPE_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getdesc
     */
    GetDesc() {
        pDesc := D3D11_SHADER_TYPE_DESC()
        result := ComCall(0, this, D3D11_SHADER_TYPE_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * The ID3D11ShaderReflectionType::GetMemberTypeByIndex (d3d11shader.h) method gets a shader-reflection-variable type by index.
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D11ShaderReflectionType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getmembertypebyindex
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(1, this, "uint", Index, ID3D11ShaderReflectionType)
        return result
    }

    /**
     * Get a shader-reflection-variable type by name. (ID3D11ShaderReflectionType.GetMemberTypeByName)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Member name.
     * @returns {ID3D11ShaderReflectionType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getmembertypebyname
     */
    GetMemberTypeByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, ID3D11ShaderReflectionType)
        return result
    }

    /**
     * Get a shader-reflection-variable type. (ID3D11ShaderReflectionType.GetMemberTypeName)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {PSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The variable type.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getmembertypename
     */
    GetMemberTypeName(Index) {
        result := ComCall(3, this, "uint", Index, PSTR)
        return result
    }

    /**
     * Indicates whether two ID3D11ShaderReflectionType Interface pointers have the same underlying type.
     * @remarks
     * IsEqual indicates whether the sources of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a> pointers have the same underlying type.
     *       For example, if two <b>ID3D11ShaderReflectionType Interface</b> pointers were retrieved from variables, IsEqual can be used to see if 
     *       the variables have the same type.
     * 
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {ID3D11ShaderReflectionType} pType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if the pointers have the same underlying type; otherwise returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-isequal
     */
    IsEqual(pType) {
        result := ComCall(4, this, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * Gets the base class of a class. (ID3D11ShaderReflectionType.GetSubType)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {ID3D11ShaderReflectionType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType</a>*</b>
     * 
     * Returns a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a> containing the base class type.  Returns <b>NULL</b> if the class does not have a base class.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getsubtype
     */
    GetSubType() {
        result := ComCall(5, this, ID3D11ShaderReflectionType)
        return result
    }

    /**
     * Gets an ID3D11ShaderReflectionType Interface interface containing the variable base class type.
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {ID3D11ShaderReflectionType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType</a>*</b>
     * 
     * Returns A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getbaseclass
     */
    GetBaseClass() {
        result := ComCall(6, this, ID3D11ShaderReflectionType)
        return result
    }

    /**
     * Gets the number of interfaces. (ID3D11ShaderReflectionType.GetNumInterfaces)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the number of interfaces.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getnuminterfaces
     */
    GetNumInterfaces() {
        result := ComCall(7, this, UInt32)
        return result
    }

    /**
     * Get an interface by index.
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {Integer} uIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D11ShaderReflectionType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getinterfacebyindex
     */
    GetInterfaceByIndex(uIndex) {
        result := ComCall(8, this, "uint", uIndex, ID3D11ShaderReflectionType)
        return result
    }

    /**
     * Indicates whether a variable is of the specified type. (ID3D11ShaderReflectionType.IsOfType)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {ID3D11ShaderReflectionType} pType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if object being queried is equal to or inherits from the type in the <i>pType</i> parameter; otherwise returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-isoftype
     */
    IsOfType(pType) {
        result := ComCall(9, this, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * Indicates whether a class type implements an interface. (ID3D11ShaderReflectionType.ImplementsInterface)
     * @remarks
     * This method's interface is hosted in the out-of-box DLL D3DCompiler_xx.dll.
     * @param {ID3D11ShaderReflectionType} pBase Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if the interface is implemented; otherwise return S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-implementsinterface
     */
    ImplementsInterface(pBase) {
        result := ComCall(10, this, "ptr", pBase, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D11ShaderReflectionType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
