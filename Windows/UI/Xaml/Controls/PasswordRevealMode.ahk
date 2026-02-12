#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the password reveal behavior of a [PasswordBox](passwordbox.md).
 * @remarks
 * See the [PasswordBox.PasswordRevealMode](passwordbox_passwordrevealmode.md) property for more info and examples.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordrevealmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PasswordRevealMode extends Win32Enum{

    /**
     * The password reveal button is visible. The password is not obscured while the button is pressed.
     * @type {Integer (Int32)}
     */
    static Peek => 0

    /**
     * The password reveal button is not visible. The password is always obscured.
     * @type {Integer (Int32)}
     */
    static Hidden => 1

    /**
     * The password reveal button is not visible. The password is not obscured.
     * @type {Integer (Int32)}
     */
    static Visible => 2
}
