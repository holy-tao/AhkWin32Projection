#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXFeedsEnum.ahk
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
     * @returns {IXFeedsEnum} 
     */
    Feeds() {
        result := ComCall(3, this, "ptr*", &ppfe := 0, "HRESULT")
        return IXFeedsEnum(ppfe)
    }

    /**
     * 
     * @returns {IXFeedsEnum} 
     */
    Subfolders() {
        result := ComCall(4, this, "ptr*", &ppfe := 0, "HRESULT")
        return IXFeedsEnum(ppfe)
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {PWSTR} pszUrl 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateFeed(pszName, pszUrl, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(5, this, "ptr", pszName, "ptr", pszUrl, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateSubfolder(pszName, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<BOOL>} pbFeedExists 
     * @returns {HRESULT} 
     */
    ExistsFeed(pszName, pbFeedExists) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pbFeedExistsMarshal := pbFeedExists is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pszName, pbFeedExistsMarshal, pbFeedExists, "HRESULT")
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

        pbSubfolderExistsMarshal := pbSubfolderExists is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", pszName, pbSubfolderExistsMarshal, pbSubfolderExists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetFeed(pszName, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "ptr", pszName, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetSubfolder(pszName, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(10, this, "ptr", pszName, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
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
     * @returns {PWSTR} 
     */
    Name() {
        result := ComCall(12, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
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
     * @returns {PWSTR} 
     */
    Path() {
        result := ComCall(14, this, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
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
     * @returns {Pointer<Void>} 
     */
    Parent(riid) {
        result := ComCall(16, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsRoot() {
        result := ComCall(17, this, "int*", &pbIsRootFeedFolder := 0, "HRESULT")
        return pbIsRootFeedFolder
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetWatcher(scope, mask, riid) {
        result := ComCall(18, this, "int", scope, "int", mask, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {Integer} 
     */
    TotalUnreadItemCount() {
        result := ComCall(19, this, "uint*", &puiTotalUnreadItemCount := 0, "HRESULT")
        return puiTotalUnreadItemCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    TotalItemCount() {
        result := ComCall(20, this, "uint*", &puiTotalItemCount := 0, "HRESULT")
        return puiTotalItemCount
    }
}
