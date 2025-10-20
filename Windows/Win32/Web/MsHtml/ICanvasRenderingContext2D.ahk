#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ICanvasRenderingContext2D extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICanvasRenderingContext2D
     * @type {Guid}
     */
    static IID => Guid("{305106ff-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for CanvasRenderingContext2D
     * @type {Guid}
     */
    static CLSID => Guid("{30510700-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_canvas", "restore", "save", "rotate", "scale", "setTransform", "transform", "translate", "put_globalAlpha", "get_globalAlpha", "put_globalCompositeOperation", "get_globalCompositeOperation", "put_fillStyle", "get_fillStyle", "put_strokeStyle", "get_strokeStyle", "createLinearGradient", "createRadialGradient", "createPattern", "put_lineCap", "get_lineCap", "put_lineJoin", "get_lineJoin", "put_lineWidth", "get_lineWidth", "put_miterLimit", "get_miterLimit", "put_shadowBlur", "get_shadowBlur", "put_shadowColor", "get_shadowColor", "put_shadowOffsetX", "get_shadowOffsetX", "put_shadowOffsetY", "get_shadowOffsetY", "clearRect", "fillRect", "strokeRect", "arc", "arcTo", "beginPath", "bezierCurveTo", "clip", "closePath", "fill", "lineTo", "moveTo", "quadraticCurveTo", "rect", "stroke", "isPointInPath", "put_font", "get_font", "put_textAlign", "get_textAlign", "put_textBaseline", "get_textBaseline", "fillText", "measureText", "strokeText", "drawImage", "createImageData", "getImageData", "putImageData"]

    /**
     * 
     * @param {Pointer<IHTMLCanvasElement>} p 
     * @returns {HRESULT} 
     */
    get_canvas(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    restore() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    save() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {HRESULT} 
     */
    rotate(angle) {
        result := ComCall(10, this, "float", angle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    scale(x, y) {
        result := ComCall(11, this, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} m11 
     * @param {Float} m12 
     * @param {Float} m21 
     * @param {Float} m22 
     * @param {Float} dx 
     * @param {Float} dy 
     * @returns {HRESULT} 
     */
    setTransform(m11, m12, m21, m22, dx, dy) {
        result := ComCall(12, this, "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} m11 
     * @param {Float} m12 
     * @param {Float} m21 
     * @param {Float} m22 
     * @param {Float} dx 
     * @param {Float} dy 
     * @returns {HRESULT} 
     */
    transform(m11, m12, m21, m22, dx, dy) {
        result := ComCall(13, this, "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    translate(x, y) {
        result := ComCall(14, this, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_globalAlpha(v) {
        result := ComCall(15, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_globalAlpha(p) {
        result := ComCall(16, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_globalCompositeOperation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_globalCompositeOperation(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fillStyle(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_fillStyle(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeStyle(v) {
        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_strokeStyle(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x0 
     * @param {Float} y0 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Pointer<ICanvasGradient>} ppCanvasGradient 
     * @returns {HRESULT} 
     */
    createLinearGradient(x0, y0, x1, y1, ppCanvasGradient) {
        result := ComCall(23, this, "float", x0, "float", y0, "float", x1, "float", y1, "ptr*", ppCanvasGradient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x0 
     * @param {Float} y0 
     * @param {Float} r0 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} r1 
     * @param {Pointer<ICanvasGradient>} ppCanvasGradient 
     * @returns {HRESULT} 
     */
    createRadialGradient(x0, y0, r0, x1, y1, r1, ppCanvasGradient) {
        result := ComCall(24, this, "float", x0, "float", y0, "float", r0, "float", x1, "float", y1, "float", r1, "ptr*", ppCanvasGradient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} image 
     * @param {VARIANT} repetition 
     * @param {Pointer<ICanvasPattern>} ppCanvasPattern 
     * @returns {HRESULT} 
     */
    createPattern(image, repetition, ppCanvasPattern) {
        result := ComCall(25, this, "ptr", image, "ptr", repetition, "ptr*", ppCanvasPattern, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineCap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(26, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_lineCap(p) {
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineJoin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(28, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_lineJoin(p) {
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_lineWidth(v) {
        result := ComCall(30, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_lineWidth(p) {
        result := ComCall(31, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_miterLimit(v) {
        result := ComCall(32, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_miterLimit(p) {
        result := ComCall(33, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_shadowBlur(v) {
        result := ComCall(34, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_shadowBlur(p) {
        result := ComCall(35, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_shadowColor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(36, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_shadowColor(p) {
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_shadowOffsetX(v) {
        result := ComCall(38, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_shadowOffsetX(p) {
        result := ComCall(39, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_shadowOffsetY(v) {
        result := ComCall(40, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_shadowOffsetY(p) {
        result := ComCall(41, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} w 
     * @param {Float} h 
     * @returns {HRESULT} 
     */
    clearRect(x, y, w, h) {
        result := ComCall(42, this, "float", x, "float", y, "float", w, "float", h, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} w 
     * @param {Float} h 
     * @returns {HRESULT} 
     */
    fillRect(x, y, w, h) {
        result := ComCall(43, this, "float", x, "float", y, "float", w, "float", h, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} w 
     * @param {Float} h 
     * @returns {HRESULT} 
     */
    strokeRect(x, y, w, h) {
        result := ComCall(44, this, "float", x, "float", y, "float", w, "float", h, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} radius 
     * @param {Float} startAngle 
     * @param {Float} endAngle 
     * @param {BOOL} anticlockwise 
     * @returns {HRESULT} 
     */
    arc(x, y, radius, startAngle, endAngle, anticlockwise) {
        result := ComCall(45, this, "float", x, "float", y, "float", radius, "float", startAngle, "float", endAngle, "int", anticlockwise, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    arcTo(x1, y1, x2, y2, radius) {
        result := ComCall(46, this, "float", x1, "float", y1, "float", x2, "float", y2, "float", radius, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    beginPath() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} cp1x 
     * @param {Float} cp1y 
     * @param {Float} cp2x 
     * @param {Float} cp2y 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y) {
        result := ComCall(48, this, "float", cp1x, "float", cp1y, "float", cp2x, "float", cp2y, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clip() {
        result := ComCall(49, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    closePath() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    fill() {
        result := ComCall(51, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    lineTo(x, y) {
        result := ComCall(52, this, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    moveTo(x, y) {
        result := ComCall(53, this, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} cpx 
     * @param {Float} cpy 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    quadraticCurveTo(cpx, cpy, x, y) {
        result := ComCall(54, this, "float", cpx, "float", cpy, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} w 
     * @param {Float} h 
     * @returns {HRESULT} 
     */
    rect(x, y, w, h) {
        result := ComCall(55, this, "float", x, "float", y, "float", w, "float", h, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stroke() {
        result := ComCall(56, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<VARIANT_BOOL>} pResult 
     * @returns {HRESULT} 
     */
    isPointInPath(x, y, pResult) {
        result := ComCall(57, this, "float", x, "float", y, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_font(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(58, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_font(p) {
        result := ComCall(59, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(60, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textAlign(p) {
        result := ComCall(61, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textBaseline(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(62, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textBaseline(p) {
        result := ComCall(63, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @param {Float} x 
     * @param {Float} y 
     * @param {VARIANT} maxWidth 
     * @returns {HRESULT} 
     */
    fillText(text, x, y, maxWidth) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(64, this, "ptr", text, "float", x, "float", y, "ptr", maxWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @param {Pointer<ICanvasTextMetrics>} ppCanvasTextMetrics 
     * @returns {HRESULT} 
     */
    measureText(text, ppCanvasTextMetrics) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(65, this, "ptr", text, "ptr*", ppCanvasTextMetrics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @param {Float} x 
     * @param {Float} y 
     * @param {VARIANT} maxWidth 
     * @returns {HRESULT} 
     */
    strokeText(text, x, y, maxWidth) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(66, this, "ptr", text, "float", x, "float", y, "ptr", maxWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pSrc 
     * @param {VARIANT} a1 
     * @param {VARIANT} a2 
     * @param {VARIANT} a3 
     * @param {VARIANT} a4 
     * @param {VARIANT} a5 
     * @param {VARIANT} a6 
     * @param {VARIANT} a7 
     * @param {VARIANT} a8 
     * @returns {HRESULT} 
     */
    drawImage(pSrc, a1, a2, a3, a4, a5, a6, a7, a8) {
        result := ComCall(67, this, "ptr", pSrc, "ptr", a1, "ptr", a2, "ptr", a3, "ptr", a4, "ptr", a5, "ptr", a6, "ptr", a7, "ptr", a8, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} a1 
     * @param {VARIANT} a2 
     * @param {Pointer<ICanvasImageData>} ppCanvasImageData 
     * @returns {HRESULT} 
     */
    createImageData(a1, a2, ppCanvasImageData) {
        result := ComCall(68, this, "ptr", a1, "ptr", a2, "ptr*", ppCanvasImageData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} sx 
     * @param {Float} sy 
     * @param {Float} sw 
     * @param {Float} sh 
     * @param {Pointer<ICanvasImageData>} ppCanvasImageData 
     * @returns {HRESULT} 
     */
    getImageData(sx, sy, sw, sh, ppCanvasImageData) {
        result := ComCall(69, this, "float", sx, "float", sy, "float", sw, "float", sh, "ptr*", ppCanvasImageData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICanvasImageData} imagedata 
     * @param {Float} dx 
     * @param {Float} dy 
     * @param {VARIANT} dirtyX 
     * @param {VARIANT} dirtyY 
     * @param {VARIANT} dirtyWidth 
     * @param {VARIANT} dirtyHeight 
     * @returns {HRESULT} 
     */
    putImageData(imagedata, dx, dy, dirtyX, dirtyY, dirtyWidth, dirtyHeight) {
        result := ComCall(70, this, "ptr", imagedata, "float", dx, "float", dy, "ptr", dirtyX, "ptr", dirtyY, "ptr", dirtyWidth, "ptr", dirtyHeight, "HRESULT")
        return result
    }
}
