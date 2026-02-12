#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants the specify what kind a windowing environment is.
 * @remarks
 * An example of an Overlapped environment is the classic Windows desktop experience that supports overlapped windows. Examples of Tiled environments are PC [Tablet mode (Windows 10 only)](/windows-hardware/design/device-experiences/continuum) or Xbox.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowingenvironmentkind
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class WindowingEnvironmentKind extends Win32Enum{

    /**
     * The windowing environment is not known.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The windowing environment supports windows that overlap.
     * @type {Integer (Int32)}
     */
    static Overlapped => 1

    /**
     * The windowing environment supports only windows that do not overlap.
     * @type {Integer (Int32)}
     */
    static Tiled => 2
}
