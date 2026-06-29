#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHTMLCanvasElement.ahk" { IHTMLCanvasElement }
#Import ".\ICanvasPattern.ahk" { ICanvasPattern }
#Import ".\ICanvasGradient.ahk" { ICanvasGradient }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ICanvasTextMetrics.ahk" { ICanvasTextMetrics }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ICanvasImageData.ahk" { ICanvasImageData }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ICanvasRenderingContext2D extends IDispatch {
    /**
     * The interface identifier for ICanvasRenderingContext2D
     * @type {Guid}
     */
    static IID := Guid("{305106ff-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for CanvasRenderingContext2D
     * @type {Guid}
     */
    static CLSID := Guid("{30510700-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICanvasRenderingContext2D interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_canvas                   : IntPtr
        restore                      : IntPtr
        save                         : IntPtr
        rotate                       : IntPtr
        scale                        : IntPtr
        setTransform                 : IntPtr
        transform                    : IntPtr
        translate                    : IntPtr
        put_globalAlpha              : IntPtr
        get_globalAlpha              : IntPtr
        put_globalCompositeOperation : IntPtr
        get_globalCompositeOperation : IntPtr
        put_fillStyle                : IntPtr
        get_fillStyle                : IntPtr
        put_strokeStyle              : IntPtr
        get_strokeStyle              : IntPtr
        createLinearGradient         : IntPtr
        createRadialGradient         : IntPtr
        createPattern                : IntPtr
        put_lineCap                  : IntPtr
        get_lineCap                  : IntPtr
        put_lineJoin                 : IntPtr
        get_lineJoin                 : IntPtr
        put_lineWidth                : IntPtr
        get_lineWidth                : IntPtr
        put_miterLimit               : IntPtr
        get_miterLimit               : IntPtr
        put_shadowBlur               : IntPtr
        get_shadowBlur               : IntPtr
        put_shadowColor              : IntPtr
        get_shadowColor              : IntPtr
        put_shadowOffsetX            : IntPtr
        get_shadowOffsetX            : IntPtr
        put_shadowOffsetY            : IntPtr
        get_shadowOffsetY            : IntPtr
        clearRect                    : IntPtr
        fillRect                     : IntPtr
        strokeRect                   : IntPtr
        arc                          : IntPtr
        arcTo                        : IntPtr
        beginPath                    : IntPtr
        bezierCurveTo                : IntPtr
        clip                         : IntPtr
        closePath                    : IntPtr
        fill                         : IntPtr
        lineTo                       : IntPtr
        moveTo                       : IntPtr
        quadraticCurveTo             : IntPtr
        rect                         : IntPtr
        stroke                       : IntPtr
        isPointInPath                : IntPtr
        put_font                     : IntPtr
        get_font                     : IntPtr
        put_textAlign                : IntPtr
        get_textAlign                : IntPtr
        put_textBaseline             : IntPtr
        get_textBaseline             : IntPtr
        fillText                     : IntPtr
        measureText                  : IntPtr
        strokeText                   : IntPtr
        drawImage                    : IntPtr
        createImageData              : IntPtr
        getImageData                 : IntPtr
        putImageData                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICanvasRenderingContext2D.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/Multimedia/restore
     */
    restore() {
        result := ComCall(8, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/Multimedia/save
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
     * @returns {Float} 
     */
    get_globalAlpha() {
        result := ComCall(16, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_globalCompositeOperation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_globalCompositeOperation() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fillStyle(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fillStyle() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeStyle(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_strokeStyle() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
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
        result := ComCall(23, this, "float", x0, "float", y0, "float", x1, "float", y1, "ptr*", &ppCanvasGradient := 0, "HRESULT")
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
        result := ComCall(24, this, "float", x0, "float", y0, "float", r0, "float", x1, "float", y1, "float", r1, "ptr*", &ppCanvasGradient := 0, "HRESULT")
        return ICanvasGradient(ppCanvasGradient)
    }

    /**
     * 
     * @param {IDispatch} _image 
     * @param {VARIANT} repetition 
     * @returns {ICanvasPattern} 
     */
    createPattern(_image, repetition) {
        result := ComCall(25, this, "ptr", _image, VARIANT, repetition, "ptr*", &ppCanvasPattern := 0, "HRESULT")
        return ICanvasPattern(ppCanvasPattern)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineCap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(26, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lineCap() {
        p := BSTR.Owned()
        result := ComCall(27, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineJoin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(28, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lineJoin() {
        p := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, p, "HRESULT")
        return p
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
     * @returns {Float} 
     */
    get_lineWidth() {
        result := ComCall(31, this, "float*", &p := 0, "HRESULT")
        return p
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
     * @returns {Float} 
     */
    get_miterLimit() {
        result := ComCall(33, this, "float*", &p := 0, "HRESULT")
        return p
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
     * @returns {Float} 
     */
    get_shadowBlur() {
        result := ComCall(35, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_shadowColor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(36, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_shadowColor() {
        p := BSTR.Owned()
        result := ComCall(37, this, BSTR.Ptr, p, "HRESULT")
        return p
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
     * @returns {Float} 
     */
    get_shadowOffsetX() {
        result := ComCall(39, this, "float*", &p := 0, "HRESULT")
        return p
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
     * @returns {Float} 
     */
    get_shadowOffsetY() {
        result := ComCall(41, this, "float*", &p := 0, "HRESULT")
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
        result := ComCall(45, this, "float", x, "float", y, "float", radius, "float", startAngle, "float", endAngle, BOOL, anticlockwise, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-clip
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
     * @returns {VARIANT_BOOL} 
     */
    isPointInPath(x, y) {
        result := ComCall(57, this, "float", x, "float", y, VARIANT_BOOL.Ptr, &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_font(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(58, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_font() {
        p := BSTR.Owned()
        result := ComCall(59, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(60, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlign() {
        p := BSTR.Owned()
        result := ComCall(61, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textBaseline(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(62, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textBaseline() {
        p := BSTR.Owned()
        result := ComCall(63, this, BSTR.Ptr, p, "HRESULT")
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
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(64, this, BSTR, text, "float", x, "float", y, VARIANT, maxWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {ICanvasTextMetrics} 
     */
    measureText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(65, this, BSTR, text, "ptr*", &ppCanvasTextMetrics := 0, "HRESULT")
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
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(66, this, BSTR, text, "float", x, "float", y, VARIANT, maxWidth, "HRESULT")
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
        result := ComCall(67, this, "ptr", pSrc, VARIANT, a1, VARIANT, a2, VARIANT, a3, VARIANT, a4, VARIANT, a5, VARIANT, a6, VARIANT, a7, VARIANT, a8, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} a1 
     * @param {VARIANT} a2 
     * @returns {ICanvasImageData} 
     */
    createImageData(a1, a2) {
        result := ComCall(68, this, VARIANT, a1, VARIANT, a2, "ptr*", &ppCanvasImageData := 0, "HRESULT")
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
        result := ComCall(69, this, "float", sx, "float", sy, "float", sw, "float", sh, "ptr*", &ppCanvasImageData := 0, "HRESULT")
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
        result := ComCall(70, this, "ptr", imagedata, "float", dx, "float", dy, VARIANT, dirtyX, VARIANT, dirtyY, VARIANT, dirtyWidth, VARIANT, dirtyHeight, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICanvasRenderingContext2D.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_canvas := CallbackCreate(GetMethod(implObj, "get_canvas"), flags, 2)
        this.vtbl.restore := CallbackCreate(GetMethod(implObj, "restore"), flags, 1)
        this.vtbl.save := CallbackCreate(GetMethod(implObj, "save"), flags, 1)
        this.vtbl.rotate := CallbackCreate(GetMethod(implObj, "rotate"), flags, 2)
        this.vtbl.scale := CallbackCreate(GetMethod(implObj, "scale"), flags, 3)
        this.vtbl.setTransform := CallbackCreate(GetMethod(implObj, "setTransform"), flags, 7)
        this.vtbl.transform := CallbackCreate(GetMethod(implObj, "transform"), flags, 7)
        this.vtbl.translate := CallbackCreate(GetMethod(implObj, "translate"), flags, 3)
        this.vtbl.put_globalAlpha := CallbackCreate(GetMethod(implObj, "put_globalAlpha"), flags, 2)
        this.vtbl.get_globalAlpha := CallbackCreate(GetMethod(implObj, "get_globalAlpha"), flags, 2)
        this.vtbl.put_globalCompositeOperation := CallbackCreate(GetMethod(implObj, "put_globalCompositeOperation"), flags, 2)
        this.vtbl.get_globalCompositeOperation := CallbackCreate(GetMethod(implObj, "get_globalCompositeOperation"), flags, 2)
        this.vtbl.put_fillStyle := CallbackCreate(GetMethod(implObj, "put_fillStyle"), flags, 2)
        this.vtbl.get_fillStyle := CallbackCreate(GetMethod(implObj, "get_fillStyle"), flags, 2)
        this.vtbl.put_strokeStyle := CallbackCreate(GetMethod(implObj, "put_strokeStyle"), flags, 2)
        this.vtbl.get_strokeStyle := CallbackCreate(GetMethod(implObj, "get_strokeStyle"), flags, 2)
        this.vtbl.createLinearGradient := CallbackCreate(GetMethod(implObj, "createLinearGradient"), flags, 6)
        this.vtbl.createRadialGradient := CallbackCreate(GetMethod(implObj, "createRadialGradient"), flags, 8)
        this.vtbl.createPattern := CallbackCreate(GetMethod(implObj, "createPattern"), flags, 4)
        this.vtbl.put_lineCap := CallbackCreate(GetMethod(implObj, "put_lineCap"), flags, 2)
        this.vtbl.get_lineCap := CallbackCreate(GetMethod(implObj, "get_lineCap"), flags, 2)
        this.vtbl.put_lineJoin := CallbackCreate(GetMethod(implObj, "put_lineJoin"), flags, 2)
        this.vtbl.get_lineJoin := CallbackCreate(GetMethod(implObj, "get_lineJoin"), flags, 2)
        this.vtbl.put_lineWidth := CallbackCreate(GetMethod(implObj, "put_lineWidth"), flags, 2)
        this.vtbl.get_lineWidth := CallbackCreate(GetMethod(implObj, "get_lineWidth"), flags, 2)
        this.vtbl.put_miterLimit := CallbackCreate(GetMethod(implObj, "put_miterLimit"), flags, 2)
        this.vtbl.get_miterLimit := CallbackCreate(GetMethod(implObj, "get_miterLimit"), flags, 2)
        this.vtbl.put_shadowBlur := CallbackCreate(GetMethod(implObj, "put_shadowBlur"), flags, 2)
        this.vtbl.get_shadowBlur := CallbackCreate(GetMethod(implObj, "get_shadowBlur"), flags, 2)
        this.vtbl.put_shadowColor := CallbackCreate(GetMethod(implObj, "put_shadowColor"), flags, 2)
        this.vtbl.get_shadowColor := CallbackCreate(GetMethod(implObj, "get_shadowColor"), flags, 2)
        this.vtbl.put_shadowOffsetX := CallbackCreate(GetMethod(implObj, "put_shadowOffsetX"), flags, 2)
        this.vtbl.get_shadowOffsetX := CallbackCreate(GetMethod(implObj, "get_shadowOffsetX"), flags, 2)
        this.vtbl.put_shadowOffsetY := CallbackCreate(GetMethod(implObj, "put_shadowOffsetY"), flags, 2)
        this.vtbl.get_shadowOffsetY := CallbackCreate(GetMethod(implObj, "get_shadowOffsetY"), flags, 2)
        this.vtbl.clearRect := CallbackCreate(GetMethod(implObj, "clearRect"), flags, 5)
        this.vtbl.fillRect := CallbackCreate(GetMethod(implObj, "fillRect"), flags, 5)
        this.vtbl.strokeRect := CallbackCreate(GetMethod(implObj, "strokeRect"), flags, 5)
        this.vtbl.arc := CallbackCreate(GetMethod(implObj, "arc"), flags, 7)
        this.vtbl.arcTo := CallbackCreate(GetMethod(implObj, "arcTo"), flags, 6)
        this.vtbl.beginPath := CallbackCreate(GetMethod(implObj, "beginPath"), flags, 1)
        this.vtbl.bezierCurveTo := CallbackCreate(GetMethod(implObj, "bezierCurveTo"), flags, 7)
        this.vtbl.clip := CallbackCreate(GetMethod(implObj, "clip"), flags, 1)
        this.vtbl.closePath := CallbackCreate(GetMethod(implObj, "closePath"), flags, 1)
        this.vtbl.fill := CallbackCreate(GetMethod(implObj, "fill"), flags, 1)
        this.vtbl.lineTo := CallbackCreate(GetMethod(implObj, "lineTo"), flags, 3)
        this.vtbl.moveTo := CallbackCreate(GetMethod(implObj, "moveTo"), flags, 3)
        this.vtbl.quadraticCurveTo := CallbackCreate(GetMethod(implObj, "quadraticCurveTo"), flags, 5)
        this.vtbl.rect := CallbackCreate(GetMethod(implObj, "rect"), flags, 5)
        this.vtbl.stroke := CallbackCreate(GetMethod(implObj, "stroke"), flags, 1)
        this.vtbl.isPointInPath := CallbackCreate(GetMethod(implObj, "isPointInPath"), flags, 4)
        this.vtbl.put_font := CallbackCreate(GetMethod(implObj, "put_font"), flags, 2)
        this.vtbl.get_font := CallbackCreate(GetMethod(implObj, "get_font"), flags, 2)
        this.vtbl.put_textAlign := CallbackCreate(GetMethod(implObj, "put_textAlign"), flags, 2)
        this.vtbl.get_textAlign := CallbackCreate(GetMethod(implObj, "get_textAlign"), flags, 2)
        this.vtbl.put_textBaseline := CallbackCreate(GetMethod(implObj, "put_textBaseline"), flags, 2)
        this.vtbl.get_textBaseline := CallbackCreate(GetMethod(implObj, "get_textBaseline"), flags, 2)
        this.vtbl.fillText := CallbackCreate(GetMethod(implObj, "fillText"), flags, 5)
        this.vtbl.measureText := CallbackCreate(GetMethod(implObj, "measureText"), flags, 3)
        this.vtbl.strokeText := CallbackCreate(GetMethod(implObj, "strokeText"), flags, 5)
        this.vtbl.drawImage := CallbackCreate(GetMethod(implObj, "drawImage"), flags, 10)
        this.vtbl.createImageData := CallbackCreate(GetMethod(implObj, "createImageData"), flags, 4)
        this.vtbl.getImageData := CallbackCreate(GetMethod(implObj, "getImageData"), flags, 6)
        this.vtbl.putImageData := CallbackCreate(GetMethod(implObj, "putImageData"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_canvas)
        CallbackFree(this.vtbl.restore)
        CallbackFree(this.vtbl.save)
        CallbackFree(this.vtbl.rotate)
        CallbackFree(this.vtbl.scale)
        CallbackFree(this.vtbl.setTransform)
        CallbackFree(this.vtbl.transform)
        CallbackFree(this.vtbl.translate)
        CallbackFree(this.vtbl.put_globalAlpha)
        CallbackFree(this.vtbl.get_globalAlpha)
        CallbackFree(this.vtbl.put_globalCompositeOperation)
        CallbackFree(this.vtbl.get_globalCompositeOperation)
        CallbackFree(this.vtbl.put_fillStyle)
        CallbackFree(this.vtbl.get_fillStyle)
        CallbackFree(this.vtbl.put_strokeStyle)
        CallbackFree(this.vtbl.get_strokeStyle)
        CallbackFree(this.vtbl.createLinearGradient)
        CallbackFree(this.vtbl.createRadialGradient)
        CallbackFree(this.vtbl.createPattern)
        CallbackFree(this.vtbl.put_lineCap)
        CallbackFree(this.vtbl.get_lineCap)
        CallbackFree(this.vtbl.put_lineJoin)
        CallbackFree(this.vtbl.get_lineJoin)
        CallbackFree(this.vtbl.put_lineWidth)
        CallbackFree(this.vtbl.get_lineWidth)
        CallbackFree(this.vtbl.put_miterLimit)
        CallbackFree(this.vtbl.get_miterLimit)
        CallbackFree(this.vtbl.put_shadowBlur)
        CallbackFree(this.vtbl.get_shadowBlur)
        CallbackFree(this.vtbl.put_shadowColor)
        CallbackFree(this.vtbl.get_shadowColor)
        CallbackFree(this.vtbl.put_shadowOffsetX)
        CallbackFree(this.vtbl.get_shadowOffsetX)
        CallbackFree(this.vtbl.put_shadowOffsetY)
        CallbackFree(this.vtbl.get_shadowOffsetY)
        CallbackFree(this.vtbl.clearRect)
        CallbackFree(this.vtbl.fillRect)
        CallbackFree(this.vtbl.strokeRect)
        CallbackFree(this.vtbl.arc)
        CallbackFree(this.vtbl.arcTo)
        CallbackFree(this.vtbl.beginPath)
        CallbackFree(this.vtbl.bezierCurveTo)
        CallbackFree(this.vtbl.clip)
        CallbackFree(this.vtbl.closePath)
        CallbackFree(this.vtbl.fill)
        CallbackFree(this.vtbl.lineTo)
        CallbackFree(this.vtbl.moveTo)
        CallbackFree(this.vtbl.quadraticCurveTo)
        CallbackFree(this.vtbl.rect)
        CallbackFree(this.vtbl.stroke)
        CallbackFree(this.vtbl.isPointInPath)
        CallbackFree(this.vtbl.put_font)
        CallbackFree(this.vtbl.get_font)
        CallbackFree(this.vtbl.put_textAlign)
        CallbackFree(this.vtbl.get_textAlign)
        CallbackFree(this.vtbl.put_textBaseline)
        CallbackFree(this.vtbl.get_textBaseline)
        CallbackFree(this.vtbl.fillText)
        CallbackFree(this.vtbl.measureText)
        CallbackFree(this.vtbl.strokeText)
        CallbackFree(this.vtbl.drawImage)
        CallbackFree(this.vtbl.createImageData)
        CallbackFree(this.vtbl.getImageData)
        CallbackFree(this.vtbl.putImageData)
    }
}
