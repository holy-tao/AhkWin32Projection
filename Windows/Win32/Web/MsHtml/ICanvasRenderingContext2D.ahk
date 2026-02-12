#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLCanvasElement.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ICanvasGradient.ahk
#Include .\ICanvasPattern.ahk
#Include .\ICanvasTextMetrics.ahk
#Include .\ICanvasImageData.ahk
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
     * @type {IHTMLCanvasElement} 
     */
    canvas {
        get => this.get_canvas()
    }

    /**
     * @type {Float} 
     */
    globalAlpha {
        get => this.get_globalAlpha()
        set => this.put_globalAlpha(value)
    }

    /**
     * @type {BSTR} 
     */
    globalCompositeOperation {
        get => this.get_globalCompositeOperation()
        set => this.put_globalCompositeOperation(value)
    }

    /**
     * @type {VARIANT} 
     */
    fillStyle {
        get => this.get_fillStyle()
        set => this.put_fillStyle(value)
    }

    /**
     * @type {VARIANT} 
     */
    strokeStyle {
        get => this.get_strokeStyle()
        set => this.put_strokeStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    lineCap {
        get => this.get_lineCap()
        set => this.put_lineCap(value)
    }

    /**
     * @type {BSTR} 
     */
    lineJoin {
        get => this.get_lineJoin()
        set => this.put_lineJoin(value)
    }

    /**
     * @type {Float} 
     */
    lineWidth {
        get => this.get_lineWidth()
        set => this.put_lineWidth(value)
    }

    /**
     * @type {Float} 
     */
    miterLimit {
        get => this.get_miterLimit()
        set => this.put_miterLimit(value)
    }

    /**
     * @type {Float} 
     */
    shadowBlur {
        get => this.get_shadowBlur()
        set => this.put_shadowBlur(value)
    }

    /**
     * @type {BSTR} 
     */
    shadowColor {
        get => this.get_shadowColor()
        set => this.put_shadowColor(value)
    }

    /**
     * @type {Float} 
     */
    shadowOffsetX {
        get => this.get_shadowOffsetX()
        set => this.put_shadowOffsetX(value)
    }

    /**
     * @type {Float} 
     */
    shadowOffsetY {
        get => this.get_shadowOffsetY()
        set => this.put_shadowOffsetY(value)
    }

    /**
     * @type {BSTR} 
     */
    font {
        get => this.get_font()
        set => this.put_font(value)
    }

    /**
     * @type {BSTR} 
     */
    textAlign {
        get => this.get_textAlign()
        set => this.put_textAlign(value)
    }

    /**
     * @type {BSTR} 
     */
    textBaseline {
        get => this.get_textBaseline()
        set => this.put_textBaseline(value)
    }

    /**
     * 
     * @returns {IHTMLCanvasElement} 
     */
    get_canvas() {
        result := ComCall(7, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLCanvasElement(p)
    }

    /**
     * The restore command copies a still image from a file to the frame buffer. This is the reverse of the capture command. Digital-video devices recognize this command.
     * @remarks
     * Devices can recognize a variety of image formats; a Windows device-independent bitmap is always recognized.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszRestore"></span><span id="lpszrestore"></span><span id="LPSZRESTORE"></span>*lpszRestore*
     * 
     * One or more of the following flags.
     * 
     * 
     * 
     * | Value           | Meaning                                                                                                                                                                                                                                                                                                                         |
     * |-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | at *rectangle*  | Specifies a rectangle relative to the frame buffer origin. The *rectangle* is specified as *X1 Y1 X2 Y2*. The coordinates *X1 Y1* specify the upper left corner and the coordinates *X2 Y2* specify the width and height.If this flag is not used, the image is copied to the upper left corner of the frame buffer.<br/> |
     * | from *filename* | Specifies the image filename to recall. This flag is required.                                                                                                                                                                                                                                                                  |
     * 
     * 
     * 
     *  
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", "test", or a combination of these. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/restore
     */
    restore() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The save command saves an MCI file. Video-overlay and waveform-audio devices recognize this command. Although digital-video devices and MIDI sequencers also recognize this command, the MCIAVI and MCISEQ drivers do not support it.
     * @remarks
     * The *filename* variable is required if the device was opened using the "new" device identifier.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFilename"></span><span id="lpszfilename"></span><span id="LPSZFILENAME"></span>*lpszFilename*
     * 
     * Flag specifying the name of the file being saved and, optionally, additional flags modifying the save operation. The following table lists device types that recognize the **save** command and the flags used by each type.
     * 
     * 
     * 
     * | Value        | Meaning              | Meaning               |
     * |--------------|----------------------|-----------------------|
     * | digitalvideo | abort at *rectangle* | *filename*keepreserve |
     * | overlay      | at *rectangle*       | *filename*            |
     * | sequencer    | *filename*           |                       |
     * | waveaudio    | *filename*           |                       |
     * 
     * 
     * 
     *  
     * 
     * The following table lists the flags that can be specified in the **lpszFilename** parameter and their meanings.
     * 
     * 
     * 
     * | Value          | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
     * |----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | abort          | Stops a **save** operation in progress. If used, this must be the only item present.                                                                                                                                                                                                                                                                                                                                                                                                                 |
     * | at *rectangle* | Specifies a rectangle relative to the frame buffer origin. The *rectangle* is specified as *X1 Y1 X2 Y2*. The coordinates *X1 Y1* specify the upper left corner and the coordinates *X2 Y2* specify the width and height.For digital-video devices, the [capture](capture.md) command is used to capture the contents of the frame buffer.<br/>                                                                                                                                               |
     * | *filename*     | Specifies the filename to assign to the data file. If a path is not specified, the file will be placed on the disk and in the directory previously specified on the explicit or implicit [reserve](reserve.md) command. If **reserve** has not been issued, the default drive and directory are those associated with the application's task. If a path is specified, the device might require it to be on the disk drive specified by the explicit or implicit **reserve**. This flag is required. |
     * | keepreserve    | Specifies that unused disk space left over from the original **reserve** command is not deallocated.                                                                                                                                                                                                                                                                                                                                                                                                 |
     * 
     * 
     * 
     *  
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/save
     */
    save() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {HRESULT} 
     */
    rotate(angle) {
        result := ComCall(10, this, "float", angle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    scale(x, y) {
        result := ComCall(11, this, "float", x, "float", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(12, this, "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(13, this, "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    translate(x, y) {
        result := ComCall(14, this, "float", x, "float", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_globalAlpha(v) {
        result := ComCall(15, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_globalAlpha() {
        result := ComCall(16, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_globalCompositeOperation(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(17, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_globalCompositeOperation() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fillStyle(v) {
        result := ComCall(19, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fillStyle() {
        p := VARIANT()
        result := ComCall(20, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeStyle(v) {
        result := ComCall(21, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_strokeStyle() {
        p := VARIANT()
        result := ComCall(22, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} x0 
     * @param {Float} y0 
     * @param {Float} x1 
     * @param {Float} y1 
     * @returns {ICanvasGradient} 
     */
    createLinearGradient(x0, y0, x1, y1) {
        result := ComCall(23, this, "float", x0, "float", y0, "float", x1, "float", y1, "ptr*", &ppCanvasGradient := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICanvasGradient(ppCanvasGradient)
    }

    /**
     * 
     * @param {Float} x0 
     * @param {Float} y0 
     * @param {Float} r0 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} r1 
     * @returns {ICanvasGradient} 
     */
    createRadialGradient(x0, y0, r0, x1, y1, r1) {
        result := ComCall(24, this, "float", x0, "float", y0, "float", r0, "float", x1, "float", y1, "float", r1, "ptr*", &ppCanvasGradient := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICanvasGradient(ppCanvasGradient)
    }

    /**
     * 
     * @param {IDispatch} image_ 
     * @param {VARIANT} repetition 
     * @returns {ICanvasPattern} 
     */
    createPattern(image_, repetition) {
        result := ComCall(25, this, "ptr", image_, "ptr", repetition, "ptr*", &ppCanvasPattern := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICanvasPattern(ppCanvasPattern)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineCap(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(26, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lineCap() {
        p := BSTR()
        result := ComCall(27, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineJoin(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(28, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lineJoin() {
        p := BSTR()
        result := ComCall(29, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_lineWidth(v) {
        result := ComCall(30, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_lineWidth() {
        result := ComCall(31, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_miterLimit(v) {
        result := ComCall(32, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_miterLimit() {
        result := ComCall(33, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_shadowBlur(v) {
        result := ComCall(34, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_shadowBlur() {
        result := ComCall(35, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_shadowColor(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(36, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_shadowColor() {
        p := BSTR()
        result := ComCall(37, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_shadowOffsetX(v) {
        result := ComCall(38, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_shadowOffsetX() {
        result := ComCall(39, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_shadowOffsetY(v) {
        result := ComCall(40, this, "float", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_shadowOffsetY() {
        result := ComCall(41, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
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
        result := ComCall(42, this, "float", x, "float", y, "float", w, "float", h, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(43, this, "float", x, "float", y, "float", w, "float", h, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(44, this, "float", x, "float", y, "float", w, "float", h, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(45, this, "float", x, "float", y, "float", radius, "float", startAngle, "float", endAngle, "int", anticlockwise, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(46, this, "float", x1, "float", y1, "float", x2, "float", y2, "float", radius, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    beginPath() {
        result := ComCall(47, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(48, this, "float", cp1x, "float", cp1y, "float", cp2x, "float", cp2y, "float", x, "float", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Discards the current pixel if the specified value is less than zero.
     * @remarks
     * Use the **clip** HLSL intrinsic function to simulate clipping planes if each component of the *x* parameter represents the distance from a plane.
     * 
     * Also, use the **clip** function to test for alpha behavior, as shown in the following example:
     * 
     * 
     * ```
     * clip( Input.Color.A < 0.1f ? -1:1 );
     * ```
     * @returns {HRESULT} | Item                                                   | Description                            |
     * |--------------------------------------------------------|----------------------------------------|
     * | <span id="x"></span><span id="X"></span>*x*<br/> | \[in\] The specified value.<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * None.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-clip
     */
    clip() {
        result := ComCall(49, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    closePath() {
        result := ComCall(50, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    fill() {
        result := ComCall(51, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    lineTo(x, y) {
        result := ComCall(52, this, "float", x, "float", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * moveToCurrentRow Method (SQLServerResultSet)
     * @remarks
     * This moveToCurrentRow method is specified by the moveToCurrentRow method in the java.sql.ResultSet interface.  
     *   
     *  This method has no effect if the cursor is not on the insert row.
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/movetocurrentrow-method-sqlserverresultset
     */
    moveTo(x, y) {
        result := ComCall(53, this, "float", x, "float", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(54, this, "float", cpx, "float", cpy, "float", x, "float", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(55, this, "float", x, "float", y, "float", w, "float", h, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stroke() {
        result := ComCall(56, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {VARIANT_BOOL} 
     */
    isPointInPath(x, y) {
        result := ComCall(57, this, "float", x, "float", y, "short*", &pResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_font(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(58, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_font() {
        p := BSTR()
        result := ComCall(59, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlign(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(60, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlign() {
        p := BSTR()
        result := ComCall(61, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textBaseline(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(62, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textBaseline() {
        p := BSTR()
        result := ComCall(63, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
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
        if(text is String) {
            pin := BSTR.Alloc(text)
            text := pin.Value
        }

        result := ComCall(64, this, "ptr", text, "float", x, "float", y, "ptr", maxWidth, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {ICanvasTextMetrics} 
     */
    measureText(text) {
        if(text is String) {
            pin := BSTR.Alloc(text)
            text := pin.Value
        }

        result := ComCall(65, this, "ptr", text, "ptr*", &ppCanvasTextMetrics := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICanvasTextMetrics(ppCanvasTextMetrics)
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
        if(text is String) {
            pin := BSTR.Alloc(text)
            text := pin.Value
        }

        result := ComCall(66, this, "ptr", text, "float", x, "float", y, "ptr", maxWidth, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(67, this, "ptr", pSrc, "ptr", a1, "ptr", a2, "ptr", a3, "ptr", a4, "ptr", a5, "ptr", a6, "ptr", a7, "ptr", a8, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} a1 
     * @param {VARIANT} a2 
     * @returns {ICanvasImageData} 
     */
    createImageData(a1, a2) {
        result := ComCall(68, this, "ptr", a1, "ptr", a2, "ptr*", &ppCanvasImageData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICanvasImageData(ppCanvasImageData)
    }

    /**
     * 
     * @param {Float} sx 
     * @param {Float} sy 
     * @param {Float} sw 
     * @param {Float} sh 
     * @returns {ICanvasImageData} 
     */
    getImageData(sx, sy, sw, sh) {
        result := ComCall(69, this, "float", sx, "float", sy, "float", sw, "float", sh, "ptr*", &ppCanvasImageData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICanvasImageData(ppCanvasImageData)
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
        result := ComCall(70, this, "ptr", imagedata, "float", dx, "float", dy, "ptr", dirtyX, "ptr", dirtyY, "ptr", dirtyWidth, "ptr", dirtyHeight, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
