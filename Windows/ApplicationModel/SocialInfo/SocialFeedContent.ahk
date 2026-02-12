#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocialFeedContent.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a social media message.
 * @remarks
 * The [SocialFeedSharedItem.Content](socialfeedshareditem_content.md), [SocialFeedChildItem.PrimaryContent](socialfeedchilditem_primarycontent.md) and [SocialFeedChildItem.SecondaryContent](socialfeedchilditem_secondarycontent.md) properties provide access to instances of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedcontent
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialFeedContent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocialFeedContent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocialFeedContent.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the title of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedcontent.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the social media message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedcontent.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
        set => this.put_Message(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) to the target of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedcontent.targeturi
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
    get_Title() {
        if (!this.HasProp("__ISocialFeedContent")) {
            if ((queryResult := this.QueryInterface(ISocialFeedContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedContent := ISocialFeedContent(outPtr)
        }

        return this.__ISocialFeedContent.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__ISocialFeedContent")) {
            if ((queryResult := this.QueryInterface(ISocialFeedContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedContent := ISocialFeedContent(outPtr)
        }

        return this.__ISocialFeedContent.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__ISocialFeedContent")) {
            if ((queryResult := this.QueryInterface(ISocialFeedContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedContent := ISocialFeedContent(outPtr)
        }

        return this.__ISocialFeedContent.get_Message()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Message(value) {
        if (!this.HasProp("__ISocialFeedContent")) {
            if ((queryResult := this.QueryInterface(ISocialFeedContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedContent := ISocialFeedContent(outPtr)
        }

        return this.__ISocialFeedContent.put_Message(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
        if (!this.HasProp("__ISocialFeedContent")) {
            if ((queryResult := this.QueryInterface(ISocialFeedContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedContent := ISocialFeedContent(outPtr)
        }

        return this.__ISocialFeedContent.get_TargetUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_TargetUri(value) {
        if (!this.HasProp("__ISocialFeedContent")) {
            if ((queryResult := this.QueryInterface(ISocialFeedContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedContent := ISocialFeedContent(outPtr)
        }

        return this.__ISocialFeedContent.put_TargetUri(value)
    }

;@endregion Instance Methods
}
