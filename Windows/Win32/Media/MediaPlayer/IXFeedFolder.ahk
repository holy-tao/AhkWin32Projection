#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedFolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedFolder
     * @type {Guid}
     */
    static IID => Guid("{4c963678-3a51-4b88-8531-98b90b6508f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Feeds", "Subfolders", "CreateFeed", "CreateSubfolder", "ExistsFeed", "ExistsSubfolder", "GetFeed", "GetSubfolder", "Delete", "Name", "Rename", "Path", "Move", "Parent", "IsRoot", "GetWatcher", "TotalUnreadItemCount", "TotalItemCount"]

    /**
     * 
     * @param {Pointer<IXFeedsEnum>} ppfe 
     * @returns {HRESULT} 
     */
    Feeds(ppfe) {
        result := ComCall(3, this, "ptr*", ppfe, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXFeedsEnum>} ppfe 
     * @returns {HRESULT} 
     */
    Subfolders(ppfe) {
        result := ComCall(4, this, "ptr*", ppfe, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {PWSTR} pszUrl 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    CreateFeed(pszName, pszUrl, riid, ppv) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(5, this, "ptr", pszName, "ptr", pszUrl, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    CreateSubfolder(pszName, riid, ppv) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<BOOL>} pbFeedExists 
     * @returns {HRESULT} 
     */
    ExistsFeed(pszName, pbFeedExists) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pszName, "ptr", pbFeedExists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<BOOL>} pbSubfolderExists 
     * @returns {HRESULT} 
     */
    ExistsSubfolder(pszName, pbSubfolderExists) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(8, this, "ptr", pszName, "ptr", pbSubfolderExists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetFeed(pszName, riid, ppv) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "ptr", pszName, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetSubfolder(pszName, riid, ppv) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(10, this, "ptr", pszName, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    Name(ppszName) {
        result := ComCall(12, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    Rename(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(13, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} 
     */
    Path(ppszPath) {
        result := ComCall(14, this, "ptr", ppszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    Move(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(15, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    Parent(riid, ppv) {
        result := ComCall(16, this, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbIsRootFeedFolder 
     * @returns {HRESULT} 
     */
    IsRoot(pbIsRootFeedFolder) {
        result := ComCall(17, this, "ptr", pbIsRootFeedFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetWatcher(scope, mask, riid, ppv) {
        result := ComCall(18, this, "int", scope, "int", mask, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiTotalUnreadItemCount 
     * @returns {HRESULT} 
     */
    TotalUnreadItemCount(puiTotalUnreadItemCount) {
        puiTotalUnreadItemCountMarshal := puiTotalUnreadItemCount is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, puiTotalUnreadItemCountMarshal, puiTotalUnreadItemCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiTotalItemCount 
     * @returns {HRESULT} 
     */
    TotalItemCount(puiTotalItemCount) {
        puiTotalItemCountMarshal := puiTotalItemCount is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, puiTotalItemCountMarshal, puiTotalItemCount, "HRESULT")
        return result
    }
}
