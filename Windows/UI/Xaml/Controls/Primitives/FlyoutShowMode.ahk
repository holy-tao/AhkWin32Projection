#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how a flyout behaves when shown.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutshowmode
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class FlyoutShowMode extends Win32Enum{

    /**
     * The show mode is determined automatically based on the method used to show the flyout.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Behavior is typical of a flyout shown reactively, like a context menu. The open flyout takes focus. For a CommandBarFlyout, it opens in its expanded state.
     * @type {Integer (Int32)}
     */
    static Standard => 1

    /**
     * Behavior is typical of a flyout shown proactively. The open flyout does not take focus. For a CommandBarFlyout, it opens in its collapsed state.
     * @type {Integer (Int32)}
     */
    static Transient => 2

    /**
     * The flyout exhibits Transient behavior while the cursor is close to it, but is dismissed when the cursor moves away.
     * @type {Integer (Int32)}
     */
    static TransientWithDismissOnPointerMoveAway => 3
}
