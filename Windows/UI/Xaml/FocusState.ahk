#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes how an element obtained focus.
 * @remarks
 * FocusState is used as a value by the [Control.FocusState](../windows.ui.xaml.controls/control_focusstate.md) property. It's also used as an input by the [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md) method.
 * 
 * If used as an input parameter for [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md), you can't use **Unfocused**. Which value of FocusState to pass to a [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md) call depends on the input scenario and which user interaction your control or app code is responding to. For more info, see Remarks in [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md).
 * 
 * The exact meaning of the FocusState values depends on whether you're reading it from [Control.FocusState](../windows.ui.xaml.controls/control_focusstate.md), or using a value to send to [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md). If you are setting [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md) you're informing other callers (like the control templates) about how that control obtained focus.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.focusstate
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FocusState extends Win32Enum{

    /**
     * Element is not currently focused.
     * @type {Integer (Int32)}
     */
    static Unfocused => 0

    /**
     * Element obtained focus through a pointer action.
     * @type {Integer (Int32)}
     */
    static Pointer => 1

    /**
     * Element obtained focus through a keyboard action, such as tab sequence traversal.
     * @type {Integer (Int32)}
     */
    static Keyboard => 2

    /**
     * Element obtained focus through a deliberate call to [Focus](../windows.ui.xaml.controls/control_focus_195503898.md) or a related API.
     * @type {Integer (Int32)}
     */
    static Programmatic => 3
}
