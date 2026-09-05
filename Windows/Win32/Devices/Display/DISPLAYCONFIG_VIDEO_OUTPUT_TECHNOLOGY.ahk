#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY enumeration specifies the target's connector type.
 * @remarks
 * Values with "embedded" in their names indicate that the graphics adapter's video output device connects internally to the display device. In those cases, the DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL value is redundant. The caller should ignore DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL and just process the embedded values, DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EMBEDDED and DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EMBEDDED.
 * 
 * An embedded display port or UDI is also known as an integrated display port or UDI.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ne-wingdi-displayconfig_video_output_technology
 * @namespace Windows.Win32.Devices.Display
 */
class DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY extends Win32Enum {

    /**
     * Indicates a connector that is not one of the types that is indicated by the following enumerators in this enumeration.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => -1

    /**
     * Indicates an HD15 (VGA) connector.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HD15
     * @type {Integer (Int32)}
     */
    static HD15 => 0

    /**
     * Indicates an S-video connector.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SVIDEO
     * @type {Integer (Int32)}
     */
    static SVIDEO => 1

    /**
     * Indicates a composite video connector group.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPOSITE_VIDEO
     * @type {Integer (Int32)}
     */
    static COMPOSITE_VIDEO => 2

    /**
     * Indicates a component video connector group.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPONENT_VIDEO
     * @type {Integer (Int32)}
     */
    static COMPONENT_VIDEO => 3

    /**
     * Indicates a Digital Video Interface (DVI) connector.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DVI
     * @type {Integer (Int32)}
     */
    static DVI => 4

    /**
     * Indicates a High-Definition Multimedia Interface (HDMI) connector.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HDMI
     * @type {Integer (Int32)}
     */
    static HDMI => 5

    /**
     * Indicates a Low Voltage Differential Swing (LVDS) connector.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_LVDS
     * @type {Integer (Int32)}
     */
    static LVDS => 6

    /**
     * Indicates a Japanese D connector.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_D_JPN
     * @type {Integer (Int32)}
     */
    static D_JPN => 8

    /**
     * Indicates an SDI connector.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDI
     * @type {Integer (Int32)}
     */
    static SDI => 9

    /**
     * Indicates an external display port, which is a display port that connects externally to a display device.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EXTERNAL
     * @type {Integer (Int32)}
     */
    static DISPLAYPORT_EXTERNAL => 10

    /**
     * Indicates an embedded display port that connects internally to a display device.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EMBEDDED
     * @type {Integer (Int32)}
     */
    static DISPLAYPORT_EMBEDDED => 11

    /**
     * Indicates an external Unified Display Interface (UDI), which is a UDI that connects externally to a display device.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EXTERNAL
     * @type {Integer (Int32)}
     */
    static UDI_EXTERNAL => 12

    /**
     * Indicates an embedded UDI that connects internally to a display device.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EMBEDDED
     * @type {Integer (Int32)}
     */
    static UDI_EMBEDDED => 13

    /**
     * Indicates a dongle cable that supports standard definition television (SDTV).
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDTVDONGLE
     * @type {Integer (Int32)}
     */
    static SDTVDONGLE => 14

    /**
     * Indicates that the VidPN target is  a Miracast wireless display device.
     * 
     * Supported starting in Windows 8.1.
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_MIRACAST
     * @type {Integer (Int32)}
     */
    static MIRACAST => 15

    /**
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_WIRED
     * @type {Integer (Int32)}
     */
    static INDIRECT_WIRED => 16

    /**
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_VIRTUAL
     * @type {Integer (Int32)}
     */
    static INDIRECT_VIRTUAL => 17

    /**
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_USB_TUNNEL
     * @type {Integer (Int32)}
     */
    static DISPLAYPORT_USB_TUNNEL => 18

    /**
     * Indicates that the video output device connects internally to a display device (for example, the internal connection in a laptop computer).
     * Native name: DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL
     * @type {Integer (Int32)}
     */
    static INTERNAL => -2147483648
}
