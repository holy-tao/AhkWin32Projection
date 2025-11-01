#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcIncludeHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcIncludeHandler
     * @type {Guid}
     */
    static IID => Guid("{7f61fc7d-950d-467f-b3e3-3c02fb49187c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadSource"]

    /**
     * 
     * @param {PWSTR} pFilename 
     * @param {Pointer<IDxcBlob>} ppIncludeSource 
     * @returns {HRESULT} 
     */
    LoadSource(pFilename, ppIncludeSource) {
        pFilename := pFilename is String ? StrPtr(pFilename) : pFilename

        result := ComCall(3, this, "ptr", pFilename, "ptr*", ppIncludeSource, "HRESULT")
        return result
    }
}
