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
     * 
     * @returns {D3D12_LIBRARY_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12libraryreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D12_LIBRARY_DESC()
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} FunctionIndex 
     * @returns {ID3D12FunctionReflection} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12libraryreflection-getfunctionbyindex
     */
    GetFunctionByIndex(FunctionIndex) {
        result := ComCall(4, this, "int", FunctionIndex, "ptr")
        return result
    }
}
