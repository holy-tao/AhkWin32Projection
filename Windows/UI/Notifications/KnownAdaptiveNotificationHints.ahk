#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownAdaptiveNotificationHintsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the types of hints available to adaptive notifications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationhints
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class KnownAdaptiveNotificationHints extends IInspectable {
;@region Static Properties
    /**
     * Gets a string representation of the style hint for adaptive notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationhints.style
     * @type {HSTRING} 
     */
    static Style {
        get => KnownAdaptiveNotificationHints.get_Style()
    }

    /**
     * Gets a string representation of the wrap hint for adaptive notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationhints.wrap
     * @type {HSTRING} 
     */
    static Wrap {
        get => KnownAdaptiveNotificationHints.get_Wrap()
    }

    /**
     * Gets a string representation of the max-lines hint for adaptive notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationhints.maxlines
     * @type {HSTRING} 
     */
    static MaxLines {
        get => KnownAdaptiveNotificationHints.get_MaxLines()
    }

    /**
     * Gets a string representation of the min-lines hint for adaptive notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationhints.minlines
     * @type {HSTRING} 
     */
    static MinLines {
        get => KnownAdaptiveNotificationHints.get_MinLines()
    }

    /**
     * Gets a string representation of the text-stacking hint for adaptive notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationhints.textstacking
     * @type {HSTRING} 
     */
    static TextStacking {
        get => KnownAdaptiveNotificationHints.get_TextStacking()
    }

    /**
     * Gets a string representation of the align hint for adaptive notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownadaptivenotificationhints.align
     * @type {HSTRING} 
     */
    static Align {
        get => KnownAdaptiveNotificationHints.get_Align()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Style() {
        if (!KnownAdaptiveNotificationHints.HasProp("__IKnownAdaptiveNotificationHintsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationHints")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationHintsStatics.IID)
            KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics := IKnownAdaptiveNotificationHintsStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics.get_Style()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Wrap() {
        if (!KnownAdaptiveNotificationHints.HasProp("__IKnownAdaptiveNotificationHintsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationHints")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationHintsStatics.IID)
            KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics := IKnownAdaptiveNotificationHintsStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics.get_Wrap()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MaxLines() {
        if (!KnownAdaptiveNotificationHints.HasProp("__IKnownAdaptiveNotificationHintsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationHints")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationHintsStatics.IID)
            KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics := IKnownAdaptiveNotificationHintsStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics.get_MaxLines()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MinLines() {
        if (!KnownAdaptiveNotificationHints.HasProp("__IKnownAdaptiveNotificationHintsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationHints")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationHintsStatics.IID)
            KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics := IKnownAdaptiveNotificationHintsStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics.get_MinLines()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TextStacking() {
        if (!KnownAdaptiveNotificationHints.HasProp("__IKnownAdaptiveNotificationHintsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationHints")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationHintsStatics.IID)
            KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics := IKnownAdaptiveNotificationHintsStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics.get_TextStacking()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Align() {
        if (!KnownAdaptiveNotificationHints.HasProp("__IKnownAdaptiveNotificationHintsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownAdaptiveNotificationHints")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownAdaptiveNotificationHintsStatics.IID)
            KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics := IKnownAdaptiveNotificationHintsStatics(factoryPtr)
        }

        return KnownAdaptiveNotificationHints.__IKnownAdaptiveNotificationHintsStatics.get_Align()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
