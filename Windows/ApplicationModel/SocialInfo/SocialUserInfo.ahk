#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocialUserInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a user of a social media provider service.
 * @remarks
 * The [SocialFeedChildItem.Author](socialfeedchilditem_author.md) property provides access to an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialuserinfo
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialUserInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocialUserInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocialUserInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the name of the social media user, suitable for display.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialuserinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets the username for the user on the social media service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialuserinfo.username
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
        set => this.put_UserName(value)
    }

    /**
     * Gets or sets a value that identifies the user on the social media service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialuserinfo.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) to the user on the social media system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialuserinfo.targeturi
     * @type {Uri} 
     */
    TargetUri {
        get => this.get_TargetUri()
        set => this.put_TargetUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__ISocialUserInfo")) {
            if ((queryResult := this.QueryInterface(ISocialUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialUserInfo := ISocialUserInfo(outPtr)
        }

        return this.__ISocialUserInfo.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__ISocialUserInfo")) {
            if ((queryResult := this.QueryInterface(ISocialUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialUserInfo := ISocialUserInfo(outPtr)
        }

        return this.__ISocialUserInfo.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        if (!this.HasProp("__ISocialUserInfo")) {
            if ((queryResult := this.QueryInterface(ISocialUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialUserInfo := ISocialUserInfo(outPtr)
        }

        return this.__ISocialUserInfo.get_UserName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserName(value) {
        if (!this.HasProp("__ISocialUserInfo")) {
            if ((queryResult := this.QueryInterface(ISocialUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialUserInfo := ISocialUserInfo(outPtr)
        }

        return this.__ISocialUserInfo.put_UserName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__ISocialUserInfo")) {
            if ((queryResult := this.QueryInterface(ISocialUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialUserInfo := ISocialUserInfo(outPtr)
        }

        return this.__ISocialUserInfo.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__ISocialUserInfo")) {
            if ((queryResult := this.QueryInterface(ISocialUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialUserInfo := ISocialUserInfo(outPtr)
        }

        return this.__ISocialUserInfo.put_RemoteId(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
        if (!this.HasProp("__ISocialUserInfo")) {
            if ((queryResult := this.QueryInterface(ISocialUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialUserInfo := ISocialUserInfo(outPtr)
        }

        return this.__ISocialUserInfo.get_TargetUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_TargetUri(value) {
        if (!this.HasProp("__ISocialUserInfo")) {
            if ((queryResult := this.QueryInterface(ISocialUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialUserInfo := ISocialUserInfo(outPtr)
        }

        return this.__ISocialUserInfo.put_TargetUri(value)
    }

;@endregion Instance Methods
}
