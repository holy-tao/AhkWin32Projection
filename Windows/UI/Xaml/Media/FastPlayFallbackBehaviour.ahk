#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) fast-forward/backward buttons behave.
 * @remarks
 * This enumeration provides values for the MediaTransportControls.FastPlayFallbackBehaviour property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.fastplayfallbackbehaviour
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class FastPlayFallbackBehaviour extends Win32Enum{

    /**
     * If the media doesn't support fast-forward/fast-rewind, the media skips 30 seconds.
     * @type {Integer (Int32)}
     */
    static Skip => 0

    /**
     * If the media doesn't support fast-forward/fast-rewind, the buttons are hidden.
     * @type {Integer (Int32)}
     */
    static Hide => 1

    /**
     * If the media doesn't support fast-forward/fast-rewind, the buttons are disabled.
     * @type {Integer (Int32)}
     */
    static Disable => 2
}
