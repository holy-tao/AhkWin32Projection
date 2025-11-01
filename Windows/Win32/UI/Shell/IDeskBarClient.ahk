#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDeskBarClient extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeskBarClient
     * @type {Guid}
     */
    static IID => Guid("{eb0fe175-1a3a-11d0-89b3-00a0c90a90ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDeskBarSite", "SetModeDBC", "UIActivateDBC", "GetSize"]

    /**
     * 
     * @param {IUnknown} punkSite 
     * @returns {HRESULT} 
     */
    SetDeskBarSite(punkSite) {
        result := ComCall(5, this, "ptr", punkSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    SetModeDBC(dwMode) {
        result := ComCall(6, this, "uint", dwMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     */
    UIActivateDBC(dwState) {
        result := ComCall(7, this, "uint", dwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWhich 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    GetSize(dwWhich, prc) {
        result := ComCall(8, this, "uint", dwWhich, "ptr", prc, "HRESULT")
        return result
    }
}
