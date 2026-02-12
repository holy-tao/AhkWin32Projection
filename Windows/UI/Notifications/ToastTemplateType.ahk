#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the template to use in a toast notification.
 * @remarks
 * > You can send any toast template to Windows Phone 8.1, but it will be rendered as a modified version of ToastText02, with no image, two text strings (both on the same line, the first string in bold), and the app's Square 150x150 logo. An example is shown here <img src="images/ToastText02Phone.png" alt="Example phone toast" />
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toasttemplatetype
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastTemplateType extends Win32Enum{

    /**
     * A large image and a single string wrapped across three lines of text. <img src="images/toast_6.png" alt="ToastImageAndText01 example" />
     * @type {Integer (Int32)}
     */
    static ToastImageAndText01 => 0

    /**
     * A large image, one string of bold text on the first line, one string of regular text wrapped across the second and third lines. <img src="images/toast_7.png" alt="ToastImageAndText02 example" />
     * @type {Integer (Int32)}
     */
    static ToastImageAndText02 => 1

    /**
     * A large image, one string of bold text wrapped across the first two lines, one string of regular text on the third line. <img src="images/toast_8.png" alt="ToastImageAndText03 example" />
     * @type {Integer (Int32)}
     */
    static ToastImageAndText03 => 2

    /**
     * A large image, one string of bold text on the first line, one string of regular text on the second line, one string of regular text on the third line. <img src="images/ToastImageAndText04.png" alt="ToastImageAndText04 example" />
     * @type {Integer (Int32)}
     */
    static ToastImageAndText04 => 3

    /**
     * A single string wrapped across three lines of text. <img src="images/toast_1.png" alt="ToastText01 example" />
     * @type {Integer (Int32)}
     */
    static ToastText01 => 4

    /**
     * One string of bold text on the first line, one string of regular text wrapped across the second and third lines. <img src="images/toast_2.png" alt="ToastText02 example" />
     * @type {Integer (Int32)}
     */
    static ToastText02 => 5

    /**
     * One string of bold text wrapped across the first and second lines, one string of regular text on the third line. <img src="images/toast_4.png" alt="ToastText03 example" />
     * @type {Integer (Int32)}
     */
    static ToastText03 => 6

    /**
     * One string of bold text on the first line, one string of regular text on the second line, one string of regular text on the third line. <img src="images/toast_5.png" alt="ToastText04 example" />
     * @type {Integer (Int32)}
     */
    static ToastText04 => 7
}
