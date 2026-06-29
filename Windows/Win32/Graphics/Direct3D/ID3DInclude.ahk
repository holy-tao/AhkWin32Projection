#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D_INCLUDE_TYPE.ahk" { D3D_INCLUDE_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * ID3DInclude is an include interface that the user implements to allow an application to call user-overridable methods for opening and closing shader
 * @remarks
 * To use this interface, create an interface that inherits from <b>ID3DInclude</b> and implement custom behavior for the methods.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nn-d3dcommon-id3dinclude
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct ID3DInclude extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DInclude interfaces
    */
    struct Vtbl {
        Open  : IntPtr
        Close : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DInclude.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * A user-implemented method for opening and reading the contents of a shader
     * @param {D3D_INCLUDE_TYPE} IncludeType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_include_type">D3D_INCLUDE_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_include_type">D3D_INCLUDE_TYPE</a>-typed value that indicates the location of the #include file.
     * @param {PSTR} pFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Name of the #include file.
     * @param {Pointer<Void>} pParentData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * Pointer to the container that includes the #include file. The compiler might pass NULL in <i>pParentData</i>. For more information, see the "Searching for Include Files" section in <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-programming-guide-effects-compile">Compile an Effect (Direct3D 11)</a>.
     * @param {Pointer<Pointer<Void>>} ppData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a>*</b>
     * 
     * Pointer to the buffer  that contains the include directives. This pointer remains valid until you call<a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nf-d3dcommon-id3dinclude-close">ID3DInclude::Close</a>.
     * @param {Pointer<Integer>} pBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to the number of bytes that <b>Open</b> returns in <i>ppData</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * The user-implemented method must return S_OK. If <b>Open</b> fails when it reads the #include file, the application programming interface (API) that caused <b>Open</b> to be called fails. This failure can occur in one of the following situations:
     *               
     * 
     * <ul>
     * <li>The high-level shader language (HLSL) shader fails one of the <b>D3D10CompileShader***</b> functions.
     *               </li>
     * <li>The effect fails one of the <b>D3D10CreateEffect***</b> functions.
     *               </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3dinclude-open
     */
    Open(IncludeType, pFileName, pParentData, ppData, pBytes) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        pParentDataMarshal := pParentData is VarRef ? "ptr" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pBytesMarshal := pBytes is VarRef ? "uint*" : "ptr"

        result := ComCall(0, this, D3D_INCLUDE_TYPE, IncludeType, "ptr", pFileName, pParentDataMarshal, pParentData, ppDataMarshal, ppData, pBytesMarshal, pBytes, "HRESULT")
        return result
    }

    /**
     * A user-implemented method for closing a shader
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nf-d3dcommon-id3dinclude-open">ID3DInclude::Open</a> was successful, <b>Close</b> is guaranteed to be called before the API using the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3dinclude">ID3DInclude</a> interface returns.
     * @param {Pointer<Void>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * Pointer to the buffer that contains the include directives. This is the pointer that was returned by the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nf-d3dcommon-id3dinclude-open">ID3DInclude::Open</a> call.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * The user-implemented <b>Close</b> method should return S_OK. If <b>Close</b> fails when it closes the #include file, the application programming interface (API) that caused <b>Close</b> to be called fails. This failure can occur in one of the following situations:
     *               
     * 
     * <ul>
     * <li>The high-level shader language (HLSL) shader fails one of the <b>D3D10CompileShader***</b> functions.
     *               </li>
     * <li>The effect fails one of the <b>D3D10CreateEffect***</b> functions.
     *               </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3dinclude-close
     */
    Close(pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(1, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3DInclude.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
