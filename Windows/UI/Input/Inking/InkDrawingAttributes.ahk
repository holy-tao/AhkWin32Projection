#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkDrawingAttributes2.ahk
#Include .\IInkDrawingAttributes3.ahk
#Include .\IInkDrawingAttributes4.ahk
#Include .\IInkDrawingAttributes5.ahk
#Include .\IInkDrawingAttributesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides properties associated with the drawing of an [InkStroke](inkstroke.md).
 * @remarks
 * InkDrawingAttributes can be set globally through the [SetDefaultDrawingAttributes](inkmanager_setdefaultdrawingattributes_1436218448.md) method of an [InkManager](inkmanager.md) object or an [InkStrokeBuilder](inkstrokebuilder.md) object. They can also be set on an individual [InkStroke](inkstroke.md) object through the [DrawingAttributes](inkstroke_drawingattributes.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkDrawingAttributes extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkDrawingAttributes

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkDrawingAttributes.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an [InkDrawingAttributes](inkdrawingattributes.md) object for rendering an ink stroke with pencil characteristics.
     * @remarks
     * By default, a pencil draws a soft-edged, textured, and semi-transparent stroke (useful for layered shading effects) with a Circle PenTip. The stroke color (darkness) is dependent on the pen pressure detected.
     * @returns {InkDrawingAttributes} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.createforpencil
     */
    static CreateForPencil() {
        if (!InkDrawingAttributes.HasProp("__IInkDrawingAttributesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkDrawingAttributes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkDrawingAttributesStatics.IID)
            InkDrawingAttributes.__IInkDrawingAttributesStatics := IInkDrawingAttributesStatics(factoryPtr)
        }

        return InkDrawingAttributes.__IInkDrawingAttributesStatics.CreateForPencil()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates the color of an [InkStroke](inkstroke.md).
     * @remarks
     * The value of Color is an ARGB value. However, the value of the transparency component (A, or alpha channel) is ignored and the [InkStroke](inkstroke.md) is rendered at full opacity.
     * 
     * The value of the transparency component is not discarded. It is stored with all other stroke data in the Ink Serialized Format (ISF) file when the [InkStroke](inkstroke.md) is saved.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets or sets a value that indicates the shape of the pen tip when you draw an [InkStroke](inkstroke.md).
     * @remarks
     * Support various calligraphic effects using the [PenTipShape](pentipshape.md) property with PenTip.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.pentip
     * @type {Integer} 
     */
    PenTip {
        get => this.get_PenTip()
        set => this.put_PenTip(value)
    }

    /**
     * Gets or sets a value that indicates the dimensions of the pen tip ([PenTip](inkdrawingattributes_pentip.md)) used to draw an [InkStroke](inkstroke.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.size
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets or sets a value that indicates whether the pressure of the contact on the digitizer surface is ignored when you draw an [InkStroke](inkstroke.md).
     * @remarks
     * If IgnorePressure is set to false, the user can modify the thickness of a stroke by adjusting the amount of pressure applied to the digitizer surface while writing. 
     * 
     * 
     * The following actions may be affected by the IgnorePressure setting.<table>
     *    <tr><th>IgnorePressure</th><th>True</th><th>False</th></tr>
     *    <tr><th>Copy</th><td>No effect. Pressure data, if present, is written to the Ink Serialized Format (ISF) stream.</td><td>No effect. Pressure data, if present, is written to the Ink Serialized Format (ISF) stream.</td></tr>
     *    <tr><th>Paste</th><td>Depending on the implementation, pressure data from Ink Serialized Format (ISF) stream may be ignored during rendering.</td><td>Depending on the implementation, pressure data from Ink Serialized Format (ISF) stream may be applied during rendering.</td></tr>
     *    <tr><th>Save</th><td>No effect. Pressure data, if present, is written to the Ink Serialized Format (ISF) stream.</td><td>No effect. Pressure data, if present, is written to the Ink Serialized Format (ISF) stream</td></tr>
     *    <tr><th>Load</th><td>Depending on the implementation, pressure data from Ink Serialized Format (ISF) stream may be ignored during rendering.</td><td>Depending on the implementation, pressure data from Ink Serialized Format (ISF) stream may be applied during rendering.</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.ignorepressure
     * @type {Boolean} 
     */
    IgnorePressure {
        get => this.get_IgnorePressure()
        set => this.put_IgnorePressure(value)
    }

    /**
     * Gets or sets a value that indicates whether a Bezier curve or a collection of straight line segments is used to draw an [InkStroke](inkstroke.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.fittocurve
     * @type {Boolean} 
     */
    FitToCurve {
        get => this.get_FitToCurve()
        set => this.put_FitToCurve(value)
    }

    /**
     * Gets or sets an affine transformation matrix applied to the [PenTipShape](pentipshape.md) used for an [InkStroke](inkstroke.md).
     * @remarks
     * The M31 and M32 entries of the matrix must be zero.
     * 
     * This property enables various calligraphic effects, depending on [PenTip](inkdrawingattributes_pentip.md) and [PenTipShape](pentipshape.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.pentiptransform
     * @type {Matrix3x2} 
     */
    PenTipTransform {
        get => this.get_PenTipTransform()
        set => this.put_PenTipTransform(value)
    }

    /**
     * Gets or sets a value that indicates whether the [InkStroke](inkstroke.md) is rendered as a highlighter overlay. The stroke is typically set to a bright color, such as yellow.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.drawashighlighter
     * @type {Boolean} 
     */
    DrawAsHighlighter {
        get => this.get_DrawAsHighlighter()
        set => this.put_DrawAsHighlighter(value)
    }

    /**
     * Gets the [InkDrawingAttributes](inkdrawingattributes.md) that describe the characteristics of a specific type of [InkStroke](inkstroke.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets an instance of an [InkDrawingAttributesPencilProperties](inkdrawingattributespencilproperties.md) object for setting properties characteristic to a pencil stroke.
     * @remarks
     * By default, a pencil draws a soft-edged, textured, and semi-transparent stroke (useful for layered shading effects) with a Circle PenTip. The stroke color (darkness) is dependent on the pen pressure detected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.pencilproperties
     * @type {InkDrawingAttributesPencilProperties} 
     */
    PencilProperties {
        get => this.get_PencilProperties()
    }

    /**
     * Gets or sets a value that indicates whether the tilt ([tiltx](inkpoint_tiltx.md), [tilty](inkpoint_tilty.md)) of the contact on the digitizer surface is ignored when you draw an [InkStroke](inkstroke.md).
     * @remarks
     * This property is typically set for pencil strokes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.ignoretilt
     * @type {Boolean} 
     */
    IgnoreTilt {
        get => this.get_IgnoreTilt()
        set => this.put_IgnoreTilt(value)
    }

    /**
     * Gets an instance of a [ModelerAttributes](inkmodelerattributes.md) object for accessing modeler properties of an ink stroke.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributes.modelerattributes
     * @type {InkModelerAttributes} 
     */
    ModelerAttributes {
        get => this.get_ModelerAttributes()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [InkDrawingAttributes](inkdrawingattributes.md) object that is used to specify [InkStroke](inkstroke.md) attributes.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkDrawingAttributes")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Gets or sets the color of the ink that is drawn with this InkDrawingAttributes object. (Get)
     * @remarks
     * In High Contrast mode, ink always appears with the system color setting (COLOR_WINDOWTEXT), regardless of the setting of the <b>Color</b> property. However, the actual color of the ink is always saved as the set color, or default color (<b>BLACK</b>) if not set. For example, if the <b>Color</b> property is set to <b>RED</b>, a user in High Contrast mode sees the ink in the system color, but a user not in High Contrast mode sees the ink drawn as the set color <b>RED</b>. This functionality allows a user in High Contrast mode to view the ink in the system setting without modifying the actual stroke color.
     * 
     * This means that by default all ink is mapped to one color when in High Contrast mode. To disable this default color-mapping behavior and implement your own, use the ink collector's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_supporthighcontrastink">SupportHighContrastInk</a> property.
     * 
     * To effectively enable High Contrast mode, you must set the ink collector's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_autoredraw">AutoRedraw</a> property to <b>TRUE</b> (which means that ink is redrawn when the window is invalidated). The Tablet PC application programming interface (API) does not support High Contrast mode if you set the <b>AutoRedraw</b> property to <b>FALSE</b>.
     * @returns {Color} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkdrawingattributes-get_color
     */
    get_Color() {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.get_Color()
    }

    /**
     * Gets or sets the color of the ink that is drawn with this InkDrawingAttributes object. (Put)
     * @remarks
     * In High Contrast mode, ink always appears with the system color setting (COLOR_WINDOWTEXT), regardless of the setting of the <b>Color</b> property. However, the actual color of the ink is always saved as the set color, or default color (<b>BLACK</b>) if not set. For example, if the <b>Color</b> property is set to <b>RED</b>, a user in High Contrast mode sees the ink in the system color, but a user not in High Contrast mode sees the ink drawn as the set color <b>RED</b>. This functionality allows a user in High Contrast mode to view the ink in the system setting without modifying the actual stroke color.
     * 
     * This means that by default all ink is mapped to one color when in High Contrast mode. To disable this default color-mapping behavior and implement your own, use the ink collector's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_supporthighcontrastink">SupportHighContrastInk</a> property.
     * 
     * To effectively enable High Contrast mode, you must set the ink collector's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_autoredraw">AutoRedraw</a> property to <b>TRUE</b> (which means that ink is redrawn when the window is invalidated). The Tablet PC application programming interface (API) does not support High Contrast mode if you set the <b>AutoRedraw</b> property to <b>FALSE</b>.
     * @param {Color} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkdrawingattributes-put_color
     */
    put_Color(value) {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.put_Color(value)
    }

    /**
     * Gets or sets a value that indicates which pen tip to use when drawing ink that is associated with this InkDrawingAttributes object. (Get)
     * @remarks
     * For a complete list of pen tips available to use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip</a> enumeration.
     * 
     * When this property is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip.IPT_Ball</a>, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> property is ignored.
     * 
     * To create a square pen tip, set the <b>PenTip</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip.IPT_Rectangle</a>. Then set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> property equal to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkdrawingattributes-get_pentip
     */
    get_PenTip() {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.get_PenTip()
    }

    /**
     * Gets or sets a value that indicates which pen tip to use when drawing ink that is associated with this InkDrawingAttributes object. (Put)
     * @remarks
     * For a complete list of pen tips available to use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip</a> enumeration.
     * 
     * When this property is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip.IPT_Ball</a>, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> property is ignored.
     * 
     * To create a square pen tip, set the <b>PenTip</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpentip">InkPenTip.IPT_Rectangle</a>. Then set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> property equal to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> property.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkdrawingattributes-put_pentip
     */
    put_PenTip(value) {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.put_PenTip(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.get_Size()
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.put_Size(value)
    }

    /**
     * Gets or sets the value that specifies whether drawn ink automatically gets wider with increased pressure of the pen tip on the tablet surface. (Get)
     * @remarks
     * The greater the pressure on the pen tip, the more ink that is drawn. Set this property to <b>VARIANT_TRUE</b> if you do not want this effect to occur.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure
     */
    get_IgnorePressure() {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.get_IgnorePressure()
    }

    /**
     * Gets or sets the value that specifies whether drawn ink automatically gets wider with increased pressure of the pen tip on the tablet surface. (Put)
     * @remarks
     * The greater the pressure on the pen tip, the more ink that is drawn. Set this property to <b>VARIANT_TRUE</b> if you do not want this effect to occur.
     * @param {Boolean} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkdrawingattributes-put_ignorepressure
     */
    put_IgnorePressure(value) {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.put_IgnorePressure(value)
    }

    /**
     * Gets or sets the value that specifies whether Bezier smoothing is used to render ink. (Get)
     * @remarks
     * Bezier smoothing renders ink as a series of curves instead of as lines between pen sample points. Rendering ink as a series of curves is useful for smoothing the ink, especially when the person writing the ink has unsteady writing.
     * 
     * If you set this property while collecting a stroke or strokes, the ink does not render as a series of curves until it is redrawn or refreshed.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkdrawingattributes-get_fittocurve
     */
    get_FitToCurve() {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.get_FitToCurve()
    }

    /**
     * Gets or sets the value that specifies whether Bezier smoothing is used to render ink. (Put)
     * @remarks
     * Bezier smoothing renders ink as a series of curves instead of as lines between pen sample points. Rendering ink as a series of curves is useful for smoothing the ink, especially when the person writing the ink has unsteady writing.
     * 
     * If you set this property while collecting a stroke or strokes, the ink does not render as a series of curves until it is redrawn or refreshed.
     * @param {Boolean} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkdrawingattributes-put_fittocurve
     */
    put_FitToCurve(value) {
        if (!this.HasProp("__IInkDrawingAttributes")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes := IInkDrawingAttributes(outPtr)
        }

        return this.__IInkDrawingAttributes.put_FitToCurve(value)
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_PenTipTransform() {
        if (!this.HasProp("__IInkDrawingAttributes2")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes2 := IInkDrawingAttributes2(outPtr)
        }

        return this.__IInkDrawingAttributes2.get_PenTipTransform()
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_PenTipTransform(value) {
        if (!this.HasProp("__IInkDrawingAttributes2")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes2 := IInkDrawingAttributes2(outPtr)
        }

        return this.__IInkDrawingAttributes2.put_PenTipTransform(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DrawAsHighlighter() {
        if (!this.HasProp("__IInkDrawingAttributes2")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes2 := IInkDrawingAttributes2(outPtr)
        }

        return this.__IInkDrawingAttributes2.get_DrawAsHighlighter()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DrawAsHighlighter(value) {
        if (!this.HasProp("__IInkDrawingAttributes2")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes2 := IInkDrawingAttributes2(outPtr)
        }

        return this.__IInkDrawingAttributes2.put_DrawAsHighlighter(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IInkDrawingAttributes3")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes3 := IInkDrawingAttributes3(outPtr)
        }

        return this.__IInkDrawingAttributes3.get_Kind()
    }

    /**
     * 
     * @returns {InkDrawingAttributesPencilProperties} 
     */
    get_PencilProperties() {
        if (!this.HasProp("__IInkDrawingAttributes3")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes3 := IInkDrawingAttributes3(outPtr)
        }

        return this.__IInkDrawingAttributes3.get_PencilProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IgnoreTilt() {
        if (!this.HasProp("__IInkDrawingAttributes4")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes4 := IInkDrawingAttributes4(outPtr)
        }

        return this.__IInkDrawingAttributes4.get_IgnoreTilt()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IgnoreTilt(value) {
        if (!this.HasProp("__IInkDrawingAttributes4")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes4 := IInkDrawingAttributes4(outPtr)
        }

        return this.__IInkDrawingAttributes4.put_IgnoreTilt(value)
    }

    /**
     * 
     * @returns {InkModelerAttributes} 
     */
    get_ModelerAttributes() {
        if (!this.HasProp("__IInkDrawingAttributes5")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributes5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributes5 := IInkDrawingAttributes5(outPtr)
        }

        return this.__IInkDrawingAttributes5.get_ModelerAttributes()
    }

;@endregion Instance Methods
}
