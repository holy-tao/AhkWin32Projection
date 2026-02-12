#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SocialUserInfo.ahk
#Include .\SocialFeedContent.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\SocialItemThumbnail.ahk
#Include .\SocialFeedSharedItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class ISocialFeedChildItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocialFeedChildItem
     * @type {Guid}
     */
    static IID => Guid("{0b6a985a-d59d-40be-980c-488a2ab30a83}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Author", "get_PrimaryContent", "get_SecondaryContent", "get_Timestamp", "put_Timestamp", "get_TargetUri", "put_TargetUri", "get_Thumbnails", "get_SharedItem", "put_SharedItem"]

    /**
     * @type {SocialUserInfo} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * @type {SocialFeedContent} 
     */
    PrimaryContent {
        get => this.get_PrimaryContent()
    }

    /**
     * @type {SocialFeedContent} 
     */
    SecondaryContent {
        get => this.get_SecondaryContent()
    }

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
        set => this.put_Timestamp(value)
    }

    /**
     * @type {Uri} 
     */
    TargetUri {
        get => this.get_TargetUri()
        set => this.put_TargetUri(value)
    }

    /**
     * @type {IVector<SocialItemThumbnail>} 
     */
    Thumbnails {
        get => this.get_Thumbnails()
    }

    /**
     * @type {SocialFeedSharedItem} 
     */
    SharedItem {
        get => this.get_SharedItem()
        set => this.put_SharedItem(value)
    }

    /**
     * 
     * @returns {SocialUserInfo} 
     */
    get_Author() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SocialUserInfo(value)
    }

    /**
     * 
     * @returns {SocialFeedContent} 
     */
    get_PrimaryContent() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SocialFeedContent(value)
    }

    /**
     * 
     * @returns {SocialFeedContent} 
     */
    get_SecondaryContent() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SocialFeedContent(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_Timestamp(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_TargetUri(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<SocialItemThumbnail>} 
     */
    get_Thumbnails() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SocialItemThumbnail, value)
    }

    /**
     * 
     * @returns {SocialFeedSharedItem} 
     */
    get_SharedItem() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SocialFeedSharedItem(value)
    }

    /**
     * 
     * @param {SocialFeedSharedItem} value 
     * @returns {HRESULT} 
     */
    put_SharedItem(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
