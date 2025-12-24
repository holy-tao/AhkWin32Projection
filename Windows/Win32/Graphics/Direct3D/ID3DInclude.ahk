#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * ID3DInclude is an include interface that the user implements to allow an application to call user-overridable methods for opening and closing shader
 * @remarks
 * 
 * To use this interface, create an interface that inherits from <b>ID3DInclude</b> and implement custom behavior for the methods.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/nn-d3dcommon-id3dinclude
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DInclude extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close"]

    /**
     * A user-implemented method for opening and reading the contents of a shader
     * @param {Integer} IncludeType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_include_type">D3D_INCLUDE_TYPE</a></b>
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/nf-d3dcommon-id3dinclude-open
     */
    Open(IncludeType, pFileName, pParentData, ppData, pBytes) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        pParentDataMarshal := pParentData is VarRef ? "ptr" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pBytesMarshal := pBytes is VarRef ? "uint*" : "ptr"

        result := ComCall(0, this, "int", IncludeType, "ptr", pFileName, pParentDataMarshal, pParentData, ppDataMarshal, ppData, pBytesMarshal, pBytes, "HRESULT")
        return result
    }

    /**
     * A user-implemented method for closing a shader
     * @param {Pointer<Void>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * Pointer to the buffer that contains the include directives. This is the pointer that was returned by the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nf-d3dcommon-id3dinclude-open">ID3DInclude::Open</a> call.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/nf-d3dcommon-id3dinclude-close
     */
    Close(pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(1, this, pDataMarshal, pData, "HRESULT")
        return result
    }
}
