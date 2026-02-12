#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a physical connector standard used to connect a display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitorphysicalconnectorkind
 * @namespace Windows.Devices.Display
 * @version WindowsRuntime 1.4
 */
class DisplayMonitorPhysicalConnectorKind extends Win32Enum{

    /**
     * Indicates that the physical connector standard is not known.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Indicates that the physical connector standard is HD15 (also known as a VGA connector).
     * @type {Integer (Int32)}
     */
    static HD15 => 1

    /**
     * Indicates that the physical connector standard is that of an analog television (also known as component video).
     * @type {Integer (Int32)}
     */
    static AnalogTV => 2

    /**
     * Indicates that the physical connector standard is Digital Visual Interface (DVI).
     * @type {Integer (Int32)}
     */
    static Dvi => 3

    /**
     * Indicates that the physical connector standard is High-Definition Multimedia Interface (HDMI).
     * @type {Integer (Int32)}
     */
    static Hdmi => 4

    /**
     * Indicates that the physical connector standard is low-voltage differential signaling (LVDS).
     * @type {Integer (Int32)}
     */
    static Lvds => 5

    /**
     * Indicates that the physical connector standard is serial digital interface (SDI).
     * @type {Integer (Int32)}
     */
    static Sdi => 6

    /**
     * Indicates that the physical connector standard is DisplayPort.
     * @type {Integer (Int32)}
     */
    static DisplayPort => 7
}
