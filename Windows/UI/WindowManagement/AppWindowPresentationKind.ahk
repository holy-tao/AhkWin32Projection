#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the kind of presentation the app window is using.
 * @remarks
 * This enumeration is used by the [AppWindowPresentationConfiguration.Kind](appwindowpresentationconfiguration_kind.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowpresentationkind
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowPresentationKind extends Win32Enum{

    /**
     * The app window is using the default presentation mode with no specific presentation applied.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The app window is in compact overlay (picture-in-picture) mode.
     * @type {Integer (Int32)}
     */
    static CompactOverlay => 1

    /**
     * The app window is in full screen mode.
     * @type {Integer (Int32)}
     */
    static FullScreen => 2
}
