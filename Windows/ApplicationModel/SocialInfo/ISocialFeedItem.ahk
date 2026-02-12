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
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SocialFeedChildItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class ISocialFeedItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocialFeedItem
     * @type {Guid}
     */
    static IID => Guid("{4f1392ab-1f72-4d33-b695-de3e1db60317}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Author", "get_PrimaryContent", "get_SecondaryContent", "get_Timestamp", "put_Timestamp", "get_TargetUri", "put_TargetUri", "get_Thumbnails", "get_SharedItem", "put_SharedItem", "get_BadgeStyle", "put_BadgeStyle", "get_BadgeCountValue", "put_BadgeCountValue", "get_RemoteId", "put_RemoteId", "get_ChildItem", "put_ChildItem", "get_Style", "put_Style"]

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
     * @type {Integer} 
     */
    BadgeStyle {
        get => this.get_BadgeStyle()
        set => this.put_BadgeStyle(value)
    }

    /**
     * @type {Integer} 
     */
    BadgeCountValue {
        get => this.get_BadgeCountValue()
        set => this.put_BadgeCountValue(value)
    }

    /**
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * @type {SocialFeedChildItem} 
     */
    ChildItem {
        get => this.get_ChildItem()
        set => this.put_ChildItem(value)
    }

    /**
     * @type {Integer} 
     */
    Style {
        get => this.get_Style()
        set => this.put_Style(value)
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

    /**
     * 
     * @returns {Integer} 
     */
    get_BadgeStyle() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BadgeStyle(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BadgeCountValue() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BadgeCountValue(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SocialFeedChildItem} 
     */
    get_ChildItem() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SocialFeedChildItem(value)
    }

    /**
     * 
     * @param {SocialFeedChildItem} value 
     * @returns {HRESULT} 
     */
    put_ChildItem(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Style() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Style(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
