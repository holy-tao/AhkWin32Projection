#Requires AutoHotkey v2.0.0 64-bit

/**
 * The BrushType enumeration indicates the type of brush. There are five types of brushes.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-brushtype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class BrushType{

    /**
     * Indicates a brush of type <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusbrush/nl-gdiplusbrush-solidbrush">SolidBrush</a>. A solid brush paints a single, constant color that can be opaque or transparent.
     * @type {Integer (Int32)}
     */
    static BrushTypeSolidColor => 0

    /**
     * Indicates a brush of type <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusbrush/nl-gdiplusbrush-hatchbrush">HatchBrush</a>. A hatch brush paints a background and paints, over that background, a pattern of lines, dots, dashes, squares, crosshatch, or some variation of these. The hatch brush consists of two colors: one for the background and one for the pattern over the background. The color of the background is called the 
     * 				<i>background color</i>, and the color of the pattern is called the 
     * 				<i>foreground color</i>.
     * @type {Integer (Int32)}
     */
    static BrushTypeHatchFill => 1

    /**
     * Indicates a brush of type <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusbrush/nl-gdiplusbrush-texturebrush">TextureBrush</a>. A texture brush paints an image. The image or 
     * 				<i>texture</i> is either a portion of a specified image or a scaled version of a specified image. The type of image (metafile or nonmetafile) determines whether the texture is a portion of the image or a scaled version of the image.
     * @type {Integer (Int32)}
     */
    static BrushTypeTextureFill => 2

    /**
     * Indicates a brush of type <a href="https://docs.microsoft.com/windows/desktop/api/gdipluspath/nl-gdipluspath-pathgradientbrush">PathGradientBrush</a>. A path gradient brush paints a color gradient in which the color changes from a center point outward to a boundary that is defined by a closed curve or path. The color gradient has one color at the center point and one or multiple colors at the boundary.
     * @type {Integer (Int32)}
     */
    static BrushTypePathGradient => 3

    /**
     * Indicates a brush of type <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusbrush/nl-gdiplusbrush-lineargradientbrush">LinearGradientBrush</a>. A linear gradient brush paints a color gradient in which the color changes evenly from the starting boundary line of the linear gradient brush to the ending boundary line of the linear gradient brush. The boundary lines of a linear gradient brush are two parallel straight lines. The color gradient is perpendicular to the boundary lines of the linear gradient brush, changing gradually across the stroke from the starting boundary line to the ending boundary line. The color gradient has one color at the starting boundary line and another color at the ending boundary line.
     * @type {Integer (Int32)}
     */
    static BrushTypeLinearGradient => 4
}
