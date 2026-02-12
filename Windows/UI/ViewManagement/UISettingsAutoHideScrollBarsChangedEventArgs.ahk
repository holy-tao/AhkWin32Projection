#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUISettingsAutoHideScrollBarsChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [AutoHideScrollBarsChanged](uisettings_autohidescrollbarschanged.md) event.
 * @remarks
 * Currently, this object provides no event data.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettingsautohidescrollbarschangedeventargs
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class UISettingsAutoHideScrollBarsChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUISettingsAutoHideScrollBarsChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUISettingsAutoHideScrollBarsChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
