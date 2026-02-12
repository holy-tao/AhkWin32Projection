#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the direction that you can programmatically move focus from one element to another element within the app UI.
 * @remarks
 * FocusNavigationDirection.Previous and FocusNavigationDirection.Next cannot be used with [FindNextElementOptions](findnextelementoptions.md). Only FocusNavigationDirection.Up, FocusNavigationDirection.Down, FocusNavigationDirection.Left, or FocusNavigationDirection.Right are valid.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusnavigationdirection
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class FocusNavigationDirection extends Win32Enum{

    /**
     * The next element in the tab order.
     * @type {Integer (Int32)}
     */
    static Next => 0

    /**
     * The previous element in the tab order.
     * @type {Integer (Int32)}
     */
    static Previous => 1

    /**
     * An element above the element with focus. 
     * 
     * > Not supported in Windows 8 apps and Windows Phone apps.
     * @type {Integer (Int32)}
     */
    static Up => 2

    /**
     * An element below the element with focus. 
     * 
     * > Not supported in Windows 8 apps and Windows Phone apps.
     * @type {Integer (Int32)}
     */
    static Down => 3

    /**
     * An element to the left of the element with focus. 
     * 
     * > Not supported in Windows 8 apps and Windows Phone apps.
     * @type {Integer (Int32)}
     */
    static Left => 4

    /**
     * An element to the right of the element with focus. 
     * 
     * > Not supported in Windows 8 apps and Windows Phone apps.
     * @type {Integer (Int32)}
     */
    static Right => 5

    /**
     * No change in focus.
     * 
     * > Not supported in Windows 8 apps and Windows Phone apps.
     * @type {Integer (Int32)}
     */
    static None => 6
}
