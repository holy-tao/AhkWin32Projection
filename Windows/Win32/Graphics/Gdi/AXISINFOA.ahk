#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AXISINFO structure contains information about an axis of a multiple master font. (ANSI)
 * @remarks
 * The <b>AXISINFO</b> structure contains the name of an axis in a multiple master font and also the minimum and maximum possible values for the axis. The length of the name is MM_MAX_AXES_NAMELEN, which equals 16. An application queries these values before setting its desired values in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-designvector">DESIGNVECTOR</a> array.
 * 
 * The PostScript Open Type Font does not support multiple master functionality.
 * 
 * For the ANSI version of this structure, <b>axAxisName</b> must be an array of bytes.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines AXISINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-axisinfoa
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset ANSI
 */
export default struct AXISINFOA {
    #StructPack 4

    /**
     * The minimum value for this axis.
     */
    axMinValue : Int32

    /**
     * The maximum value for this axis.
     */
    axMaxValue : Int32

    /**
     * The name of the axis, specified as an array of characters.
     */
    axAxisName : Int8[16]

}
