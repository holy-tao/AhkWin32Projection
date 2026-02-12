#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the interaction experiences for non-pointer devices such as an game controller or remote control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.applicationrequirespointermode
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ApplicationRequiresPointerMode extends Win32Enum{

    /**
     * The default system experience for the input device.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * A pointer-like interaction experience using a mouse cursor that can be freely moved using non-pointer input devices.
     * @type {Integer (Int32)}
     */
    static WhenRequested => 1
}
