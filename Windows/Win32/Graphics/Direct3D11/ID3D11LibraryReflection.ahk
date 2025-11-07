#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_LIBRARY_DESC.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A library-reflection interface accesses library info.
 * @remarks
 * 
 * To get a library-reflection interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3dcompiler/nf-d3dcompiler-d3dreflectlibrary">D3DReflectLibrary</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11LibraryReflection</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11libraryreflection
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11LibraryReflection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11LibraryReflection
     * @type {Guid}
     */
    static IID => Guid("{54384f1b-5b3e-4bb7-ae01-60ba3097cbb6}")

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
     * @returns {D3D11_LIBRARY_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11libraryreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D11_LIBRARY_DESC()
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} FunctionIndex 
     * @returns {ID3D11FunctionReflection} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11libraryreflection-getfunctionbyindex
     */
    GetFunctionByIndex(FunctionIndex) {
        result := ComCall(4, this, "int", FunctionIndex, "ptr")
        return result
    }
}
