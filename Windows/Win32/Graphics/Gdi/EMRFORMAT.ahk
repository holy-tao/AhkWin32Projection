#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The EMRFORMAT structure contains information that identifies graphics data in an enhanced metafile. A GDICOMMENT_MULTIFORMATS enhanced metafile public comment contains an array of EMRFORMAT structures.
 * @remarks
 * 
 * The reference page for <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gdicomment">GdiComment</a> discusses enhanced metafile public comments in general, and the GDICOMMENT_MULTIFORMATS public comment in particular.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrformat
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRFORMAT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

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
     * @type {Integer}
     */
    dSignature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    nVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of the picture data.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies an offset to the picture data. The offset is figured from the start of the GDICOMMENT_MULTIFORMATS public comment within which this <b>EMRFORMAT</b> structure is embedded. The offset must be a <b>DWORD</b> offset.
     * @type {Integer}
     */
    offData {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
