#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownAdaptiveNotificationTextStylesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the text styles available for adaptive notifications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class KnownAdaptiveNotificationTextStyles extends IInspectable {
;@region Static Properties
    /**
     * Gets the string that represents the Caption text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.caption
     * @type {HSTRING} 
     */
    static Caption {
        get => KnownAdaptiveNotificationTextStyles.get_Caption()
    }

    /**
     * Gets the string that represents the Body text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.body
     * @type {HSTRING} 
     */
    static Body {
        get => KnownAdaptiveNotificationTextStyles.get_Body()
    }

    /**
     * Gets the string that represents the Base text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.base
     * @type {HSTRING} 
     */
    static Base {
        get => KnownAdaptiveNotificationTextStyles.get_Base()
    }

    /**
     * Gets the string that represents the Subtitle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.subtitle
     * @type {HSTRING} 
     */
    static Subtitle {
        get => KnownAdaptiveNotificationTextStyles.get_Subtitle()
    }

    /**
     * Gets the string that represents the Title text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.title
     * @type {HSTRING} 
     */
    static Title {
        get => KnownAdaptiveNotificationTextStyles.get_Title()
    }

    /**
     * Gets the string that represents the Subheader text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.subheader
     * @type {HSTRING} 
     */
    static Subheader {
        get => KnownAdaptiveNotificationTextStyles.get_Subheader()
    }

    /**
     * Gets the string that represents the Header text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.header
     * @type {HSTRING} 
     */
    static Header {
        get => KnownAdaptiveNotificationTextStyles.get_Header()
    }

    /**
     * Gets the string that represents the TitleNumeral text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.titlenumeral
     * @type {HSTRING} 
     */
    static TitleNumeral {
        get => KnownAdaptiveNotificationTextStyles.get_TitleNumeral()
    }

    /**
     * Gets the string that represents the SubheaderNumeral text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.subheadernumeral
     * @type {HSTRING} 
     */
    static SubheaderNumeral {
        get => KnownAdaptiveNotificationTextStyles.get_SubheaderNumeral()
    }

    /**
     * Gets the string that represents the HeaderNumeral text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.headernumeral
     * @type {HSTRING} 
     */
    static HeaderNumeral {
        get => KnownAdaptiveNotificationTextStyles.get_HeaderNumeral()
    }

    /**
     * Gets the string that represents the CaptionSubtle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.captionsubtle
     * @type {HSTRING} 
     */
    static CaptionSubtle {
        get => KnownAdaptiveNotificationTextStyles.get_CaptionSubtle()
    }

    /**
     * Gets the string that represents the BodySubtle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.bodysubtle
     * @type {HSTRING} 
     */
    static BodySubtle {
        get => KnownAdaptiveNotificationTextStyles.get_BodySubtle()
    }

    /**
     * Gets the string that represents the BaseSubtle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.basesubtle
     * @type {HSTRING} 
     */
    static BaseSubtle {
        get => KnownAdaptiveNotificationTextStyles.get_BaseSubtle()
    }

    /**
     * Gets the string that represents the SubtitleSubtle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.subtitlesubtle
     * @type {HSTRING} 
     */
    static SubtitleSubtle {
        get => KnownAdaptiveNotificationTextStyles.get_SubtitleSubtle()
    }

    /**
     * Gets the string that represents the TitleSubtle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.titlesubtle
     * @type {HSTRING} 
     */
    static TitleSubtle {
        get => KnownAdaptiveNotificationTextStyles.get_TitleSubtle()
    }

    /**
     * Gets the string that represents the SubheaderSubtle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.subheadersubtle
     * @type {HSTRING} 
     */
    static SubheaderSubtle {
        get => KnownAdaptiveNotificationTextStyles.get_SubheaderSubtle()
    }

    /**
     * Gets the string that represents the SubheaderNumeralSubtle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.subheadernumeralsubtle
     * @type {HSTRING} 
     */
    static SubheaderNumeralSubtle {
        get => KnownAdaptiveNotificationTextStyles.get_SubheaderNumeralSubtle()
    }

    /**
     * Gets the string that represents the HeaderSubtle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.headersubtle
     * @type {HSTRING} 
     */
    static HeaderSubtle {
        get => KnownAdaptiveNotificationTextStyles.get_HeaderSubtle()
    }

    /**
     * Gets the string that represents the HeaderNumeralSubtle text style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationtextstyles.headernumeralsubtle
     * @type {HSTRING} 
     */
    static HeaderNumeralSubtle {
        get => KnownAdaptiveNotificationTextStyles.get_HeaderNumeralSubtle()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Caption() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_Caption()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Body() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_Body()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Base() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_Base()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Subtitle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_Subtitle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Title() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Subheader() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_Subheader()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Header() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_Header()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TitleNumeral() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_TitleNumeral()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SubheaderNumeral() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_SubheaderNumeral()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HeaderNumeral() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_HeaderNumeral()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CaptionSubtle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_CaptionSubtle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BodySubtle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_BodySubtle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BaseSubtle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_BaseSubtle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SubtitleSubtle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_SubtitleSubtle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TitleSubtle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_TitleSubtle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SubheaderSubtle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_SubheaderSubtle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SubheaderNumeralSubtle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_SubheaderNumeralSubtle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HeaderSubtle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_HeaderSubtle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HeaderNumeralSubtle() {
        if (!KnownAdaptiveNotificationTextStyles.HasProp("__IKnownAdaptiveNotificationTextStylesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationTextStylesStatics.IID)
            KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics := IKnownAdaptiveNotificationTextStylesStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationTextStyles.__IKnownAdaptiveNotificationTextStylesStatics.get_HeaderNumeralSubtle()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
