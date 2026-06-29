#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVMODE_TRUETYPE_OPTION.ahk" { DEVMODE_TRUETYPE_OPTION }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\DEVMODE_DISPLAY_ORIENTATION.ahk" { DEVMODE_DISPLAY_ORIENTATION }
#Import ".\DEVMODE_DUPLEX.ahk" { DEVMODE_DUPLEX }
#Import ".\DEVMODE_DISPLAY_FIXED_OUTPUT.ahk" { DEVMODE_DISPLAY_FIXED_OUTPUT }
#Import ".\DEVMODE_COLLATE.ahk" { DEVMODE_COLLATE }
#Import ".\DEVMODE_FIELD_FLAGS.ahk" { DEVMODE_FIELD_FLAGS }
#Import ".\DEVMODE_COLOR.ahk" { DEVMODE_COLOR }

/**
 * The DEVMODE data structure contains information about the initialization and environment of a printer or a display device.
 * @remarks
 * A device driver's private data follows the public portion of the <b>DEVMODE</b> structure. The size of the public data can vary for different versions of the structure. The <b>dmSize</b> member specifies the number of bytes of public data, and the <b>dmDriverExtra</b> member specifies the number of bytes of private data.
 *       
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines DEVMODE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset ANSI
 */
export default struct DEVMODEA {
    #StructPack 4

    /**
     * A zero-terminated character array that specifies the "friendly" name of the printer or display; for example, "PCL/HP LaserJet" in the case of PCL/HP LaserJet. This string is unique among device drivers. Note that this name may be truncated to fit in the <b>dmDeviceName</b> array.
     */
    dmDeviceName : Int8[32]

    /**
     * The version number of the initialization data specification on which the structure is based. To ensure the correct version is used for any operating system, use DM_SPECVERSION.
     */
    dmSpecVersion : UInt16

    /**
     * The driver version number assigned by the driver developer.
     */
    dmDriverVersion : UInt16

    /**
     * Specifies the size, in bytes, of the <b>DEVMODE</b> structure, not including any private driver-specific data that might follow the structure's public members. Set this member to <c>sizeof (DEVMODE)</c> to indicate the version of the <b>DEVMODE</b> structure being used.
     */
    dmSize : UInt16

    /**
     * Contains the number of bytes of private driver-data that follow this structure. If a device driver does not use device-specific information, set this member to zero.
     */
    dmDriverExtra : UInt16

    /**
     * Specifies whether certain members of the <b>DEVMODE</b> structure have been initialized. If a member is initialized, its corresponding bit is set, otherwise the bit is clear. A driver supports only those <b>DEVMODE</b> members that are appropriate for the printer or display technology.
     * 
     * The following values are defined, and are listed here with the corresponding structure members.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure member</th>
     * </tr>
     * <tr>
     * <td>DM_ORIENTATION</td>
     * <td><b>dmOrientation</b></td>
     * </tr>
     * <tr>
     * <td>DM_PAPERSIZE</td>
     * <td><b>dmPaperSize</b></td>
     * </tr>
     * <tr>
     * <td>DM_PAPERLENGTH</td>
     * <td><b>dmPaperLength</b></td>
     * </tr>
     * <tr>
     * <td>DM_PAPERWIDTH</td>
     * <td><b>dmPaperWidth</b></td>
     * </tr>
     * <tr>
     * <td>DM_SCALE</td>
     * <td><b>dmScale</b></td>
     * </tr>
     * <tr>
     * <td>DM_COPIES</td>
     * <td><b>dmCopies</b></td>
     * </tr>
     * <tr>
     * <td>DM_DEFAULTSOURCE</td>
     * <td><b>dmDefaultSource</b></td>
     * </tr>
     * <tr>
     * <td>DM_PRINTQUALITY</td>
     * <td><b>dmPrintQuality</b></td>
     * </tr>
     * <tr>
     * <td>DM_POSITION</td>
     * <td><b>dmPosition</b></td>
     * </tr>
     * <tr>
     * <td>DM_DISPLAYORIENTATION</td>
     * <td><b>dmDisplayOrientation</b></td>
     * </tr>
     * <tr>
     * <td>DM_DISPLAYFIXEDOUTPUT</td>
     * <td><b>dmDisplayFixedOutput</b></td>
     * </tr>
     * <tr>
     * <td>DM_COLOR</td>
     * <td><b>dmColor</b></td>
     * </tr>
     * <tr>
     * <td>DM_DUPLEX</td>
     * <td><b>dmDuplex</b></td>
     * </tr>
     * <tr>
     * <td>DM_YRESOLUTION</td>
     * <td><b>dmYResolution</b></td>
     * </tr>
     * <tr>
     * <td>DM_TTOPTION</td>
     * <td><b>dmTTOption</b></td>
     * </tr>
     * <tr>
     * <td>DM_COLLATE</td>
     * <td><b>dmCollate</b></td>
     * </tr>
     * <tr>
     * <td>DM_FORMNAME</td>
     * <td><b>dmFormName</b></td>
     * </tr>
     * <tr>
     * <td>DM_LOGPIXELS</td>
     * <td><b>dmLogPixels</b></td>
     * </tr>
     * <tr>
     * <td>DM_BITSPERPEL</td>
     * <td><b>dmBitsPerPel</b></td>
     * </tr>
     * <tr>
     * <td>DM_PELSWIDTH</td>
     * <td><b>dmPelsWidth</b></td>
     * </tr>
     * <tr>
     * <td>DM_PELSHEIGHT</td>
     * <td><b>dmPelsHeight</b></td>
     * </tr>
     * <tr>
     * <td>DM_DISPLAYFLAGS</td>
     * <td><b>dmDisplayFlags</b></td>
     * </tr>
     * <tr>
     * <td>DM_NUP</td>
     * <td><b>dmNup</b></td>
     * </tr>
     * <tr>
     * <td>DM_DISPLAYFREQUENCY</td>
     * <td><b>dmDisplayFrequency</b></td>
     * </tr>
     * <tr>
     * <td>DM_ICMMETHOD</td>
     * <td><b>dmICMMethod</b></td>
     * </tr>
     * <tr>
     * <td>DM_ICMINTENT</td>
     * <td><b>dmICMIntent</b></td>
     * </tr>
     * <tr>
     * <td>DM_MEDIATYPE</td>
     * <td><b>dmMediaType</b></td>
     * </tr>
     * <tr>
     * <td>DM_DITHERTYPE</td>
     * <td><b>dmDitherType</b></td>
     * </tr>
     * <tr>
     * <td>DM_PANNINGWIDTH</td>
     * <td><b>dmPanningWidth</b></td>
     * </tr>
     * <tr>
     * <td>DM_PANNINGHEIGHT</td>
     * <td><b>dmPanningHeight</b></td>
     * </tr>
     * </table>
     */
    dmFields : DEVMODE_FIELD_FLAGS

    dmOrientation : Int16

    dmPaperSize : Int16

    dmPaperLength : Int16

    dmPaperWidth : Int16

    dmScale : Int16

    dmCopies : Int16

    dmDefaultSource : Int16

    dmPrintQuality : Int16

    /**
     * Switches between color and monochrome on color printers. The following are the possible values:
     * 
     * <ul>
     * <li>DMCOLOR_COLOR</li>
     * <li>DMCOLOR_MONOCHROME</li>
     * </ul>
     */
    dmColor : DEVMODE_COLOR

    /**
     * Selects duplex or double-sided printing for printers capable of duplex printing. Following are the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>DMDUP_SIMPLEX</td>
     * <td>Normal (nonduplex) printing.</td>
     * </tr>
     * <tr>
     * <td>DMDUP_HORIZONTAL</td>
     * <td>Short-edge binding, that is, the long edge of the page is horizontal.</td>
     * </tr>
     * <tr>
     * <td>DMDUP_VERTICAL</td>
     * <td>Long-edge binding, that is, the long edge of the page is vertical.</td>
     * </tr>
     * </table>
     */
    dmDuplex : DEVMODE_DUPLEX

    /**
     * Specifies the y-resolution, in dots per inch, of the printer. If the printer initializes this member, the <b>dmPrintQuality</b> member specifies the x-resolution, in dots per inch, of the printer.
     */
    dmYResolution : Int16

    dmTTOption : DEVMODE_TRUETYPE_OPTION

    dmCollate : DEVMODE_COLLATE

    /**
     * A zero-terminated character array that specifies the name of the form to use; for example, "Letter" or "Legal". A complete set of names can be retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/printdocs/enumforms">EnumForms</a> function.
     */
    dmFormName : Int8[32]

    /**
     * The number of pixels per logical inch. Printer drivers do not use this member.
     */
    dmLogPixels : UInt16

    /**
     * Specifies the color resolution, in bits per pixel, of the display device (for example: 4 bits for 16 colors, 8 bits for 256 colors, or 16 bits for 65,536 colors). Display drivers use this member, for example, in the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-changedisplaysettingsa">ChangeDisplaySettings</a> function. Printer drivers do not use this member.
     */
    dmBitsPerPel : UInt32

    /**
     * Specifies the width, in pixels, of the visible device surface. Display drivers use this member, for example, in the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-changedisplaysettingsa">ChangeDisplaySettings</a> function. Printer drivers do not use this member.
     */
    dmPelsWidth : UInt32

    /**
     * Specifies the height, in pixels, of the visible device surface. Display drivers use this member, for example, in the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-changedisplaysettingsa">ChangeDisplaySettings</a> function. Printer drivers do not use this member.
     */
    dmPelsHeight : UInt32

    dmDisplayFlags : UInt32

    /**
     * Specifies the frequency, in hertz (cycles per second), of the display device in a particular mode. This value is also known as the display device's vertical refresh rate. Display drivers use this member. It is used, for example, in the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-changedisplaysettingsa">ChangeDisplaySettings</a> function. Printer drivers do not use this member.
     * 
     * When you call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaysettingsa">EnumDisplaySettings</a> function, the <b>dmDisplayFrequency</b> member may return with the value 0 or 1. These values represent the display hardware's default refresh rate. This default rate is typically set by switches on a display card or computer motherboard, or by a configuration program that does not use display functions such as <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-changedisplaysettingsa">ChangeDisplaySettings</a>.
     */
    dmDisplayFrequency : UInt32

    /**
     * Specifies how ICM is handled. For a non-ICM application, this member determines if ICM is enabled or disabled. For ICM applications, the system examines this member to determine how to handle ICM support. This member can be one of the following predefined values, or a driver-defined value greater than or equal to the value of DMICMMETHOD_USER.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>DMICMMETHOD_NONE</td>
     * <td>Specifies that ICM is disabled.</td>
     * </tr>
     * <tr>
     * <td>DMICMMETHOD_SYSTEM</td>
     * <td>Specifies that ICM is handled by Windows.</td>
     * </tr>
     * <tr>
     * <td>DMICMMETHOD_DRIVER</td>
     * <td>Specifies that ICM is handled by the device driver.</td>
     * </tr>
     * <tr>
     * <td>DMICMMETHOD_DEVICE</td>
     * <td>Specifies that ICM is handled by the destination device.</td>
     * </tr>
     * </table>
     *  
     * 
     * The printer driver must provide a user interface for setting this member. Most printer drivers support only the DMICMMETHOD_SYSTEM or DMICMMETHOD_NONE value. Drivers for PostScript printers support all values.
     */
    dmICMMethod : UInt32

    /**
     * Specifies which color matching method, or intent, should be used by default. This member is primarily for non-ICM applications. ICM applications can establish intents by using the ICM functions. This member can be one of the following predefined values, or a driver defined value greater than or equal to the value of DMICM_USER.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>DMICM_ABS_COLORIMETRIC</td>
     * <td>Color matching should optimize to match the exact color requested without white point mapping. This value is most appropriate for use with proofing.</td>
     * </tr>
     * <tr>
     * <td>DMICM_COLORIMETRIC</td>
     * <td>Color matching should optimize to match the exact color requested. This value is most appropriate for use with business logos or other images when an exact color match is desired.</td>
     * </tr>
     * <tr>
     * <td>DMICM_CONTRAST</td>
     * <td>Color matching should optimize for color contrast. This value is the most appropriate choice for scanned or photographic images when dithering is desired.</td>
     * </tr>
     * <tr>
     * <td>DMICM_SATURATE</td>
     * <td>Color matching should optimize for color saturation. This value is the most appropriate choice for business graphs when dithering is not desired.</td>
     * </tr>
     * </table>
     */
    dmICMIntent : UInt32

    /**
     * Specifies the type of media being printed on. The member can be one of the following predefined values, or a driver-defined value greater than or equal to the value of DMMEDIA_USER.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>DMMEDIA_STANDARD</td>
     * <td>Plain paper.</td>
     * </tr>
     * <tr>
     * <td>DMMEDIA_GLOSSY</td>
     * <td>Glossy paper.</td>
     * </tr>
     * <tr>
     * <td>DMMEDIA_TRANSPARENCY</td>
     * <td>Transparent film.</td>
     * </tr>
     * </table>
     *  
     * 
     *  To retrieve a list of the available media types for a printer, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-devicecapabilitiesa">DeviceCapabilities</a> function with the DC_MEDIATYPES flag.
     */
    dmMediaType : UInt32

    /**
     * Specifies how dithering is to be done. The member can be one of the following predefined values, or a driver-defined value greater than or equal to the value of DMDITHER_USER.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>DMDITHER_NONE</td>
     * <td>No dithering.</td>
     * </tr>
     * <tr>
     * <td>DMDITHER_COARSE</td>
     * <td>Dithering with a coarse brush.</td>
     * </tr>
     * <tr>
     * <td>DMDITHER_FINE</td>
     * <td>Dithering with a fine brush.</td>
     * </tr>
     * <tr>
     * <td>DMDITHER_LINEART</td>
     * <td>Line art dithering, a special dithering method that produces well defined borders between black, white, and gray scaling. It is not suitable for images that include continuous graduations in intensity and hue, such as scanned photographs.</td>
     * </tr>
     * <tr>
     * <td>DMDITHER_GRAYSCALE</td>
     * <td>Device does gray scaling.</td>
     * </tr>
     * </table>
     */
    dmDitherType : UInt32

    /**
     * Not used; must be zero.
     */
    dmReserved1 : UInt32

    /**
     * Not used; must be zero.
     */
    dmReserved2 : UInt32

    /**
     * This member must be zero.
     */
    dmPanningWidth : UInt32

    /**
     * This member must be zero.
     */
    dmPanningHeight : UInt32

    static __New() {
        DefineProp(this.Prototype, 'dmPosition', { type: POINTL, offset: 44 })
        DefineProp(this.Prototype, 'dmDisplayOrientation', { type: DEVMODE_DISPLAY_ORIENTATION, offset: 52 })
        DefineProp(this.Prototype, 'dmDisplayFixedOutput', { type: DEVMODE_DISPLAY_FIXED_OUTPUT, offset: 56 })
        DefineProp(this.Prototype, 'dmNup', { type: UInt32, offset: 116 })
        this.DeleteProp("__New")
    }
}
