#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11ModuleInstance.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A module interface creates an instance of a module that is used for resource rebinding.
 * @remarks
 * 
 * To get a module interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3dcompiler/nf-d3dcompiler-d3dloadmodule">D3DLoadModule</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11Module</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11module
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Module extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Module
     * @type {Guid}
     */
    static IID => Guid("{cac701ee-80fc-4122-8242-10b39c8cec34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * 
     * @param {PSTR} pNamespace 
     * @returns {ID3D11ModuleInstance} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11module-createinstance
     */
    CreateInstance(pNamespace) {
        pNamespace := pNamespace is String ? StrPtr(pNamespace) : pNamespace

        result := ComCall(3, this, "ptr", pNamespace, "ptr*", &ppModuleInstance := 0, "HRESULT")
        return ID3D11ModuleInstance(ppModuleInstance)
    }
}
