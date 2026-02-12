#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a control's preference for whether sounds are played.
 * @remarks
 * This enumeration is used by the **ElementSoundMode** property on [Control](../windows.ui.xaml.controls/control_elementsoundmode.md), [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase_elementsoundmode.md), and [Hyperlink](../windows.ui.xaml.documents/hyperlink_elementsoundmode.md).
 * 
 * For more info, see [Sound in UWP apps](/windows/uwp/style/sound).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementsoundmode
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ElementSoundMode extends Win32Enum{

    /**
     * Sound is played based on the [ElementSoundPlayer.State](elementsoundplayer_state.md) setting.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Sound is played only when focus on the control changes.
     * @type {Integer (Int32)}
     */
    static FocusOnly => 1

    /**
     * No sounds are played.
     * @type {Integer (Int32)}
     */
    static Off => 2
}
