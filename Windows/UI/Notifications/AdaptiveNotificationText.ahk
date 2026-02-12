#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveNotificationText.ahk
#Include .\IAdaptiveNotificationContent.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the text content of an adaptive notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.adaptivenotificationtext
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class AdaptiveNotificationText extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveNotificationText

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveNotificationText.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the text content to display.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.adaptivenotificationtext.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the language of the text content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.adaptivenotificationtext.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Specifies the type of content the notification contains. This property always returns [AdaptiveNotificationContentKind.Text](adaptivenotificationcontentkind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.adaptivenotificationtext.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Specifies hints for formatting the notification, such as the text style, text wrapping, and alignment. For a complete list of hints, see the [text element entry of the Adaptive notifications schema](/windows/uwp/controls-and-patterns/tiles-and-notifications-adaptive-tiles-schema).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.adaptivenotificationtext.hints
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Hints {
        get => this.get_Hints()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [AdaptiveNotificationText](adaptivenotificationtext.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.AdaptiveNotificationText")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IAdaptiveNotificationText")) {
            if ((queryResult := this.QueryInterface(IAdaptiveNotificationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveNotificationText := IAdaptiveNotificationText(outPtr)
        }

        return this.__IAdaptiveNotificationText.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IAdaptiveNotificationText")) {
            if ((queryResult := this.QueryInterface(IAdaptiveNotificationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveNotificationText := IAdaptiveNotificationText(outPtr)
        }

        return this.__IAdaptiveNotificationText.put_Text(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IAdaptiveNotificationText")) {
            if ((queryResult := this.QueryInterface(IAdaptiveNotificationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveNotificationText := IAdaptiveNotificationText(outPtr)
        }

        return this.__IAdaptiveNotificationText.get_Language()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__IAdaptiveNotificationText")) {
            if ((queryResult := this.QueryInterface(IAdaptiveNotificationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveNotificationText := IAdaptiveNotificationText(outPtr)
        }

        return this.__IAdaptiveNotificationText.put_Language(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IAdaptiveNotificationContent")) {
            if ((queryResult := this.QueryInterface(IAdaptiveNotificationContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveNotificationContent := IAdaptiveNotificationContent(outPtr)
        }

        return this.__IAdaptiveNotificationContent.get_Kind()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Hints() {
        if (!this.HasProp("__IAdaptiveNotificationContent")) {
            if ((queryResult := this.QueryInterface(IAdaptiveNotificationContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveNotificationContent := IAdaptiveNotificationContent(outPtr)
        }

        return this.__IAdaptiveNotificationContent.get_Hints()
    }

;@endregion Instance Methods
}
