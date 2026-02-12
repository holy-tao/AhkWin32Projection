#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\SocialFeedContent.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\SocialItemThumbnail.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.SocialInfo.Provider
 * @version WindowsRuntime 1.4
 */
class ISocialDashboardItemUpdater extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocialDashboardItemUpdater
     * @type {Guid}
     */
    static IID => Guid("{3cde9dc9-4800-46cd-869b-1973ec685bde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OwnerRemoteId", "get_Content", "get_Timestamp", "put_Timestamp", "put_Thumbnail", "get_Thumbnail", "CommitAsync", "get_TargetUri", "put_TargetUri"]

    /**
     * @type {HSTRING} 
     */
    OwnerRemoteId {
        get => this.get_OwnerRemoteId()
    }

    /**
     * @type {SocialFeedContent} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
        set => this.put_Timestamp(value)
    }

    /**
     * @type {SocialItemThumbnail} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * @type {Uri} 
     */
    TargetUri {
        get => this.get_TargetUri()
        set => this.put_TargetUri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OwnerRemoteId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SocialFeedContent} 
     */
    get_Content() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
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
        result := ComCall(8, this, "ptr", value, "int")
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
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SocialItemThumbnail} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SocialItemThumbnail} 
     */
    get_Thumbnail() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SocialItemThumbnail(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    CommitAsync() {
        result := ComCall(12, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
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
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
