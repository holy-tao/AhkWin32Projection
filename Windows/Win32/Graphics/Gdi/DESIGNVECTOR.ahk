#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DESIGNVECTOR structure is used by an application to specify values for the axes of a multiple master font.
 * @remarks
 * The <b>dvNumAxes</b> member determines the actual size of <b>dvValues</b>, and thus, of <b>DESIGNVECTOR</b>. The constant MM_MAX_NUMAXES, which is 16, specifies the maximum allowed size of the <b>dvValues</b> array.
 * 
 * The PostScript Open Type Font does not support multiple master functionality.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-designvector
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DESIGNVECTOR {
    #StructPack 4

    /**
     * Reserved. Must be STAMP_DESIGNVECTOR.
     */
    dvReserved : UInt32

    /**
     * Number of values in the <b>dvValues</b> array.
     */
    dvNumAxes : UInt32

    /**
     * An array specifying the values of the axes of a multiple master OpenType font. This array corresponds to the <b>axlAxisInfo</b> array in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-axeslista">AXESLIST</a> structure.
     */
    dvValues : Int32[16]

}
