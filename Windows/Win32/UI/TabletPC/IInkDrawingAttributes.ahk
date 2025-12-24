#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkExtendedProperties.ahk
#Include .\IInkDrawingAttributes.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkdrawingattributes
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDrawingAttributes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDrawingAttributes
     * @type {Guid}
     */
    static IID => Guid("{bf519b75-0a15-4623-adc9-c00d436a8092}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Color", "put_Color", "get_Width", "put_Width", "get_Height", "put_Height", "get_FitToCurve", "put_FitToCurve", "get_IgnorePressure", "put_IgnorePressure", "get_AntiAliased", "put_AntiAliased", "get_Transparency", "put_Transparency", "get_RasterOperation", "put_RasterOperation", "get_PenTip", "put_PenTip", "get_ExtendedProperties", "Clone"]

    /**
     * @type {Integer} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * @type {Float} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * @type {Float} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    FitToCurve {
        get => this.get_FitToCurve()
        set => this.put_FitToCurve(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IgnorePressure {
        get => this.get_IgnorePressure()
        set => this.put_IgnorePressure(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AntiAliased {
        get => this.get_AntiAliased()
        set => this.put_AntiAliased(value)
    }

    /**
     * @type {Integer} 
     */
    Transparency {
        get => this.get_Transparency()
        set => this.put_Transparency(value)
    }

    /**
     * @type {Integer} 
     */
    RasterOperation {
        get => this.get_RasterOperation()
        set => this.put_RasterOperation(value)
    }

    /**
     * @type {Integer} 
     */
    PenTip {
        get => this.get_PenTip()
        set => this.put_PenTip(value)
    }

    /**
     * @type {IInkExtendedProperties} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * Gets or sets the color of the ink that is drawn with this InkDrawingAttributes object.
     * @remarks
     * 
     * In High Contrast mode, ink always appears with the system color setting (COLOR_WINDOWTEXT), regardless of the setting of the <b>Color</b> property. However, the actual color of the ink is always saved as the set color, or default color (<b>BLACK</b>) if not set. For example, if the <b>Color</b> property is set to <b>RED</b>, a user in High Contrast mode sees the ink in the system color, but a user not in High Contrast mode sees the ink drawn as the set color <b>RED</b>. This functionality allows a user in High Contrast mode to view the ink in the system setting without modifying the actual stroke color.
     * 
     * This means that by default all ink is mapped to one color when in High Contrast mode. To disable this default color-mapping behavior and implement your own, use the ink collector's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_supporthighcontrastink">SupportHighContrastInk</a> property.
     * 
     * To effectively enable High Contrast mode, you must set the ink collector's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_autoredraw">AutoRedraw</a> property to <b>TRUE</b> (which means that ink is redrawn when the window is invalidated). The Tablet PC application programming interface (API) does not support High Contrast mode if you set the <b>AutoRedraw</b> property to <b>FALSE</b>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_color
     */
    get_Color() {
        result := ComCall(7, this, "int*", &CurrentColor := 0, "HRESULT")
        return CurrentColor
    }

    /**
     * Gets or sets the color of the ink that is drawn with this InkDrawingAttributes object.
     * @remarks
     * 
     * In High Contrast mode, ink always appears with the system color setting (COLOR_WINDOWTEXT), regardless of the setting of the <b>Color</b> property. However, the actual color of the ink is always saved as the set color, or default color (<b>BLACK</b>) if not set. For example, if the <b>Color</b> property is set to <b>RED</b>, a user in High Contrast mode sees the ink in the system color, but a user not in High Contrast mode sees the ink drawn as the set color <b>RED</b>. This functionality allows a user in High Contrast mode to view the ink in the system setting without modifying the actual stroke color.
     * 
     * This means that by default all ink is mapped to one color when in High Contrast mode. To disable this default color-mapping behavior and implement your own, use the ink collector's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_supporthighcontrastink">SupportHighContrastInk</a> property.
     * 
     * To effectively enable High Contrast mode, you must set the ink collector's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_autoredraw">AutoRedraw</a> property to <b>TRUE</b> (which means that ink is redrawn when the window is invalidated). The Tablet PC application programming interface (API) does not support High Contrast mode if you set the <b>AutoRedraw</b> property to <b>FALSE</b>.
     * 
     * 
     * @param {Integer} NewColor 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-put_color
     */
    put_Color(NewColor) {
        result := ComCall(8, this, "int", NewColor, "HRESULT")
        return result
    }

    /**
     * Gets or sets the y-axis dimension, or width, of the pen tip when drawing ink.
     * @remarks
     * 
     * If the tablet reports pen pressure (if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure">IgnorePressure</a> property is false), the actual width of the ink varies depending on the amount of pressure applied to the drawing surface. When maximum pressure is applied, the width is 150% of the value of the <c>Width</code> property. When minimum pressure is applied, the width is 50% of the value of the <code>Width</c> property. By default, this property is set to true, so that pressure from the pen is reported. To specify that pressure should not be reported (that the width of ink does not change), set the <b>IgnorePressure</b> property to true.
     * 
     * Precision is limited to one one-thousandth of a HIMETRIC unit (three digits to the right of the decimal point). For example, if you specify a value of 2.0006, the most precise measurement is 2.001.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_width
     */
    get_Width() {
        result := ComCall(9, this, "float*", &CurrentWidth := 0, "HRESULT")
        return CurrentWidth
    }

    /**
     * Gets or sets the y-axis dimension, or width, of the pen tip when drawing ink.
     * @remarks
     * 
     * If the tablet reports pen pressure (if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure">IgnorePressure</a> property is false), the actual width of the ink varies depending on the amount of pressure applied to the drawing surface. When maximum pressure is applied, the width is 150% of the value of the <c>Width</code> property. When minimum pressure is applied, the width is 50% of the value of the <code>Width</c> property. By default, this property is set to true, so that pressure from the pen is reported. To specify that pressure should not be reported (that the width of ink does not change), set the <b>IgnorePressure</b> property to true.
     * 
     * Precision is limited to one one-thousandth of a HIMETRIC unit (three digits to the right of the decimal point). For example, if you specify a value of 2.0006, the most precise measurement is 2.001.
     * 
     * 
     * @param {Float} NewWidth 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-put_width
     */
    put_Width(NewWidth) {
        result := ComCall(10, this, "float", NewWidth, "HRESULT")
        return result
    }

    /**
     * Gets or sets the height of the pen when drawing ink with the InkDrawingAttributes object.
     * @remarks
     * 
     * This property applies only to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">Rectangle</a> pen tip. The value represents the height of the side of the rectangle. If using the <b>Ball</b> pen tip then the height of the pen tip is equal to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> property, and the <b>Height</b> property is ignored.
     * 
     * Precision is limited to 1/1000 (three digits to the right of the decimal point). For example, if you specify a value of 2.0006, the most precise measurement is 2.001.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_height
     */
    get_Height() {
        result := ComCall(11, this, "float*", &CurrentHeight := 0, "HRESULT")
        return CurrentHeight
    }

    /**
     * Gets or sets the height of the pen when drawing ink with the InkDrawingAttributes object.
     * @remarks
     * 
     * This property applies only to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">Rectangle</a> pen tip. The value represents the height of the side of the rectangle. If using the <b>Ball</b> pen tip then the height of the pen tip is equal to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> property, and the <b>Height</b> property is ignored.
     * 
     * Precision is limited to 1/1000 (three digits to the right of the decimal point). For example, if you specify a value of 2.0006, the most precise measurement is 2.001.
     * 
     * 
     * @param {Float} NewHeight 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-put_height
     */
    put_Height(NewHeight) {
        result := ComCall(12, this, "float", NewHeight, "HRESULT")
        return result
    }

    /**
     * Gets or sets the value that specifies whether Bezier smoothing is used to render ink.
     * @remarks
     * 
     * Bezier smoothing renders ink as a series of curves instead of as lines between pen sample points. Rendering ink as a series of curves is useful for smoothing the ink, especially when the person writing the ink has unsteady writing.
     * 
     * If you set this property while collecting a stroke or strokes, the ink does not render as a series of curves until it is redrawn or refreshed.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_fittocurve
     */
    get_FitToCurve() {
        result := ComCall(13, this, "short*", &Flag := 0, "HRESULT")
        return Flag
    }

    /**
     * Gets or sets the value that specifies whether Bezier smoothing is used to render ink.
     * @remarks
     * 
     * Bezier smoothing renders ink as a series of curves instead of as lines between pen sample points. Rendering ink as a series of curves is useful for smoothing the ink, especially when the person writing the ink has unsteady writing.
     * 
     * If you set this property while collecting a stroke or strokes, the ink does not render as a series of curves until it is redrawn or refreshed.
     * 
     * 
     * @param {VARIANT_BOOL} Flag 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-put_fittocurve
     */
    put_FitToCurve(Flag) {
        result := ComCall(14, this, "short", Flag, "HRESULT")
        return result
    }

    /**
     * Gets or sets the value that specifies whether drawn ink automatically gets wider with increased pressure of the pen tip on the tablet surface.
     * @remarks
     * 
     * The greater the pressure on the pen tip, the more ink that is drawn. Set this property to <b>VARIANT_TRUE</b> if you do not want this effect to occur.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure
     */
    get_IgnorePressure() {
        result := ComCall(15, this, "short*", &Flag := 0, "HRESULT")
        return Flag
    }

    /**
     * Gets or sets the value that specifies whether drawn ink automatically gets wider with increased pressure of the pen tip on the tablet surface.
     * @remarks
     * 
     * The greater the pressure on the pen tip, the more ink that is drawn. Set this property to <b>VARIANT_TRUE</b> if you do not want this effect to occur.
     * 
     * 
     * @param {VARIANT_BOOL} Flag 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-put_ignorepressure
     */
    put_IgnorePressure(Flag) {
        result := ComCall(16, this, "short", Flag, "HRESULT")
        return result
    }

    /**
     * Gets or sets the value that indicates whether a stroke is antialiased.
     * @remarks
     * 
     * If a stroke is antialiased, the foreground and background colors along the edge of the ink are blended to increase the visible smoothness.
     * 
     * Antialiasing improves the quality of rendering by making ink appear smoother and sharper, especially on lower resolution displays. However, antialiasing incurs added performance. Use it judiciously.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_antialiased
     */
    get_AntiAliased() {
        result := ComCall(17, this, "short*", &Flag := 0, "HRESULT")
        return Flag
    }

    /**
     * Gets or sets the value that indicates whether a stroke is antialiased.
     * @remarks
     * 
     * If a stroke is antialiased, the foreground and background colors along the edge of the ink are blended to increase the visible smoothness.
     * 
     * Antialiasing improves the quality of rendering by making ink appear smoother and sharper, especially on lower resolution displays. However, antialiasing incurs added performance. Use it judiciously.
     * 
     * 
     * @param {VARIANT_BOOL} Flag 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-put_antialiased
     */
    put_AntiAliased(Flag) {
        result := ComCall(18, this, "short", Flag, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the transparency value of ink.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The transparent rendering effect may be different between dynamic and static rendering. In dynamic rendering the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object is rendered as it is drawn, as it is in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_dynamicrendering">DynamicRendering</a> property, for example. In static rendering, you use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrenderer-draw">Draw</a> method of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrenderer-class">InkRenderer</a> object to render the <b>IInkStrokeDisp</b> object.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_transparency
     */
    get_Transparency() {
        result := ComCall(19, this, "int*", &CurrentTransparency := 0, "HRESULT")
        return CurrentTransparency
    }

    /**
     * Gets or sets a value that indicates the transparency value of ink.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The transparent rendering effect may be different between dynamic and static rendering. In dynamic rendering the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object is rendered as it is drawn, as it is in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_dynamicrendering">DynamicRendering</a> property, for example. In static rendering, you use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrenderer-draw">Draw</a> method of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrenderer-class">InkRenderer</a> object to render the <b>IInkStrokeDisp</b> object.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} NewTransparency 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-put_transparency
     */
    put_Transparency(NewTransparency) {
        result := ComCall(20, this, "int", NewTransparency, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that defines how the colors of the pen and background interact.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrasteroperation">InkRasterOperation</a> enumeration defines values for performing raster operations on drawn ink. For example, if you want to perform subtractive transparency, set the raster value to MaskPen.
     * 
     * For a complete list of available raster operations, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrasteroperation">InkRasterOperation</a> enumeration type.
     * 
     * <div class="alert"><b>Note</b>  Many printers do not support many of the available raster operations. Because of this, the colors displayed may be different than the colors printed. This is directly related to the printer drivers or printer hardware. You may have to experiment to determine which printers can produce the correct output when various raster operations are set on ink.</div>
     * <div> </div>
     * When the <b>RasterOperation</b> property is set to anything other than <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrasteroperation">InkRasterOperation.IRO_CopyPen</a>, all drawing attributes-anti-aliasing, smoothing, transparency, and pressure-are ignored.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_rasteroperation
     */
    get_RasterOperation() {
        result := ComCall(21, this, "int*", &CurrentRasterOperation := 0, "HRESULT")
        return CurrentRasterOperation
    }

    /**
     * Gets or sets a value that defines how the colors of the pen and background interact.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrasteroperation">InkRasterOperation</a> enumeration defines values for performing raster operations on drawn ink. For example, if you want to perform subtractive transparency, set the raster value to MaskPen.
     * 
     * For a complete list of available raster operations, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrasteroperation">InkRasterOperation</a> enumeration type.
     * 
     * <div class="alert"><b>Note</b>  Many printers do not support many of the available raster operations. Because of this, the colors displayed may be different than the colors printed. This is directly related to the printer drivers or printer hardware. You may have to experiment to determine which printers can produce the correct output when various raster operations are set on ink.</div>
     * <div> </div>
     * When the <b>RasterOperation</b> property is set to anything other than <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrasteroperation">InkRasterOperation.IRO_CopyPen</a>, all drawing attributes-anti-aliasing, smoothing, transparency, and pressure-are ignored.
     * 
     * 
     * @param {Integer} NewRasterOperation 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-put_rasteroperation
     */
    put_RasterOperation(NewRasterOperation) {
        result := ComCall(22, this, "int", NewRasterOperation, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates which pen tip to use when drawing ink that is associated with this InkDrawingAttributes object.
     * @remarks
     * 
     * For a complete list of pen tips available to use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip</a> enumeration.
     * 
     * When this property is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip.IPT_Ball</a>, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> property is ignored.
     * 
     * To create a square pen tip, set the <b>PenTip</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip.IPT_Rectangle</a>. Then set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> property equal to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_pentip
     */
    get_PenTip() {
        result := ComCall(23, this, "int*", &CurrentPenTip := 0, "HRESULT")
        return CurrentPenTip
    }

    /**
     * Gets or sets a value that indicates which pen tip to use when drawing ink that is associated with this InkDrawingAttributes object.
     * @remarks
     * 
     * For a complete list of pen tips available to use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip</a> enumeration.
     * 
     * When this property is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip.IPT_Ball</a>, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> property is ignored.
     * 
     * To create a square pen tip, set the <b>PenTip</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip.IPT_Rectangle</a>. Then set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> property equal to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> property.
     * 
     * 
     * @param {Integer} NewPenTip 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-put_pentip
     */
    put_PenTip(NewPenTip) {
        result := ComCall(24, this, "int", NewPenTip, "HRESULT")
        return result
    }

    /**
     * Gets the collection of application-defined data that are stored in an object.
     * @remarks
     * 
     * Applications can use the ExtendedProperties property to access the custom data that is stored on an object. This custom data is automatically serialized with the object.
     * 
     * 
     * @returns {IInkExtendedProperties} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-get_extendedproperties
     */
    get_ExtendedProperties() {
        result := ComCall(25, this, "ptr*", &Properties := 0, "HRESULT")
        return IInkExtendedProperties(Properties)
    }

    /**
     * Creates a duplicate InkDrawingAttributes object.
     * @returns {IInkDrawingAttributes} When this method returns, contains a pointer to the newly created <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdrawingattributes-class">InkDrawingAttributes</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdrawingattributes-clone
     */
    Clone() {
        result := ComCall(26, this, "ptr*", &DrawingAttributes := 0, "HRESULT")
        return IInkDrawingAttributes(DrawingAttributes)
    }
}
