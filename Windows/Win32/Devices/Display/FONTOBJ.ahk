#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The FONTOBJ structure is used to give a driver access to information about a particular instance of a font.
 * @remarks
 * 
  * As an accelerator, the driver is allowed to access the public members of the FONTOBJ structure.
  * 
  * A driver can be both a producer and a consumer. For example, a printer driver can act as a producer while processing a call to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvqueryfontdata">DrvQueryFontData</a> function to provide glyph metrics, and later act a consumer while processing a call to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a> function.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-fontobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FONTOBJ extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Specifies a distinct realization of the font. This value can be used by the driver to identify a GDI font that it might have cached or to identify a driver's realization of its own font. If this member is zero for a GDI font, the font should not be cached.
     * @type {Integer}
     */
    iUniq {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the device index for a device font, which was registered by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvqueryfont">DrvQueryFont</a>. If the font is a GDI font, this member has meaning only to GDI, and the driver should ignore it.
     * @type {Integer}
     */
    iFace {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the width, in pixels, of the largest glyph in the specified font.
     * @type {Integer}
     */
    cxMax {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Is a value specifying the type of the font. This member can be a combination of the flags listed in the following table. (Note, however, that FO_GRAY16 and FO_NOGRAY16 are mutually exclusive.)
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * FO_CFF
     * 
     * </td>
     * <td>
     * Postscript OpenType font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_DBCS_FONT
     * 
     * </td>
     * <td>
     * Font supports DBCS code pages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_EM_HEIGHT
     * 
     * </td>
     * <td>
     * TrueType driver internal flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_GRAY16
     * 
     * </td>
     * <td>
     * Font bitmaps are four bits-per-pixel blending (alpha) values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_MULTIPLEMASTER
     * 
     * </td>
     * <td>
     * Multiple Master (Type1 or OpenType) font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_NOGRAY16
     * 
     * </td>
     * <td>
     * Indicates that the font driver cannot (or will not) grayscale a particular font realization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_POSTSCRIPT
     * 
     * </td>
     * <td>
     * Postscript (Type1 or OpenType) font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_SIM_BOLD
     * 
     * </td>
     * <td>
     * Driver-simulated bold font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_SIM_ITALIC
     * 
     * </td>
     * <td>
     * Driver-simulated italic font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_TYPE_DEVICE
     * 
     * </td>
     * <td>
     * Device-specific font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_TYPE_OPENTYPE
     * 
     * </td>
     * <td>
     * OpenType font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_TYPE_RASTER
     * 
     * </td>
     * <td>
     * Bitmap font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_TYPE_TRUETYPE
     * 
     * </td>
     * <td>
     * TrueType font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FO_VERT_FACE
     * 
     * </td>
     * <td>
     * Vertical font.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the FO_RASTER flag is set, the glyphs written to the specified STROBJ structure are bitmaps, otherwise they are pointers to PATHOBJ structures. If the glyph images are returned in the form of PATHOBJ structures, the driver must inspect the FM_INFO_TECH_STROKE flag of the <b>flInfo</b> member of the associated <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifimetrics">IFIMETRICS</a> structure. If that flag is set, the paths should be stroked, otherwise the paths must be filled using the alternating mode convention.
     * 
     * If the FO_GRAY16 flag is set, then the font bitmaps are four bits-per-pixel blending (alpha) values. A value of zero means that the resulting pixel should have the same color as the background. If the alpha value is k, then the following table describes the attributes of the resulting pixel, using either linear alpha blending, or gamma-corrected alpha blending. In both methods, the foreground and background colors are, respectively, c<sub>f</sub> and c<sub>b</sub>.
     * 
     * <table>
     * <tr>
     * <th>Pixel Attribute</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <dl>
     * <dt>Blended Color</dt>
     * <dt>(linear alpha blending)</dt>
     * </dl>
     * 
     * 
     * </td>
     * <td>
     * Linear alpha blending produces a blended color that is a linear combination of the foreground and background colors.
     * 
     *    c = b * c<sub>f</sub> + (1 - b) * c<sub>b</sub>
     * 
     * The blend fraction, b, is obtained as follows:
     * 
     *    b = k / 15, for k = 0, 1, 2, ..., 15
     * 
     * Note: the foreground and background colors include all three color channels (R, G, B).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <dl>
     * <dt>Blended Color</dt>
     * <dt>(gamma-corrected alpha blending)</dt>
     * </dl>
     * 
     * 
     * </td>
     * <td>
     * Gamma-corrected alpha blending produces a blended color by raising a variable that depends on the alpha value to a fixed power. 
     * 
     * Two formulas are provided: one should be used when the foreground color is numerically larger than the background color; the other should be used in the opposite case. (When the foreground and background colors are equal, both formulas simplify to c = c<sub>b</sub>.) 
     * 
     * 
     * <dl>
     * <dt>If c<sub>f</sub> &gt; c<sub>b</sub>,</dt>
     * <dt>c = c<sub>b</sub> + <b>pow</b>(b[k], (1 / gamma)) * (c<sub>f</sub> - c<sub>b</sub>)</dt>
     * </dl>
     * 
     * 
     * 
     * <dl>
     * <dt>If c<sub>f</sub> &lt; c<sub>b</sub>,</dt>
     * <dt>c = c<sub>b</sub> + (1 - <b>pow</b>(1 - b[k], 1 / gamma)) * (c<sub>f</sub> - c<sub>b</sub>)</dt>
     * </dl>
     * 
     * 
     * In these formulas, gamma = 2.33, and b[k] is the k<sup>th</sup> blending fraction, obtained as follows:
     * 
     * 
     * <dl>
     * <dt>   b[k] = 0, for k = 0, and </dt>
     * <dt>b[k] = (k + 1) / 16, for k = 1, 2, ..., 15</dt>
     * </dl>
     * 
     * 
     * Note: unlike linear alpha blending, these formulas must be applied to <i>each</i> of the three color channels (R, G, B).
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * GDI sets the FO_GRAY16 flag on entry to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvqueryfontdata">DrvQueryFontData</a> function when it requests that a font be grayscaled to one of 16 values. If the font driver cannot grayscale a particular font realization, then the font provider clears the FO_GRAY16 flag and sets the FO_NOGRAY16 flag to inform GDI that the grayscaling request will not be satisfied.
     * @type {Integer}
     */
    flFontType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the associated TrueType file. Two separate point size realizations of a TrueType font face will have FONTOBJ structures that share the same <b>iTTUniq</b> value, but will have different <b>iUniq</b> values. Only TrueType font types can have a nonzero <b>iTTUniq</b> member. For more information see <b>flFontType</b>.
     * @type {Pointer}
     */
    iTTUniq {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a driver-defined value for device fonts that are already loaded. If the font is a GDI font, then this member is used internally to identify the font and should be ignored.
     * @type {Pointer}
     */
    iFile {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the resolution of the device for which this font is realized.
     * @type {SIZE}
     */
    sizLogResPpi{
        get {
            if(!this.HasProp("__sizLogResPpi"))
                this.__sizLogResPpi := SIZE(32, this)
            return this.__sizLogResPpi
        }
    }

    /**
     * Specifies the style size of the font instance, in points.
     * @type {Integer}
     */
    ulStyleSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Pointer to consumer-allocated data associated with this font instance. A consumer is a driver that accepts glyph information as input for generating text output. Only a font consumer can modify this member. The consumer of this font can store any information in the location pointed to by this member. The engine will not modify this member. The <b>pvConsumer</b> member is guaranteed to be null the first time a FONTOBJ structure is passed to the consumer.
     * @type {Pointer<Void>}
     */
    pvConsumer {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to producer-allocated data associated with this font instance. A producer is a driver that can produce glyph information as output; this includes glyph metrics, bitmaps, and outlines. Only a font producer can modify this member. The producer of this font can store any information in the location pointed to by this member. The engine will not modify this member. The <b>pvProducer</b> member is guaranteed to be null the first time a FONTOBJ structure is passed to the producer.
     * @type {Pointer<Void>}
     */
    pvProducer {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
