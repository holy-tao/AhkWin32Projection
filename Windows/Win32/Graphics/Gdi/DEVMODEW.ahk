#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVMODE_TRUETYPE_OPTION.ahk" { DEVMODE_TRUETYPE_OPTION }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\DEVMODE_DISPLAY_ORIENTATION.ahk" { DEVMODE_DISPLAY_ORIENTATION }
#Import ".\DEVMODE_DUPLEX.ahk" { DEVMODE_DUPLEX }
#Import ".\DEVMODE_DISPLAY_FIXED_OUTPUT.ahk" { DEVMODE_DISPLAY_FIXED_OUTPUT }
#Import ".\DEVMODE_COLLATE.ahk" { DEVMODE_COLLATE }
#Import ".\DEVMODE_FIELD_FLAGS.ahk" { DEVMODE_FIELD_FLAGS }
#Import ".\DEVMODE_COLOR.ahk" { DEVMODE_COLOR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The DEVMODEW structure is used for specifying characteristics of display and print devices in the Unicode (wide) character set.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows-hardware/drivers/display/the-devmodew-structure">DEVMODEW structure</a> is the Unicode version of the <a href="https://docs.microsoft.com/previous-versions//ms535771(v=vs.85)">DEVMODE </a> structure (described in the Microsoft Windows SDK documentation). While applications can use either the ANSI or Unicode version of the structure, drivers are required to use the Unicode version.
 * 
 * For printer drivers, the DEVMODEW structure is used for specifying printer characteristics required by a print document. It is also used for specifying a printer's default characteristics.
 * 
 * Immediately following a DEVMODEW structure's defined members (often referred to as its public members), there can be a set of driver-defined members (often referred to as private DEVMODEW members). The driver supplies the size, in bytes, of this private area in <b>dmDriverExtra</b>. Driver-defined private members are for exclusive use by the driver. The starting address for the private members can be referenced using the <b>dmSize</b> member as follows:
 * 
 * 
 * ```
 * PVOID pvDriverData = (PVOID) (((BYTE *) pdm) + (pdm->dmSize));
 * ```
 * 
 * 
 * A driver can rely on the spooler to pass a DEVMODEW buffer that is no smaller than (<b>dmSize</b> + <b>dmDriverExtra</b>) bytes. As a result, the driver can safely read that number of bytes starting from the beginning of the buffer without causing an access violation, and without needing to probe memory.
 * 
 * Prior to playing EMF, GDI calls the spooler to validate the contents of the public portion of the DEVMODEW buffer. If the DEVMODEW buffer does not pass the validation tests performed in the spooler, GDI does not pass the buffer on to the printer driver.
 * 
 * <div class="alert"><b>Warning</b>    Windows only confirms that the public portion of DEVMODEW is valid. However, corrupted data in the private portion of the structure can cause driver code to crash in the application or in the spooler process. Consequently, before each use of DEVMODEW data the driver should verify that the private portion of DEVMODEW is well-formed.</div>
 * <div> </div>
 * In Windows 2000, a new <b>union</b> member was added to the DEVMODEW structure. This <b>union</b> member contains an existing DEVMODEW structure member, <b>dmDisplayFlags</b>, together with a new member, <b>dmNup</b>. This member is described in the preceding Members section.
 * 
 * In Windows XP, a new <b>struct</b> member was added. This <b>struct</b> member contains an existing DEVMODEW structure member, <b>dmPosition</b>, together with two new members, <b>dmDisplayOrientation</b> and <b>dmDisplayFixedOutput</b>. These members are described in the preceding Members section. 
 * 
 * Also for Windows XP, several members of the DEVMODEW structure were moved to different locations in this structure. The <b>dmScale</b>, <b>dmCopies</b>, <b>dmDefaultSource</b>, and <b>dmPrintQuality</b> members were appended to the <b>struct</b> member containing the <b>dmOrientation</b>, <b>dmPaperSize</b>, <b>dmPaperLength</b>, and <b>dmPaperWidth</b> members.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines DEVMODE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodew
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset Unicode
 */
export default struct DEVMODEW {
    #StructPack 4

    /**
     * For a display, specifies the name of the display driver's DLL; for example, "perm3dd" for the 3Dlabs Permedia3 display driver.
     * 
     * For a printer, specifies the "friendly name"; for example, "PCL/HP LaserJet" in the case of PCL/HP LaserJet. If the name is greater than CCHDEVICENAME characters in length, the spooler truncates it to fit in the array.
     */
    dmDeviceName : WCHAR[32]

    /**
     * Specifies the version number of this DEVMODEW structure. The current version number is identified by the DM_SPECVERSION constant in <i>wingdi.h</i>.
     */
    dmSpecVersion : UInt16

    /**
     * For a printer, specifies the printer driver version number assigned by the printer driver developer.
     * 
     * Display drivers can set this member to DM_SPECVERSION.
     */
    dmDriverVersion : UInt16

    /**
     * Specifies the size in bytes of the public DEVMODEW structure, not including any private, driver-specified members identified by the <b>dmDriverExtra</b> member.
     */
    dmSize : UInt16

    /**
     * Specifies the number of bytes of private driver data that follow the public structure members. If a device driver does not provide private DEVMODEW members, this member should be set to zero.
     */
    dmDriverExtra : UInt16

    /**
     * Specifies bit flags identifying which of the following DEVMODEW members are in use. For example, the DM_ORIENTATION flag is set when the <b>dmOrientation</b> member contains valid data. The DM_XXX flags are defined in <i>wingdi.h</i>.
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
     * For printers, specifies whether a color printer should print color or monochrome. This member can be one of DMCOLOR_COLOR or DMCOLOR_MONOCHROME.
     * 
     * This member is not used for displays.
     */
    dmColor : DEVMODE_COLOR

    dmDuplex : DEVMODE_DUPLEX

    /**
     * For printers, specifies the <i>y</i> resolution of the printer, in DPI. If this member is used, the <b>dmPrintQuality</b> member specifies the <i>x</i> resolution.
     * 
     * This member is not used for displays.
     */
    dmYResolution : Int16

    /**
     * For printers, specifies how TrueType fonts should be printed. This member must be one of the DMTT-prefixed constants defined in <i>wingdi.h</i>.
     * 
     * This member is not used for displays.
     */
    dmTTOption : DEVMODE_TRUETYPE_OPTION

    dmCollate : DEVMODE_COLLATE

    /**
     * For printers, specifies the name of the form to use; such as "Letter" or "Legal". This must be a name that can be obtain by calling the Win32 <b>EnumForms</b> function (described in the Microsoft Window SDK documentation).
     * 
     * This member is not used for displays.
     */
    dmFormName : WCHAR[32]

    /**
     * For displays, specifies the number of logical pixels per inch of a display device and should be equal to the <b>ulLogPixels</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure.
     * 
     * This member is not used for printers.
     */
    dmLogPixels : UInt16

    /**
     * For displays, specifies the color resolution, in bits per pixel, of a display device. 
     * 
     * This member is not used for printers.
     */
    dmBitsPerPel : UInt32

    /**
     * For displays, specifies the width, in pixels, of the visible device surface.
     * 
     * This member is not used for printers.
     */
    dmPelsWidth : UInt32

    /**
     * For displays, specifies the height, in pixels, of the visible device surface. 
     * 
     * This member is not used for printers.
     */
    dmPelsHeight : UInt32

    dmDisplayFlags : UInt32

    /**
     * For displays, specifies the frequency, in hertz, of a display device in its current mode.
     * 
     * This member is not used for printers.
     */
    dmDisplayFrequency : UInt32

    /**
     * Specifies one of the DMICMMETHOD-prefixed constants defined in <i>wingdi.h</i>.
     */
    dmICMMethod : UInt32

    /**
     * Specifies one of the DMICM-prefixed constants defined in <i>wingdi.h</i>.
     */
    dmICMIntent : UInt32

    /**
     * Specifies one of the DMMEDIA-prefixed constants defined in <i>wingdi.h</i>.
     */
    dmMediaType : UInt32

    /**
     * Specifies one of the DMDITHER-prefixed constants defined in <i>wingdi.h</i>.
     */
    dmDitherType : UInt32

    /**
     * Is reserved for system use and should be ignored by the driver.
     */
    dmReserved1 : UInt32

    /**
     * Is reserved for system use and should be ignored by the driver.
     */
    dmReserved2 : UInt32

    /**
     * Is reserved for system use and should be ignored by the driver.
     */
    dmPanningWidth : UInt32

    /**
     * Is reserved for system use and should be ignored by the driver.
     */
    dmPanningHeight : UInt32

    static __New() {
        DefineProp(this.Prototype, 'dmPosition', { type: POINTL, offset: 76 })
        DefineProp(this.Prototype, 'dmDisplayOrientation', { type: DEVMODE_DISPLAY_ORIENTATION, offset: 84 })
        DefineProp(this.Prototype, 'dmDisplayFixedOutput', { type: DEVMODE_DISPLAY_FIXED_OUTPUT, offset: 88 })
        DefineProp(this.Prototype, 'dmNup', { type: UInt32, offset: 180 })
        this.DeleteProp("__New")
    }
}
