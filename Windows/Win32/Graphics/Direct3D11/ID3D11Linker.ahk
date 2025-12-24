#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A linker interface is used to link a shader module.
 * @remarks
 * 
 * To get a linker interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3dcompiler/nf-d3dcompiler-d3dcreatelinker">D3DCreateLinker</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11Linker</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11linker
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Linker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Linker
     * @type {Guid}
     */
    static IID => Guid("{59a6cd0e-e10d-4c1f-88c0-63aba1daf30e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Link", "UseLibrary", "AddClipPlaneFromCBuffer"]

    /**
     * Links the shader and produces a shader blob that the Direct3D runtime can use.
     * @param {ID3D11ModuleInstance} pEntry Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a> interface for the shader module instance to link from.
     * @param {PSTR} pEntryName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the shader module instance to link from.
     * @param {PSTR} pTargetName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name for the shader blob that is produced.
     * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved.
     * @param {Pointer<ID3DBlob>} ppShaderBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the compiled shader code.
     * @param {Pointer<ID3DBlob>} ppErrorBuffer Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access compiler error messages.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11linker-link
     */
    Link(pEntry, pEntryName, pTargetName, uFlags, ppShaderBlob, ppErrorBuffer) {
        pEntryName := pEntryName is String ? StrPtr(pEntryName) : pEntryName
        pTargetName := pTargetName is String ? StrPtr(pTargetName) : pTargetName

        result := ComCall(3, this, "ptr", pEntry, "ptr", pEntryName, "ptr", pTargetName, "uint", uFlags, "ptr*", ppShaderBlob, "ptr*", ppErrorBuffer, "HRESULT")
        return result
    }

    /**
     * Adds an instance of a library module to be used for linking.
     * @param {ID3D11ModuleInstance} pLibraryMI Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a> interface for the library module instance.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11linker-uselibrary
     */
    UseLibrary(pLibraryMI) {
        result := ComCall(4, this, "ptr", pLibraryMI, "HRESULT")
        return result
    }

    /**
     * Adds a clip plane with the plane coefficients taken from a cbuffer entry for 10Level9 shaders.
     * @param {Integer} uCBufferSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-constants">cbuffer</a> slot number.
     * @param {Integer} uCBufferEntry Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-constants">cbuffer</a> entry number.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11linker-addclipplanefromcbuffer
     */
    AddClipPlaneFromCBuffer(uCBufferSlot, uCBufferEntry) {
        result := ComCall(5, this, "uint", uCBufferSlot, "uint", uCBufferEntry, "HRESULT")
        return result
    }
}
