#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Folder.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class Folder2 extends Folder{
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
     * 
     * @param {Pointer<FolderItem>} ppfi 
     * @returns {HRESULT} 
     */
    get_Self(ppfi) {
        result := ComCall(17, this, "ptr", ppfi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pul 
     * @returns {HRESULT} 
     */
    get_OfflineStatus(pul) {
        result := ComCall(18, this, "int*", pul, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Synchronize() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbHaveToShowWebViewBarricade 
     * @returns {HRESULT} 
     */
    get_HaveToShowWebViewBarricade(pbHaveToShowWebViewBarricade) {
        result := ComCall(20, this, "ptr", pbHaveToShowWebViewBarricade, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DismissedWebViewBarricade() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
