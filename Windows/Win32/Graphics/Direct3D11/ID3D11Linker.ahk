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
     * 
     * @param {ID3D11ModuleInstance} pEntry 
     * @param {PSTR} pEntryName 
     * @param {PSTR} pTargetName 
     * @param {Integer} uFlags 
     * @param {Pointer<ID3DBlob>} ppShaderBlob 
     * @param {Pointer<ID3DBlob>} ppErrorBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11linker-link
     */
    Link(pEntry, pEntryName, pTargetName, uFlags, ppShaderBlob, ppErrorBuffer) {
        pEntryName := pEntryName is String ? StrPtr(pEntryName) : pEntryName
        pTargetName := pTargetName is String ? StrPtr(pTargetName) : pTargetName

        result := ComCall(3, this, "ptr", pEntry, "ptr", pEntryName, "ptr", pTargetName, "uint", uFlags, "ptr*", ppShaderBlob, "ptr*", ppErrorBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11ModuleInstance} pLibraryMI 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11linker-uselibrary
     */
    UseLibrary(pLibraryMI) {
        result := ComCall(4, this, "ptr", pLibraryMI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uCBufferSlot 
     * @param {Integer} uCBufferEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11linker-addclipplanefromcbuffer
     */
    AddClipPlaneFromCBuffer(uCBufferSlot, uCBufferEntry) {
        result := ComCall(5, this, "uint", uCBufferSlot, "uint", uCBufferEntry, "HRESULT")
        return result
    }
}
