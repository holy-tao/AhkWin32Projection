#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivityAttribution.ahk
#Include .\IUserActivityAttributionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides graphical information about a user activity. Overrides information the system provides about the user activity.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityattribution
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivityAttribution extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivityAttribution

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivityAttribution.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Create a **UserActivityAttribution** object with the specified icon image URI.
     * @param {Uri} iconUri The Uniform Resource Identifier (URI) of the icon image to use with this **UserActivityAttribution**.
     * @returns {UserActivityAttribution} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityattribution.#ctor
     */
    static CreateWithUri(iconUri) {
        if (!UserActivityAttribution.HasProp("__IUserActivityAttributionFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivityAttribution")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityAttributionFactory.IID)
            UserActivityAttribution.__IUserActivityAttributionFactory := IUserActivityAttributionFactory(factoryPtr)
        }

        return UserActivityAttribution.__IUserActivityAttributionFactory.CreateWithUri(iconUri)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get or set the Uniform Resource Identifier (URI) for the icon image.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityattribution.iconuri
     * @type {Uri} 
     */
    IconUri {
        get => this.get_IconUri()
        set => this.put_IconUri(value)
    }

    /**
     * Get or set the text that describes the icon.
     * @remarks
     * Screen readers use the alternative text string to describe the icon.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityattribution.alternatetext
     * @type {HSTRING} 
     */
    AlternateText {
        get => this.get_AlternateText()
        set => this.put_AlternateText(value)
    }

    /**
     * Get or set whether to allow Windows to append a query string to the image URI supplied from [IconUri](useractivityattribution_iconuri.md) when retrieving the image. The query string includes information that can be used to choose the ideal image based on the DPI of the display, the high contrast setting, and the user's language.
     * @remarks
     * Set to `true` if your server hosts images and can handle query strings, either by retrieving an image variant based on the query strings or by ignoring the query string and returning the image as specified without the query string. This query string specifies scale, contrast setting, and language; for instance, an **IconUri** value of `www.website.com/images/hello.png` becomes `www.website.com/images/hello.png?ms-scale=100&ms-contrast=standard&ms-lang=en-us`.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityattribution.addimagequery
     * @type {Boolean} 
     */
    AddImageQuery {
        get => this.get_AddImageQuery()
        set => this.put_AddImageQuery(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Create a **UserActivityAttribution** object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivityAttribution")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_IconUri() {
        if (!this.HasProp("__IUserActivityAttribution")) {
            if ((queryResult := this.QueryInterface(IUserActivityAttribution.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityAttribution := IUserActivityAttribution(outPtr)
        }

        return this.__IUserActivityAttribution.get_IconUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_IconUri(value) {
        if (!this.HasProp("__IUserActivityAttribution")) {
            if ((queryResult := this.QueryInterface(IUserActivityAttribution.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityAttribution := IUserActivityAttribution(outPtr)
        }

        return this.__IUserActivityAttribution.put_IconUri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlternateText() {
        if (!this.HasProp("__IUserActivityAttribution")) {
            if ((queryResult := this.QueryInterface(IUserActivityAttribution.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityAttribution := IUserActivityAttribution(outPtr)
        }

        return this.__IUserActivityAttribution.get_AlternateText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AlternateText(value) {
        if (!this.HasProp("__IUserActivityAttribution")) {
            if ((queryResult := this.QueryInterface(IUserActivityAttribution.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityAttribution := IUserActivityAttribution(outPtr)
        }

        return this.__IUserActivityAttribution.put_AlternateText(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AddImageQuery() {
        if (!this.HasProp("__IUserActivityAttribution")) {
            if ((queryResult := this.QueryInterface(IUserActivityAttribution.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityAttribution := IUserActivityAttribution(outPtr)
        }

        return this.__IUserActivityAttribution.get_AddImageQuery()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AddImageQuery(value) {
        if (!this.HasProp("__IUserActivityAttribution")) {
            if ((queryResult := this.QueryInterface(IUserActivityAttribution.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityAttribution := IUserActivityAttribution(outPtr)
        }

        return this.__IUserActivityAttribution.put_AddImageQuery(value)
    }

;@endregion Instance Methods
}
