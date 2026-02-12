#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Color.ahk
#Include ..\..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * . (IInkDrawingAttributes)
 * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nn-msinkaut-iinkdrawingattributes
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkDrawingAttributes extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDrawingAttributes
     * @type {Guid}
     */
    static IID => Guid("{97a2176c-6774-48ad-84f0-48f5a9be74f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Color", "put_Color", "get_PenTip", "put_PenTip", "get_Size", "put_Size", "get_IgnorePressure", "put_IgnorePressure", "get_FitToCurve", "put_FitToCurve"]

    /**
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * @type {Integer} 
     */
    PenTip {
        get => this.get_PenTip()
        set => this.put_PenTip(value)
    }

    /**
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * @type {Boolean} 
     */
    IgnorePressure {
        get => this.get_IgnorePressure()
        set => this.put_IgnorePressure(value)
    }

    /**
     * @type {Boolean} 
     */
    FitToCurve {
        get => this.get_FitToCurve()
        set => this.put_FitToCurve(value)
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
        value := Color()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        value := SIZE()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets the value that specifies whether drawn ink automatically gets wider with increased pressure of the pen tip on the tablet surface. (Get)
     * @remarks
     * The greater the pressure on the pen tip, the more ink that is drawn. Set this property to <b>VARIANT_TRUE</b> if you do not want this effect to occur.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure
     */
    get_IgnorePressure() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
