#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheExplorer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DShaderCacheExplorer
     * @type {Guid}
     */
    static IID => Guid("{90432322-32f5-487f-9264-e9390fa58b2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApplicationFromExePath"]

    /**
     * 
     * @param {PWSTR} pFullExePath 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetApplicationFromExePath(pFullExePath, riid) {
        pFullExePath := pFullExePath is String ? StrPtr(pFullExePath) : pFullExePath

        result := ComCall(3, this, "ptr", pFullExePath, "ptr", riid, "ptr*", &ppvApp := 0, "HRESULT")
        return ppvApp
    }
}
