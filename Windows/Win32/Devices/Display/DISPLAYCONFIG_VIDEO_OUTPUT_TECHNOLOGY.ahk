#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY enumeration specifies the target's connector type.
 * @remarks
 * 
 * Values with "embedded" in their names indicate that the graphics adapter's video output device connects internally to the display device. In those cases, the DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL value is redundant. The caller should ignore DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL and just process the embedded values, DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EMBEDDED and DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EMBEDDED.
 * 
 * An embedded display port or UDI is also known as an integrated display port or UDI.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ne-wingdi-displayconfig_video_output_technology
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY{

    /**
     * Indicates a connector that is not one of the types that is indicated by the following enumerators in this enumeration.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_OTHER => -1

    /**
     * Indicates an HD15 (VGA) connector.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HD15 => 0

    /**
     * Indicates an S-video connector.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SVIDEO => 1

    /**
     * Indicates a composite video connector group.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPOSITE_VIDEO => 2

    /**
     * Indicates a component video connector group.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPONENT_VIDEO => 3

    /**
     * Indicates a Digital Video Interface (DVI) connector.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DVI => 4

    /**
     * Indicates a High-Definition Multimedia Interface (HDMI) connector.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HDMI => 5

    /**
     * Indicates a Low Voltage Differential Swing (LVDS) connector.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_LVDS => 6

    /**
     * Indicates a Japanese D connector.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_D_JPN => 8

    /**
     * Indicates an SDI connector.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDI => 9

    /**
     * Indicates an external display port, which is a display port that connects externally to a display device.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EXTERNAL => 10

    /**
     * Indicates an embedded display port that connects internally to a display device.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EMBEDDED => 11

    /**
     * Indicates an external Unified Display Interface (UDI), which is a UDI that connects externally to a display device.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EXTERNAL => 12

    /**
     * Indicates an embedded UDI that connects internally to a display device.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EMBEDDED => 13

    /**
     * Indicates a dongle cable that supports standard definition television (SDTV).
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDTVDONGLE => 14

    /**
     * Indicates that the VidPN target is  a Miracast wireless display device.
     * 
     * Supported starting in Windows 8.1.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_MIRACAST => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_WIRED => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_VIRTUAL => 17

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_USB_TUNNEL => 18

    /**
     * Indicates that the video output device connects internally to a display device (for example, the internal connection in a laptop computer).
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL => -2147483648
}
