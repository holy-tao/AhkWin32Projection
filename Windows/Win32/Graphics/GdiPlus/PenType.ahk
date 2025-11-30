#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PenType enumeration indicates the type of pattern, texture, or gradient that a pen draws.
 * @remarks
 * 
 * A pen's type is determined when the pen is constructed. For example, if you pass a 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusbrush/nl-gdiplusbrush-hatchbrush">HatchBrush</a> object to a 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdipluspen/nl-gdipluspen-pen">Pen</a> constructor, then the pen that is constructed has a pen type of <b><b>PenTypeHatchFill</b></b>. If you pass a 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdipluscolor/nl-gdipluscolor-color">Color</a> object or a 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusbrush/nl-gdiplusbrush-solidbrush">SolidBrush</a> object to a 
 * 				<b>Pen</b> constructor, then the pen that is constructed has a pen type of <b><b>PenTypeSolidColor</b></b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-pentype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PenType extends Win32Enum{

    /**
     * Indicates that the pen draws with a solid color.
     * @type {Integer (Int32)}
     */
    static PenTypeSolidColor => 0

    /**
     * Indicates that the pen draws with a hatch pattern that is specified by a 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusbrush/nl-gdiplusbrush-hatchbrush">HatchBrush</a> object.
     * @type {Integer (Int32)}
     */
    static PenTypeHatchFill => 1

    /**
     * Indicates that the pen draws with a texture that is specified by a 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusbrush/nl-gdiplusbrush-texturebrush">TextureBrush</a> object.
     * @type {Integer (Int32)}
     */
    static PenTypeTextureFill => 2

    /**
     * Indicates that the pen draws with a color gradient that is specified by a 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdipluspath/nl-gdipluspath-pathgradientbrush">PathGradientBrush</a> object.
     * @type {Integer (Int32)}
     */
    static PenTypePathGradient => 3

    /**
     * Indicates that the pen draws with a color gradient that is specified by a 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusbrush/nl-gdiplusbrush-lineargradientbrush">LinearGradientBrush</a> object.
     * @type {Integer (Int32)}
     */
    static PenTypeLinearGradient => 4

    /**
     * Indicates that the pen type is unknown.
     * @type {Integer (Int32)}
     */
    static PenTypeUnknown => -1
}
