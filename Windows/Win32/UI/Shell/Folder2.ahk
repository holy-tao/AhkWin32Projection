#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Folder.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/folder2-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class Folder2 extends Folder{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Folder2
     * @type {Guid}
     */
    static IID => Guid("{f0d2d8ef-3890-11d2-bf8b-00c04fb93661}")

    /**
     * The class identifier for Folder2
     * @type {Guid}
     */
    static CLSID => Guid("{f0d2d8ef-3890-11d2-bf8b-00c04fb93661}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Self", "get_OfflineStatus", "Synchronize", "get_HaveToShowWebViewBarricade", "DismissedWebViewBarricade"]

    /**
     * 
     * @param {Pointer<FolderItem>} ppfi 
     * @returns {HRESULT} 
     */
    get_Self(ppfi) {
        result := ComCall(17, this, "ptr*", ppfi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pul 
     * @returns {HRESULT} 
     */
    get_OfflineStatus(pul) {
        pulMarshal := pul is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pulMarshal, pul, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder2-synchronize
     */
    Synchronize() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbHaveToShowWebViewBarricade 
     * @returns {HRESULT} 
     */
    get_HaveToShowWebViewBarricade(pbHaveToShowWebViewBarricade) {
        result := ComCall(20, this, "ptr", pbHaveToShowWebViewBarricade, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder2-dismissedwebviewbarricade
     */
    DismissedWebViewBarricade() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
