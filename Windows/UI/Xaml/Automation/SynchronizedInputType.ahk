#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides a of set constants that identify, as used by the [ISynchronizedInputProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-isynchronizedinputprovider)  Microsoft UI Automation interface.
 * @remarks
 * Values of SynchronizedInputType are used as an input parameter by the [StartListening](../windows.ui.xaml.automation.provider/isynchronizedinputprovider_startlistening_125371983.md) method.
 * 
 * The values in SynchronizedInputType parallel the values in the [SynchronizedInputType](/windows/desktop/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype) enumeration.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.synchronizedinputtype
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class SynchronizedInputType extends Win32Enum{

    /**
     * A key has been released.
     * @type {Integer (Int32)}
     */
    static KeyUp => 1

    /**
     * A key has been pressed.
     * @type {Integer (Int32)}
     */
    static KeyDown => 2

    /**
     * The left mouse button has been released.
     * @type {Integer (Int32)}
     */
    static LeftMouseUp => 4

    /**
     * The left mouse button has been pressed.
     * @type {Integer (Int32)}
     */
    static LeftMouseDown => 8

    /**
     * The right mouse button has been released.
     * @type {Integer (Int32)}
     */
    static RightMouseUp => 16

    /**
     * The right mouse button has been pressed.
     * @type {Integer (Int32)}
     */
    static RightMouseDown => 32
}
