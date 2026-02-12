#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentLinkInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about a ContentLink.
 * @remarks
 * > [!IMPORTANT]
 * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.contentlinkinfo
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ContentLinkInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentLinkInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentLinkInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the identifier for the content link.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.contentlinkinfo.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets or sets the text to display for the link.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.contentlinkinfo.displaytext
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
        set => this.put_DisplayText(value)
    }

    /**
     * Gets or sets additional information about the ContentLink to display to the user.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.contentlinkinfo.secondarytext
     * @type {HSTRING} 
     */
    SecondaryText {
        get => this.get_SecondaryText()
        set => this.put_SecondaryText(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the app to launch when the link is activated.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.contentlinkinfo.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets or sets a value that indicates what kind of content the link contains.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.contentlinkinfo.linkcontentkind
     * @type {HSTRING} 
     */
    LinkContentKind {
        get => this.get_LinkContentKind()
        set => this.put_LinkContentKind(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the ContentLinkInfo class.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.ContentLinkInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.get_Id()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayText() {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.get_DisplayText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayText(value) {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.put_DisplayText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecondaryText() {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.get_SecondaryText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SecondaryText(value) {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.put_SecondaryText(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.get_Uri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.put_Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LinkContentKind() {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.get_LinkContentKind()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LinkContentKind(value) {
        if (!this.HasProp("__IContentLinkInfo")) {
            if ((queryResult := this.QueryInterface(IContentLinkInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInfo := IContentLinkInfo(outPtr)
        }

        return this.__IContentLinkInfo.put_LinkContentKind(value)
    }

;@endregion Instance Methods
}
