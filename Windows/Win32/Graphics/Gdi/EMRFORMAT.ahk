#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The EMRFORMAT structure contains information that identifies graphics data in an enhanced metafile. A GDICOMMENT_MULTIFORMATS enhanced metafile public comment contains an array of EMRFORMAT structures.
 * @remarks
 * The reference page for <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gdicomment">GdiComment</a> discusses enhanced metafile public comments in general, and the GDICOMMENT_MULTIFORMATS public comment in particular.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrformat
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRFORMAT {
    #StructPack 4

    /**
     * Contains a picture format identifier. The following identifier values are defined.
     * 
     * <table>
     * <tr>
     * <th>Identifier</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>ENHMETA_SIGNATURE</td>
     * <td>The picture is in enhanced metafile format.</td>
     * </tr>
     * <tr>
     * <td>EPS_SIGNATURE</td>
     * <td>The picture is in encapsulated PostScript file format.</td>
     * </tr>
     * </table>
     */
    dSignature : UInt32

    /**
     * Contains a picture version number. The following version number value is defined.
     * 
     * <table>
     * <tr>
     * <th>Version</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>This is the version number of a level 1 encapsulated PostScript file.</td>
     * </tr>
     * </table>
     */
    nVersion : UInt32

    /**
     * The size, in bytes, of the picture data.
     */
    cbData : UInt32

    /**
     * Specifies an offset to the picture data. The offset is figured from the start of the GDICOMMENT_MULTIFORMATS public comment within which this <b>EMRFORMAT</b> structure is embedded. The offset must be a <b>DWORD</b> offset.
     */
    offData : UInt32

}
