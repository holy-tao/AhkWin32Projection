#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivityVisualElements.ahk
#Include .\IUserActivityVisualElements2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information, such as the description and icon, that can be shown in the details tile for a [UserActivity](useractivity.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityvisualelements
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivityVisualElements extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivityVisualElements

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivityVisualElements.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the display text that is used for the details tile text for this **UserActivity**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityvisualelements.displaytext
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
        set => this.put_DisplayText(value)
    }

    /**
     * Gets and sets the description text that is used for the details tile for this **UserActivity**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityvisualelements.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets and sets the background color for the details tile for this **UserActivity**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityvisualelements.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets or sets the visual information about a user activity.
     * @remarks
     * This visual information overrides the visual information that the system provides about the user activity.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityvisualelements.attribution
     * @type {UserActivityAttribution} 
     */
    Attribution {
        get => this.get_Attribution()
        set => this.put_Attribution(value)
    }

    /**
     * Gets and sets the content that is used for the details tile for this **UserActivity**
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityvisualelements.content
     * @type {IAdaptiveCard} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Set the text which is shown in the top banner of the activity card.
     * @remarks
     * You can set the text in the banner without providing the icon.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityvisualelements.attributiondisplaytext
     * @type {HSTRING} 
     */
    AttributionDisplayText {
        get => this.get_AttributionDisplayText()
        set => this.put_AttributionDisplayText(value)
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
    get_DisplayText() {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.get_DisplayText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayText(value) {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.put_DisplayText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.put_Description(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.get_BackgroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.put_BackgroundColor(value)
    }

    /**
     * 
     * @returns {UserActivityAttribution} 
     */
    get_Attribution() {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.get_Attribution()
    }

    /**
     * 
     * @param {UserActivityAttribution} value 
     * @returns {HRESULT} 
     */
    put_Attribution(value) {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.put_Attribution(value)
    }

    /**
     * 
     * @param {IAdaptiveCard} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.put_Content(value)
    }

    /**
     * 
     * @returns {IAdaptiveCard} 
     */
    get_Content() {
        if (!this.HasProp("__IUserActivityVisualElements")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements := IUserActivityVisualElements(outPtr)
        }

        return this.__IUserActivityVisualElements.get_Content()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AttributionDisplayText() {
        if (!this.HasProp("__IUserActivityVisualElements2")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements2 := IUserActivityVisualElements2(outPtr)
        }

        return this.__IUserActivityVisualElements2.get_AttributionDisplayText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AttributionDisplayText(value) {
        if (!this.HasProp("__IUserActivityVisualElements2")) {
            if ((queryResult := this.QueryInterface(IUserActivityVisualElements2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityVisualElements2 := IUserActivityVisualElements2(outPtr)
        }

        return this.__IUserActivityVisualElements2.put_AttributionDisplayText(value)
    }

;@endregion Instance Methods
}
