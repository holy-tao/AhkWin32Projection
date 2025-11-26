#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_LIBRARY_DESC.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A library-reflection interface accesses library info.
 * @remarks
 * 
 * To get a library-reflection interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3dcompiler/nf-d3dcompiler-d3dreflectlibrary">D3DReflectLibrary</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D12LibraryReflection</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nn-d3d12shader-id3d12libraryreflection
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12LibraryReflection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12LibraryReflection
     * @type {Guid}
     */
    static IID => Guid("{8e349d19-54db-4a56-9dc9-119d87bdb804}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetFunctionByIndex"]

    /**
     * Fills the library descriptor structure for the library reflection.
     * @returns {D3D12_LIBRARY_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_library_desc">D3D12_LIBRARY_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_library_desc">D3D12_LIBRARY_DESC</a> structure that receives a description of the library reflection.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12libraryreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D12_LIBRARY_DESC()
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets the function reflector.
     * @param {Integer} FunctionIndex Type: <b>INT</b>
     * 
     * The zero-based index of the function reflector to retrieve.
     * @returns {ID3D12FunctionReflection} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12functionreflection">ID3D12FunctionReflection</a>*</b>
     * 
     * The function reflector, as a pointer to <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12functionreflection">ID3D12FunctionReflection</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12libraryreflection-getfunctionbyindex
     */
    GetFunctionByIndex(FunctionIndex) {
        result := ComCall(4, this, "int", FunctionIndex, "ptr")
        return result
    }
}
