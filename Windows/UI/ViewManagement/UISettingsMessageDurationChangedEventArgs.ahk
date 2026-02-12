#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUISettingsMessageDurationChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [MessageDurationChanged](uisettings_messagedurationchanged.md) event.
 * @remarks
 * These animations can be set by the user through the **Accessibility** visual effects settings (Settings -> Accessibility -> Visual effects).
 * 
 * The settings include persistent scrollbars, transparency effects, animation effects, and notification duration.
 * 
 * :::image type="content" source="images/accessibility-display-settings.png" alt-text="Screenshot of the Accessibility Visual effects settings dialog.":::
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettingsmessagedurationchangedeventargs
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class UISettingsMessageDurationChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUISettingsMessageDurationChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUISettingsMessageDurationChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
