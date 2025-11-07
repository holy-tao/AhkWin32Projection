#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedFolder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedFolder
     * @type {Guid}
     */
    static IID => Guid("{81f04ad1-4194-4d7d-86d6-11813cec163c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Feeds", "get_Subfolders", "CreateFeed", "CreateSubfolder", "ExistsFeed", "GetFeed", "ExistsSubfolder", "GetSubfolder", "Delete", "get_Name", "Rename", "get_Path", "Move", "get_Parent", "get_IsRoot", "get_TotalUnreadItemCount", "get_TotalItemCount", "GetWatcher"]

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Feeds() {
        result := ComCall(7, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Subfolders() {
        result := ComCall(8, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @param {BSTR} feedUrl 
     * @returns {IDispatch} 
     */
    CreateFeed(feedName, feedUrl) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(9, this, "ptr", feedName, "ptr", feedUrl, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {IDispatch} 
     */
    CreateSubfolder(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(10, this, "ptr", folderName, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @returns {VARIANT_BOOL} 
     */
    ExistsFeed(feedName) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName

        result := ComCall(11, this, "ptr", feedName, "short*", &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @returns {IDispatch} 
     */
    GetFeed(feedName) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName

        result := ComCall(12, this, "ptr", feedName, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {VARIANT_BOOL} 
     */
    ExistsSubfolder(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(13, this, "ptr", folderName, "short*", &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {IDispatch} 
     */
    GetSubfolder(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(14, this, "ptr", folderName, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        folderName := BSTR()
        result := ComCall(16, this, "ptr", folderName, "HRESULT")
        return folderName
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @returns {HRESULT} 
     */
    Rename(folderName) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(17, this, "ptr", folderName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        folderPath := BSTR()
        result := ComCall(18, this, "ptr", folderPath, "HRESULT")
        return folderPath
    }

    /**
     * 
     * @param {BSTR} newParentPath 
     * @returns {HRESULT} 
     */
    Move(newParentPath) {
        newParentPath := newParentPath is String ? BSTR.Alloc(newParentPath).Value : newParentPath

        result := ComCall(19, this, "ptr", newParentPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(20, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsRoot() {
        result := ComCall(21, this, "short*", &isRoot := 0, "HRESULT")
        return isRoot
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalUnreadItemCount() {
        result := ComCall(22, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalItemCount() {
        result := ComCall(23, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @returns {IDispatch} 
     */
    GetWatcher(scope, mask) {
        result := ComCall(24, this, "int", scope, "int", mask, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }
}
