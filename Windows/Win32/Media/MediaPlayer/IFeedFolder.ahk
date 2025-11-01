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
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Feeds(disp) {
        result := ComCall(7, this, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Subfolders(disp) {
        result := ComCall(8, this, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @param {BSTR} feedUrl 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    CreateFeed(feedName, feedUrl, disp) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(9, this, "ptr", feedName, "ptr", feedUrl, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    CreateSubfolder(folderName, disp) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(10, this, "ptr", folderName, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @param {Pointer<VARIANT_BOOL>} exists 
     * @returns {HRESULT} 
     */
    ExistsFeed(feedName, exists) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName

        result := ComCall(11, this, "ptr", feedName, "ptr", exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} feedName 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    GetFeed(feedName, disp) {
        feedName := feedName is String ? BSTR.Alloc(feedName).Value : feedName

        result := ComCall(12, this, "ptr", feedName, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @param {Pointer<VARIANT_BOOL>} exists 
     * @returns {HRESULT} 
     */
    ExistsSubfolder(folderName, exists) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(13, this, "ptr", folderName, "ptr", exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} folderName 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    GetSubfolder(folderName, disp) {
        folderName := folderName is String ? BSTR.Alloc(folderName).Value : folderName

        result := ComCall(14, this, "ptr", folderName, "ptr*", disp, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} folderName 
     * @returns {HRESULT} 
     */
    get_Name(folderName) {
        result := ComCall(16, this, "ptr", folderName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} folderPath 
     * @returns {HRESULT} 
     */
    get_Path(folderPath) {
        result := ComCall(18, this, "ptr", folderPath, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Parent(disp) {
        result := ComCall(20, this, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isRoot 
     * @returns {HRESULT} 
     */
    get_IsRoot(isRoot) {
        result := ComCall(21, this, "ptr", isRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     */
    get_TotalUnreadItemCount(count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     */
    get_TotalItemCount(count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    GetWatcher(scope, mask, disp) {
        result := ComCall(24, this, "int", scope, "int", mask, "ptr*", disp, "HRESULT")
        return result
    }
}
