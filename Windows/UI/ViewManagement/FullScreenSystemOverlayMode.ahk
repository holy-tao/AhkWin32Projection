#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the app responds to edge gestures when in full-screen mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.fullscreensystemoverlaymode
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class FullScreenSystemOverlayMode extends Win32Enum{

    /**
     * Edge gestures call up system overlays, like the taskbar and title bar.
     * @type {Integer (Int32)}
     */
    static Standard => 0

    /**
     * Edge gestures call up a temporary UI, which in turn can be used to call up system overlays corresponding to that edge.
     * @type {Integer (Int32)}
     */
    static Minimal => 1
}
