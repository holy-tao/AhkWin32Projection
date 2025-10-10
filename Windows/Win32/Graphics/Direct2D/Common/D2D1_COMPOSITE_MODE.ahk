#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used to specify the blend mode for all of the Direct2D blending operations.
 * @remarks
 * 
  * The figure here shows an example of each of the modes with images that have an opacity of 1.0 or 0.5. 
  * 
  * <img alt="An example image of each of the modes with opacity set to 1.0 or 0.5." src="./images/composite_types.png"/>
  * 
  * There can be slightly different interpretations of these enumeration values depending on where the value is used.
  * 
  * <ul>
  * <li>
  * With a composite effect:
  * 
  * <b>D2D1_COMPOSITE_MODE_DESTINATION_COPY</b> is equivalent to <b>D2D1_COMPOSITE_MODE_SOURCE_COPY</b> with the inputs inverted.</li>
  * <li>
  * As a parameter to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">ID2D1DeviceContext::DrawImage</a>: 
  * <b>D2D1_COMPOSITE_MODE_DESTINATION_COPY</b> is a no-op since the destination is already in the selected target.</li>
  * </ul>
  * <h3><a id="Sample_code"></a><a id="sample_code"></a><a id="SAMPLE_CODE"></a>Sample code</h3>
  * For an example that uses composite modes, download the <a href="https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Direct2D%20composite%20effect%20modes%20sample">Direct2D composite effect modes sample</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ne-d2d1_1-d2d1_composite_mode
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_COMPOSITE_MODE{

    /**
     * The standard source-over-destination blend mode.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_SOURCE_OVER => 0

    /**
     * The destination is rendered over the source.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_DESTINATION_OVER => 1

    /**
     * Performs a logical clip of the source pixels against the destination pixels.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_SOURCE_IN => 2

    /**
     * The inverse of the <b>D2D1_COMPOSITE_MODE_SOURCE_IN</b> operation.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_DESTINATION_IN => 3

    /**
     * This is the logical inverse to <b>D2D1_COMPOSITE_MODE_SOURCE_IN</b>.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_SOURCE_OUT => 4

    /**
     * The is the logical inverse to <b>D2D1_COMPOSITE_MODE_DESTINATION_IN</b>.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_DESTINATION_OUT => 5

    /**
     * Writes the source pixels over the destination where there are destination pixels.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_SOURCE_ATOP => 6

    /**
     * The logical inverse of <b>D2D1_COMPOSITE_MODE_SOURCE_ATOP</b>.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_DESTINATION_ATOP => 7

    /**
     * The source is inverted with the destination.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_XOR => 8

    /**
     * The channel components are summed.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_PLUS => 9

    /**
     * The source is copied to the destination; the destination pixels are ignored.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_SOURCE_COPY => 10

    /**
     * Equivalent to <b>D2D1_COMPOSITE_MODE_SOURCE_COPY</b>, but pixels outside of the source bounds are unchanged.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_BOUNDED_SOURCE_COPY => 11

    /**
     * Destination colors are inverted according to a source mask.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_MODE_MASK_INVERT => 12
}
