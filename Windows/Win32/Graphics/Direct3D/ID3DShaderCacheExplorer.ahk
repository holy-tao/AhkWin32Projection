#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheExplorer extends IUnknown{
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
     * 
     * @param {PWSTR} pFullExePath 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvApp 
     * @returns {HRESULT} 
     */
    GetApplicationFromExePath(pFullExePath, riid, ppvApp) {
        pFullExePath := pFullExePath is String ? StrPtr(pFullExePath) : pFullExePath

        result := ComCall(3, this, "ptr", pFullExePath, "ptr", riid, "ptr", ppvApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
