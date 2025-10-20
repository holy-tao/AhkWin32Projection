#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<D3D12_LIBRARY_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetDesc(pDesc) {
        result := ComCall(3, this, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FunctionIndex 
     * @returns {Pointer<ID3D12FunctionReflection>} 
     */
    GetFunctionByIndex(FunctionIndex) {
        result := ComCall(4, this, "int", FunctionIndex, "ptr")
        return result
    }
}
