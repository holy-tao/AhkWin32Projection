#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkRenderer.ahk
#Include .\IInkDisp.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Ole\IPictureDisp.ahk
#Include .\IInkCursors.ahk
#Include .\IInkTablet.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @remarks
 * 
 * Creating the InkCollector control behind a transparent control (such as a GroupBox with the WS_EX_TRANSPARENT property set) will prevent InkCollector from collecting ink.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkcollector
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkCollector extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkCollector
     * @type {Guid}
     */
    static IID => Guid("{f0f060b5-8b1f-4a7c-89ec-880692588a4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_hWnd", "put_hWnd", "get_Enabled", "put_Enabled", "get_DefaultDrawingAttributes", "putref_DefaultDrawingAttributes", "get_Renderer", "putref_Renderer", "get_Ink", "putref_Ink", "get_AutoRedraw", "put_AutoRedraw", "get_CollectingInk", "get_CollectionMode", "put_CollectionMode", "get_DynamicRendering", "put_DynamicRendering", "get_DesiredPacketDescription", "put_DesiredPacketDescription", "get_MouseIcon", "put_MouseIcon", "putref_MouseIcon", "get_MousePointer", "put_MousePointer", "get_Cursors", "get_MarginX", "put_MarginX", "get_MarginY", "put_MarginY", "get_Tablet", "get_SupportHighContrastInk", "put_SupportHighContrastInk", "SetGestureStatus", "GetGestureStatus", "GetWindowInputRectangle", "SetWindowInputRectangle", "SetAllTabletsMode", "SetSingleTabletIntegratedMode", "GetEventInterest", "SetEventInterest"]

    /**
     * @type {Pointer} 
     */
    hWnd {
        get => this.get_hWnd()
        set => this.put_hWnd(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {IInkDrawingAttributes} 
     */
    DefaultDrawingAttributes {
        get => this.get_DefaultDrawingAttributes()
    }

    /**
     * @type {IInkRenderer} 
     */
    Renderer {
        get => this.get_Renderer()
    }

    /**
     * @type {IInkDisp} 
     */
    Ink {
        get => this.get_Ink()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoRedraw {
        get => this.get_AutoRedraw()
        set => this.put_AutoRedraw(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    CollectingInk {
        get => this.get_CollectingInk()
    }

    /**
     * @type {Integer} 
     */
    CollectionMode {
        get => this.get_CollectionMode()
        set => this.put_CollectionMode(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DynamicRendering {
        get => this.get_DynamicRendering()
        set => this.put_DynamicRendering(value)
    }

    /**
     * @type {VARIANT} 
     */
    DesiredPacketDescription {
        get => this.get_DesiredPacketDescription()
        set => this.put_DesiredPacketDescription(value)
    }

    /**
     * @type {IPictureDisp} 
     */
    MouseIcon {
        get => this.get_MouseIcon()
        set => this.put_MouseIcon(value)
    }

    /**
     * @type {Integer} 
     */
    MousePointer {
        get => this.get_MousePointer()
        set => this.put_MousePointer(value)
    }

    /**
     * @type {IInkCursors} 
     */
    Cursors {
        get => this.get_Cursors()
    }

    /**
     * @type {Integer} 
     */
    MarginX {
        get => this.get_MarginX()
        set => this.put_MarginX(value)
    }

    /**
     * @type {Integer} 
     */
    MarginY {
        get => this.get_MarginY()
        set => this.put_MarginY(value)
    }

    /**
     * @type {IInkTablet} 
     */
    Tablet {
        get => this.get_Tablet()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SupportHighContrastInk {
        get => this.get_SupportHighContrastInk()
        set => this.put_SupportHighContrastInk(value)
    }

    /**
     * Gets or sets the handle value of the window on which ink is drawn.
     * @remarks
     * 
     * If two or more windows exist, this property allows you to specify which window collects ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> objects, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>FALSE</b>. You can then set the <b>hWnd</b> property and re-enable the object by setting the <b>Enabled</b> property to <b>TRUE</b>.</div>
     * <div> </div>
     * In Automation, this property is called <b>hWnd Property</b>.
     * 
     * 
     * @returns {Pointer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_hwnd
     */
    get_hWnd() {
        result := ComCall(7, this, "ptr*", &CurrentWindow := 0, "HRESULT")
        return CurrentWindow
    }

    /**
     * Gets or sets the handle value of the window on which ink is drawn.
     * @remarks
     * 
     * If two or more windows exist, this property allows you to specify which window collects ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> objects, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>FALSE</b>. You can then set the <b>hWnd</b> property and re-enable the object by setting the <b>Enabled</b> property to <b>TRUE</b>.</div>
     * <div> </div>
     * In Automation, this property is called <b>hWnd Property</b>.
     * 
     * 
     * @param {Pointer} NewWindow 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_hwnd
     */
    put_hWnd(NewWindow) {
        result := ComCall(8, this, "ptr", NewWindow, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether the InkCollector object collects pen input (in-air packets, cursor in range events, and so on).
     * @remarks
     * 
     * If an enabled object's window input rectangle (set in the constructor or with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setwindowinputrectangle">SetWindowInputRectangle</a> method) of an enabled object overlaps the window input rectangle of another enabled object, the E_INK_OVERLAPPING_INPUT_RECT error is returned. Overlap can occur without an error as long as only one of the input rectangles is enabled at any known time.
     * 
     * While an object is not enabled, you receive no events.
     * 
     * When a container control has its <b>Enabled</b> property set to <b>FALSE</b>, all of its contained controls are disabled as well.
     * 
     * You cannot set the <b>Enabled</b> property to <b>FALSE</b> while the object is collecting ink (<a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_collectingink">CollectingInk</a> property is <b>TRUE</b>).
     * 
     * We recommend that you set <b>Enabled</b> set to <b>FALSE</b> when the application shuts down.
     * 
     * <div class="alert"><b>Note</b>  Setting this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * This property must be set to <b>FALSE</b> before setting or calling specific properties and methods of the object. If you try to change the specified properties or methods, an error occurs. The following properties and methods cannot be set or called unless the <b>Enabled</b> property is first set to <b>FALSE</b>:
     * 
     * Properties
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_attachmode">AttachMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd">hWnd</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_ink">Ink</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginx">MarginX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginy">MarginY</a>
     * </li>
     * </ul>
     * Methods
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode">SetAllTabletsMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode">SetSingleTabletIntegratedMode</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_enabled
     */
    get_Enabled() {
        result := ComCall(9, this, "short*", &Collecting := 0, "HRESULT")
        return Collecting
    }

    /**
     * Gets or sets a value that specifies whether the InkCollector object collects pen input (in-air packets, cursor in range events, and so on).
     * @remarks
     * 
     * If an enabled object's window input rectangle (set in the constructor or with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setwindowinputrectangle">SetWindowInputRectangle</a> method) of an enabled object overlaps the window input rectangle of another enabled object, the E_INK_OVERLAPPING_INPUT_RECT error is returned. Overlap can occur without an error as long as only one of the input rectangles is enabled at any known time.
     * 
     * While an object is not enabled, you receive no events.
     * 
     * When a container control has its <b>Enabled</b> property set to <b>FALSE</b>, all of its contained controls are disabled as well.
     * 
     * You cannot set the <b>Enabled</b> property to <b>FALSE</b> while the object is collecting ink (<a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_collectingink">CollectingInk</a> property is <b>TRUE</b>).
     * 
     * We recommend that you set <b>Enabled</b> set to <b>FALSE</b> when the application shuts down.
     * 
     * <div class="alert"><b>Note</b>  Setting this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * This property must be set to <b>FALSE</b> before setting or calling specific properties and methods of the object. If you try to change the specified properties or methods, an error occurs. The following properties and methods cannot be set or called unless the <b>Enabled</b> property is first set to <b>FALSE</b>:
     * 
     * Properties
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_attachmode">AttachMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd">hWnd</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_ink">Ink</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginx">MarginX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginy">MarginY</a>
     * </li>
     * </ul>
     * Methods
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode">SetAllTabletsMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode">SetSingleTabletIntegratedMode</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {VARIANT_BOOL} Collecting 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_enabled
     */
    put_Enabled(Collecting) {
        result := ComCall(10, this, "short", Collecting, "HRESULT")
        return result
    }

    /**
     * Gets or sets the default drawing attributes to use when drawing and displaying ink.
     * @remarks
     * 
     * The drawing attributes specified with this property are the attributes that are assigned to a new cursor.
     * 
     * The default drawing attributes are as follows:
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_antialiased">AntiAliased</a> = <b>TRUE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_color">Color</a> = <b>BLACK</b> (RGB(0,0,0)) if not in High Contrast mode; otherwise, Color=COLOR_WINDOWTEXT.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_fittocurve">FitToCurve</a> = <b>FALSE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> = 1 (in ink space units)
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure">IgnorePressure</a> = <b>FALSE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_pentip">PenTip</a> = <b>Ball</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_rasteroperation">RasterOperation</a> = <b>CopyPen</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_transparency">Transparency</a> = 0 (totally opaque)
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> = 53 (in ink space units)
     * 
     * To set different attributes on a new cursor, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object.
     * 
     * To change the drawing attributes of a single stroke, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object. To change the drawing attributes of a collection of strokes, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokes-modifydrawingattributes">ModifyDrawingAttributes</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * 
     * <div class="alert"><b>Note</b>  The <b>DefaultDrawingAttributes</b> property contains the drawing attributes that all cursors use unless they set their own <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property. For example, a new <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object uses <b>DefaultDrawingAttributes</b>, and an old <b>IInkCursor</b> object on which the <b>DrawingAttributes</b> is set to <b>NULL</b> also uses <b>DefaultDrawingAttributes</b>.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_defaultdrawingattributes
     */
    get_DefaultDrawingAttributes() {
        result := ComCall(11, this, "ptr*", &CurrentAttributes := 0, "HRESULT")
        return IInkDrawingAttributes(CurrentAttributes)
    }

    /**
     * Gets or sets the default drawing attributes to use when drawing and displaying ink.
     * @remarks
     * 
     * The drawing attributes specified with this property are the attributes that are assigned to a new cursor.
     * 
     * The default drawing attributes are as follows:
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_antialiased">AntiAliased</a> = <b>TRUE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_color">Color</a> = <b>BLACK</b> (RGB(0,0,0)) if not in High Contrast mode; otherwise, Color=COLOR_WINDOWTEXT.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_fittocurve">FitToCurve</a> = <b>FALSE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> = 1 (in ink space units)
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure">IgnorePressure</a> = <b>FALSE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_pentip">PenTip</a> = <b>Ball</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_rasteroperation">RasterOperation</a> = <b>CopyPen</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_transparency">Transparency</a> = 0 (totally opaque)
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> = 53 (in ink space units)
     * 
     * To set different attributes on a new cursor, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object.
     * 
     * To change the drawing attributes of a single stroke, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object. To change the drawing attributes of a collection of strokes, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokes-modifydrawingattributes">ModifyDrawingAttributes</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * 
     * <div class="alert"><b>Note</b>  The <b>DefaultDrawingAttributes</b> property contains the drawing attributes that all cursors use unless they set their own <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property. For example, a new <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object uses <b>DefaultDrawingAttributes</b>, and an old <b>IInkCursor</b> object on which the <b>DrawingAttributes</b> is set to <b>NULL</b> also uses <b>DefaultDrawingAttributes</b>.</div>
     * <div> </div>
     * 
     * 
     * @param {IInkDrawingAttributes} NewAttributes 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-putref_defaultdrawingattributes
     */
    putref_DefaultDrawingAttributes(NewAttributes) {
        result := ComCall(12, this, "ptr", NewAttributes, "HRESULT")
        return result
    }

    /**
     * Gets or sets the InkRenderer object that is used to draw ink.
     * @remarks
     * 
     * When handling certain window messages, changing the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrenderer-class">Renderer</a> associated with the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> can cause a reentrant function call, generating unexpected results. For example, changing to a different <i>Renderer</i> or modifying its transforms within a message handler can result in a reentrant call. This affects the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). It is an issue with single-threaded apartment model applications.
     * 
     * 
     * @returns {IInkRenderer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_renderer
     */
    get_Renderer() {
        result := ComCall(13, this, "ptr*", &CurrentInkRenderer := 0, "HRESULT")
        return IInkRenderer(CurrentInkRenderer)
    }

    /**
     * 
     * @param {IInkRenderer} NewInkRenderer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-putref_renderer
     */
    putref_Renderer(NewInkRenderer) {
        result := ComCall(14, this, "ptr", NewInkRenderer, "HRESULT")
        return result
    }

    /**
     * Gets or sets the InkDisp object that is associated with an InkCollector object or an InkOverlay object.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object must be disabled before setting this property. To disable the <b>InkCollector</b> object or the <b>InkOverlay</b> object, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>FALSE</b>. You can then set the <b>Ink</b> property, and re-enable the object by setting the <b>Enabled</b> property to <b>TRUE</b>.</div>
     * <div> </div>
     * An <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> creates an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object by default. If two or more <b>InkDisp</b> objects exist on a known application window, they can be switched out to enable collection into any of them (such as after deserializing one of the <b>InkDisp</b> objects).
     * 
     * 
     * @returns {IInkDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_ink
     */
    get_Ink() {
        result := ComCall(15, this, "ptr*", &Ink := 0, "HRESULT")
        return IInkDisp(Ink)
    }

    /**
     * 
     * @param {IInkDisp} NewInk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-putref_ink
     */
    putref_Ink(NewInk) {
        result := ComCall(16, this, "ptr", NewInk, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether an ink collector repaints the ink when the window is invalidated.
     * @remarks
     * 
     * If <b>VARIANT_TRUE</b>, the ink collector repaints the ink when the window is invalidated. For example, if you minimize the window and then restore it, the ink is automatically redrawn. If <b>VARIANT_FALSE</b>, the ink collector does not repaint the ink when the window is invalidated. For example, if you minimize the window and then restore it, the ink disappears from the screen.
     * 
     * When <b>AutoRedraw</b> is <b>VARIANT_FALSE</b>, the ink appears while inking unless the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_dynamicrendering">DynamicRendering</a> property is false.
     * 
     * When your application is performing custom rendering or when your application is sensitive to painting issues, you can handle the repainting yourself and set the <b>AutoRedraw</b> property to <b>VARIANT_FALSE</b> for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control. Use the events in the following table to handle the repainting.
     * 
     * <table>
     * <tr>
     * <th>Object or Control</th>
     * <th>Event</th>
     * </tr>
     * <tr>
     * <td>
     * InkCollector Object
     * 
     * </td>
     * <td>
     * The underlying controls Invalidated and Paint events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * InkOverlay Object
     * 
     * </td>
     * <td>
     * The underlying controls Invalidated and Paint events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * InkPicture Control
     * 
     * </td>
     * <td>
     * InkPicture controls inherited Invalidated and Paint events.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_autoredraw
     */
    get_AutoRedraw() {
        result := ComCall(17, this, "short*", &AutoRedraw := 0, "HRESULT")
        return AutoRedraw
    }

    /**
     * Gets or sets a value that specifies whether an ink collector repaints the ink when the window is invalidated.
     * @remarks
     * 
     * If <b>VARIANT_TRUE</b>, the ink collector repaints the ink when the window is invalidated. For example, if you minimize the window and then restore it, the ink is automatically redrawn. If <b>VARIANT_FALSE</b>, the ink collector does not repaint the ink when the window is invalidated. For example, if you minimize the window and then restore it, the ink disappears from the screen.
     * 
     * When <b>AutoRedraw</b> is <b>VARIANT_FALSE</b>, the ink appears while inking unless the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_dynamicrendering">DynamicRendering</a> property is false.
     * 
     * When your application is performing custom rendering or when your application is sensitive to painting issues, you can handle the repainting yourself and set the <b>AutoRedraw</b> property to <b>VARIANT_FALSE</b> for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control. Use the events in the following table to handle the repainting.
     * 
     * <table>
     * <tr>
     * <th>Object or Control</th>
     * <th>Event</th>
     * </tr>
     * <tr>
     * <td>
     * InkCollector Object
     * 
     * </td>
     * <td>
     * The underlying controls Invalidated and Paint events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * InkOverlay Object
     * 
     * </td>
     * <td>
     * The underlying controls Invalidated and Paint events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * InkPicture Control
     * 
     * </td>
     * <td>
     * InkPicture controls inherited Invalidated and Paint events.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {VARIANT_BOOL} AutoRedraw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_autoredraw
     */
    put_AutoRedraw(AutoRedraw) {
        result := ComCall(18, this, "short", AutoRedraw, "HRESULT")
        return result
    }

    /**
     * Gets a value that specifies whether ink is currently being drawn on an ink collector (InkCollector, InkOverlay, or InkPicture).
     * @remarks
     * 
     * You can use the <b>CollectingInk</b> property to see if ink is being drawn on an ink collector rather than monitoring the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-stroke">Stroke</a> event.
     * 
     * <div class="alert"><b>Note</b>  Because ink collection is happening on a different thread than your application code, it is possible that the <b>CollectingInk</b> property can change soon after you have checked it. Thus, your code may be operating under the assumption that the ink collector is not collecting ink, when in fact it is. If this occurs, an error is thrown. To be safe, put such code in a try-catch block.</div>
     * <div> </div>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_collectingink
     */
    get_CollectingInk() {
        result := ComCall(19, this, "short*", &Collecting := 0, "HRESULT")
        return Collecting
    }

    /**
     * Gets or sets the collection mode that determines whether ink, gesture, or both are recognized as the user writes.
     * @remarks
     * 
     * For a list of the modes that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkCollectionMode</a> enumeration type. However, when using the <b>CollectionMode</b> property on a system that has the Microsoft Windows XP Tablet PC Edition Software Development Kit (SDK) installed but that doesn't have recognizer installed, the mode cannot be set to <b>GestureOnly</b> or <b>InkAndGesture</b>.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control generates an error if you try to change the <b>CollectionMode</b> property while ink is being collected. To avoid this conflict, check the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_collectingink">CollectingInk</a> property before changing the <b>CollectionMode</b> property.</div>
     * <div> </div>
     * The following behaviors occur for each of the <b>CollectionMode</b> values:
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkOnly</a> mode
     * 
     * <ul>
     * <li>Only ink is collected; gestures are not.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event interest is set to <b>FALSE</b> (all other event interests remain as they were).</li>
     * </ul>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">GestureOnly</a> mode
     * 
     * <ul>
     * <li>Only gestures are collected; ink is not. The strokes are deleted after they are sent to the gesture recognizer.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event interest is set to <b>TRUE</b> (all other event interests remain as they were).</li>
     * <li>The ink collector does not fire the following stroke and packet related events: the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-cursordown">CursorDown</a>, <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-stroke">Stroke</a>, <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-newpackets">NewPackets</a>, and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-newinairpackets">NewInAirPackets</a> events.</li>
     * <li>Cursor events fire.</li>
     * <li>Ink is always deleted.</li>
     * </ul>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkAndGesture</a> mode
     * 
     * <ul>
     * <li>Both ink and gestures are collected.</li>
     * <li>Only single-stroke gestures are recognized.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event interest is set to <b>TRUE</b> (all other event interests remain as they were).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event fires first, allowing you to accept or cancel the gesture. To cancel the gesture, set the <i>Cancel</i> parameter to <b>TRUE</b>. Canceling the gesture forces the ink collector to collect the ink.</li>
     * </ul>
     * Changing the collection mode does not alter the status of individual gestures.
     * 
     * Unwanted behavior might occur when <b>CollectionMode</b> is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkAndGesture</a> and an object's/control's interest in a known gesture is set (by calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setgesturestatus">SetGestureStatus</a> method). If you draw ink that looks something like the known gesture and the known gesture is in the recognizer's list of alternates, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event fires and ink disappears, even if the gesture is not the top alternate. To prevent the ink from disappearing and cancel collection of the gesture, set the <i>Cancel</i> parameter to <b>TRUE</b> if the event is one that you have no interest in.
     * 
     * When <b>CollectionMode</b> is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">GestureOnly</a>, the timeout between when a user adds a gesture and when the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event occurs is a fixed value that cannot be altered programmatically. Gesture recognition is faster in <b>InkAndGesture</b> mode. To prevent the collection of ink while in <b>InkAndGesture</b> mode, you can:
     * 
     * <ol>
     * <li>Set the <b>CollectionMode</b> property to <b>InkAndGesture</b>.</li>
     * <li>In the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-stroke">Stroke</a> event, delete the stroke.</li>
     * <li>In the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event, process the gesture.</li>
     * <li>Set <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_dynamicrendering">DynamicRendering</a> to <b>FALSE</b> to prevent the flow of ink while gesturing.</li>
     * </ol>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_collectionmode
     */
    get_CollectionMode() {
        result := ComCall(20, this, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * Gets or sets the collection mode that determines whether ink, gesture, or both are recognized as the user writes.
     * @remarks
     * 
     * For a list of the modes that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkCollectionMode</a> enumeration type. However, when using the <b>CollectionMode</b> property on a system that has the Microsoft Windows XP Tablet PC Edition Software Development Kit (SDK) installed but that doesn't have recognizer installed, the mode cannot be set to <b>GestureOnly</b> or <b>InkAndGesture</b>.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control generates an error if you try to change the <b>CollectionMode</b> property while ink is being collected. To avoid this conflict, check the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_collectingink">CollectingInk</a> property before changing the <b>CollectionMode</b> property.</div>
     * <div> </div>
     * The following behaviors occur for each of the <b>CollectionMode</b> values:
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkOnly</a> mode
     * 
     * <ul>
     * <li>Only ink is collected; gestures are not.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event interest is set to <b>FALSE</b> (all other event interests remain as they were).</li>
     * </ul>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">GestureOnly</a> mode
     * 
     * <ul>
     * <li>Only gestures are collected; ink is not. The strokes are deleted after they are sent to the gesture recognizer.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event interest is set to <b>TRUE</b> (all other event interests remain as they were).</li>
     * <li>The ink collector does not fire the following stroke and packet related events: the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-cursordown">CursorDown</a>, <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-stroke">Stroke</a>, <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-newpackets">NewPackets</a>, and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-newinairpackets">NewInAirPackets</a> events.</li>
     * <li>Cursor events fire.</li>
     * <li>Ink is always deleted.</li>
     * </ul>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkAndGesture</a> mode
     * 
     * <ul>
     * <li>Both ink and gestures are collected.</li>
     * <li>Only single-stroke gestures are recognized.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event interest is set to <b>TRUE</b> (all other event interests remain as they were).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event fires first, allowing you to accept or cancel the gesture. To cancel the gesture, set the <i>Cancel</i> parameter to <b>TRUE</b>. Canceling the gesture forces the ink collector to collect the ink.</li>
     * </ul>
     * Changing the collection mode does not alter the status of individual gestures.
     * 
     * Unwanted behavior might occur when <b>CollectionMode</b> is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkAndGesture</a> and an object's/control's interest in a known gesture is set (by calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setgesturestatus">SetGestureStatus</a> method). If you draw ink that looks something like the known gesture and the known gesture is in the recognizer's list of alternates, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event fires and ink disappears, even if the gesture is not the top alternate. To prevent the ink from disappearing and cancel collection of the gesture, set the <i>Cancel</i> parameter to <b>TRUE</b> if the event is one that you have no interest in.
     * 
     * When <b>CollectionMode</b> is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">GestureOnly</a>, the timeout between when a user adds a gesture and when the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event occurs is a fixed value that cannot be altered programmatically. Gesture recognition is faster in <b>InkAndGesture</b> mode. To prevent the collection of ink while in <b>InkAndGesture</b> mode, you can:
     * 
     * <ol>
     * <li>Set the <b>CollectionMode</b> property to <b>InkAndGesture</b>.</li>
     * <li>In the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-stroke">Stroke</a> event, delete the stroke.</li>
     * <li>In the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event, process the gesture.</li>
     * <li>Set <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_dynamicrendering">DynamicRendering</a> to <b>FALSE</b> to prevent the flow of ink while gesturing.</li>
     * </ol>
     * 
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_collectionmode
     */
    put_CollectionMode(Mode) {
        result := ComCall(21, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * Gets or sets the value that specifies whether ink is rendered as it is drawn.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_dynamicrendering
     */
    get_DynamicRendering() {
        result := ComCall(22, this, "short*", &Enabled := 0, "HRESULT")
        return Enabled
    }

    /**
     * Gets or sets the value that specifies whether ink is rendered as it is drawn.
     * @param {VARIANT_BOOL} Enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_dynamicrendering
     */
    put_DynamicRendering(Enabled) {
        result := ComCall(23, this, "short", Enabled, "HRESULT")
        return result
    }

    /**
     * Gets or sets the desired packet description of the InkCollector.
     * @remarks
     * 
     * The description is an array of globally unique identifiers (GUIDs) from the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketProperty</a> object.
     * 
     * In multitablet mode, this is the packet description for all of the tablet devices. If any of the devices don't support a known packet description property, the property data is not returned.
     * 
     * By default, <b>DesiredPacketDescription</b> contains <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">STR_GUID_X</a>, STR_GUID_Y, and STR_GUID_NORMALPRESSURE from the PacketProperty object. If you set <b>DesiredPacketDescription</b> to anything else, STR_GUID_BUTTONPRESSURE only for example, STR_GUID_X and STR_GUID_Y is also added-a get of <b>DesiredPacketDescription</b> returns {X,Y,ButtonPressure} and not {ButtonPressure}.
     * 
     * When <b>DesiredPacketDescription</b> is set to something that includes <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">STR_GUID_PAKETSTATUS</a>, the packet status is added in the third position. For example, if you set <b>DesiredPacketDescription</b> to (a, b, c, d, PacketStatus, e, f), when you get <b>DesiredPacketDescription</b> the result is (X, Y, PacketStatus, a, b, c, d, e, f).
     * 
     * Changes to this property do not affect incoming packet data until the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property changes from <b>FALSE</b> to <b>TRUE</b>.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_desiredpacketdescription
     */
    get_DesiredPacketDescription() {
        PacketGuids := VARIANT()
        result := ComCall(24, this, "ptr", PacketGuids, "HRESULT")
        return PacketGuids
    }

    /**
     * Gets or sets the desired packet description of the InkCollector.
     * @remarks
     * 
     * The description is an array of globally unique identifiers (GUIDs) from the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketProperty</a> object.
     * 
     * In multitablet mode, this is the packet description for all of the tablet devices. If any of the devices don't support a known packet description property, the property data is not returned.
     * 
     * By default, <b>DesiredPacketDescription</b> contains <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">STR_GUID_X</a>, STR_GUID_Y, and STR_GUID_NORMALPRESSURE from the PacketProperty object. If you set <b>DesiredPacketDescription</b> to anything else, STR_GUID_BUTTONPRESSURE only for example, STR_GUID_X and STR_GUID_Y is also added-a get of <b>DesiredPacketDescription</b> returns {X,Y,ButtonPressure} and not {ButtonPressure}.
     * 
     * When <b>DesiredPacketDescription</b> is set to something that includes <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">STR_GUID_PAKETSTATUS</a>, the packet status is added in the third position. For example, if you set <b>DesiredPacketDescription</b> to (a, b, c, d, PacketStatus, e, f), when you get <b>DesiredPacketDescription</b> the result is (X, Y, PacketStatus, a, b, c, d, e, f).
     * 
     * Changes to this property do not affect incoming packet data until the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property changes from <b>FALSE</b> to <b>TRUE</b>.
     * 
     * 
     * @param {VARIANT} PacketGuids 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_desiredpacketdescription
     */
    put_DesiredPacketDescription(PacketGuids) {
        result := ComCall(25, this, "ptr", PacketGuids, "HRESULT")
        return result
    }

    /**
     * Gets or sets the custom mouse icon.
     * @remarks
     * 
     * The [propputref] function can accept a <b>NULL</b> reference, in which case S_OK is returned.
     * 
     * This property provides a custom icon that is used when the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_mousepointer">MousePointer</a> property is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Custom</a>.
     * 
     * You can use the <b>MouseIcon</b> property to load either cursor or icon files. The <b>MouseIcon</b> property provides your application with access to custom cursors of any size with any desired hot spot location.
     * 
     * 
     * @returns {IPictureDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_mouseicon
     */
    get_MouseIcon() {
        result := ComCall(26, this, "ptr*", &MouseIcon := 0, "HRESULT")
        return IPictureDisp(MouseIcon)
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     */
    put_MouseIcon(MouseIcon) {
        result := ComCall(27, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-putref_mouseicon
     */
    putref_MouseIcon(MouseIcon) {
        result := ComCall(28, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the type of mouse pointer that appears.
     * @remarks
     * 
     * If you set the <b>MousePointer</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Default</a>, the mouse cursor setting is based on the current cursor's drawing attributes. If the ink collector is disabled, the mouse cursor setting is based on the underlying windows mouse cursor <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property. If the <b>MousePointer</b> property is set to <b>IMP_Custom</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_mouseicon">MouseIcon</a> property is <b>NULL</b>, then the ink collector no longer handles mouse cursor settings. Setting the mouse cursor to any other setting (other than the <b>MousePointer</b> property set to <b>IMP_Default</b> and the <b>MouseIcon</b> property set to <b>NULL</b>) forces the mouse cursor to use the current setting.
     * 
     * You can use this property when you want to indicate changes in functionality as the mouse pointer passes over controls on a form or dialog box. The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Hourglass</a> setting is useful for indicating that the user should wait for a process or operation to finish.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_mousepointer
     */
    get_MousePointer() {
        result := ComCall(29, this, "int*", &MousePointer := 0, "HRESULT")
        return MousePointer
    }

    /**
     * Gets or sets a value that indicates the type of mouse pointer that appears.
     * @remarks
     * 
     * If you set the <b>MousePointer</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Default</a>, the mouse cursor setting is based on the current cursor's drawing attributes. If the ink collector is disabled, the mouse cursor setting is based on the underlying windows mouse cursor <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property. If the <b>MousePointer</b> property is set to <b>IMP_Custom</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_mouseicon">MouseIcon</a> property is <b>NULL</b>, then the ink collector no longer handles mouse cursor settings. Setting the mouse cursor to any other setting (other than the <b>MousePointer</b> property set to <b>IMP_Default</b> and the <b>MouseIcon</b> property set to <b>NULL</b>) forces the mouse cursor to use the current setting.
     * 
     * You can use this property when you want to indicate changes in functionality as the mouse pointer passes over controls on a form or dialog box. The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Hourglass</a> setting is useful for indicating that the user should wait for a process or operation to finish.
     * 
     * 
     * @param {Integer} MousePointer 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_mousepointer
     */
    put_MousePointer(MousePointer) {
        result := ComCall(30, this, "int", MousePointer, "HRESULT")
        return result
    }

    /**
     * Gets the collection of cursors that are available for use in the inking region. Each cursor corresponds to the tip of a pen or other ink input device.
     * @remarks
     * 
     * Cursors are local to an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object.
     * 
     * Any new cursors that the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> encounters are added to the returned collection of cursors, although the returned cursors are not necessarily returned in the order in which the <b>InkCollector</b> encounters them.
     * 
     * When a mouse is enabled as an input device on the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> (when the <i>useMouse</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode">SetAllTabletsMode</a> method is <b>TRUE</b>), the mouse is added to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursors">IInkCursors</a> collection after the <b>InkCollector</b> encounters any other cursor, such as a pen. This is because the pen also acts like a mouse.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-cursorinrange">CursorInRange</a> event is received for the mouse cursor after any other cursor, such as a pen, draws a stroke (which fires the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-stroke">Stroke</a> event).</div>
     * <div> </div>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursors">IInkCursors</a> collection is reset (count set to 0, containing no objects) when:
     * 
     * <ul>
     * <li>The tablet mode is changed (for example, from <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode">SetSingleTabletIntegratedMode</a> to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode">SetAllTabletsMode</a>).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode">SetSingleTabletIntegratedMode</a> method is called.</li>
     * </ul>
     * 
     * 
     * @returns {IInkCursors} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_cursors
     */
    get_Cursors() {
        result := ComCall(31, this, "ptr*", &Cursors := 0, "HRESULT")
        return IInkCursors(Cursors)
    }

    /**
     * Gets or sets the x-axis margin around the window rectangle, in screen coordinates.This margin provides a buffer around the edge of the ink window.
     * @remarks
     * 
     * This property is most commonly used with nonintegrated tablet devices-the buffer gives users a margin of error when writing on a device that may not map 1 to 1 with the screen.
     * 
     * The margin is specified in screen coordinates. A positive margin extends outside the context, a negative margin extends inside the context, and a value of zero produces no margin. Ink is collected if the stroke starts within the margin. This behavior does not clip the ink. The context of the object or control is either the window input rectangle from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-getwindowinputrectangle">GetWindowInputRectangle</a> method or the client rectangle for the window.
     * 
     * The margin is effective only within the application's window. If the pen is applied outside the application's window, then the application loses focus and cannot collect ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> object, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>FALSE</b>. To disable inking in the <b>InkOverlay</b> control, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property to <b>FALSE</b>. You can then set the <b>MarginX</b> property, and re-enable the object or control by setting the <b>Enabled</b> property (or <b>InkEnabled</b> property) to <b>TRUE</b>.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_marginx
     */
    get_MarginX() {
        result := ComCall(32, this, "int*", &MarginX := 0, "HRESULT")
        return MarginX
    }

    /**
     * Gets or sets the x-axis margin around the window rectangle, in screen coordinates.This margin provides a buffer around the edge of the ink window.
     * @remarks
     * 
     * This property is most commonly used with nonintegrated tablet devices-the buffer gives users a margin of error when writing on a device that may not map 1 to 1 with the screen.
     * 
     * The margin is specified in screen coordinates. A positive margin extends outside the context, a negative margin extends inside the context, and a value of zero produces no margin. Ink is collected if the stroke starts within the margin. This behavior does not clip the ink. The context of the object or control is either the window input rectangle from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-getwindowinputrectangle">GetWindowInputRectangle</a> method or the client rectangle for the window.
     * 
     * The margin is effective only within the application's window. If the pen is applied outside the application's window, then the application loses focus and cannot collect ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> object, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>FALSE</b>. To disable inking in the <b>InkOverlay</b> control, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property to <b>FALSE</b>. You can then set the <b>MarginX</b> property, and re-enable the object or control by setting the <b>Enabled</b> property (or <b>InkEnabled</b> property) to <b>TRUE</b>.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} MarginX 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_marginx
     */
    put_MarginX(MarginX) {
        result := ComCall(33, this, "int", MarginX, "HRESULT")
        return result
    }

    /**
     * Gets or sets the y-axis margin around the window rectangle, in screen coordinates.This margin provides a buffer around the edge of the ink window.
     * @remarks
     * 
     * This property is most commonly used with nonintegrated tablet devices-the buffer gives users a margin of error when writing on a device that may not map 1 to 1 with the screen.
     * 
     * The margin is specified in screen coordinates. A positive margin extends outside the context, a negative margin extends inside the context, and a value of zero produces no margin. Ink is collected if the stroke starts within the margin. This behavior does not clip the ink. The context of the object or control is either the window input rectangle from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-getwindowinputrectangle">GetWindowInputRectangle</a> method or the client rectangle for the window.
     * 
     * The margin is effective only within the application's window. If the pen is applied outside the application's window, then the application loses focus and cannot collect ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> object, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>FALSE</b>. To disable inking in the <b>InkOverlay</b> control, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property to <b>FALSE</b>. You can then set the <b>MarginY</b> property, and re-enable the object or control by setting the <b>Enabled</b> property (or <b>InkEnabled</b> property) to <b>TRUE</b>.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_marginy
     */
    get_MarginY() {
        result := ComCall(34, this, "int*", &MarginY := 0, "HRESULT")
        return MarginY
    }

    /**
     * Gets or sets the y-axis margin around the window rectangle, in screen coordinates.This margin provides a buffer around the edge of the ink window.
     * @remarks
     * 
     * This property is most commonly used with nonintegrated tablet devices-the buffer gives users a margin of error when writing on a device that may not map 1 to 1 with the screen.
     * 
     * The margin is specified in screen coordinates. A positive margin extends outside the context, a negative margin extends inside the context, and a value of zero produces no margin. Ink is collected if the stroke starts within the margin. This behavior does not clip the ink. The context of the object or control is either the window input rectangle from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-getwindowinputrectangle">GetWindowInputRectangle</a> method or the client rectangle for the window.
     * 
     * The margin is effective only within the application's window. If the pen is applied outside the application's window, then the application loses focus and cannot collect ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> object, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>FALSE</b>. To disable inking in the <b>InkOverlay</b> control, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property to <b>FALSE</b>. You can then set the <b>MarginY</b> property, and re-enable the object or control by setting the <b>Enabled</b> property (or <b>InkEnabled</b> property) to <b>TRUE</b>.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} MarginY 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_marginy
     */
    put_MarginY(MarginY) {
        result := ComCall(35, this, "int", MarginY, "HRESULT")
        return result
    }

    /**
     * Gets either the IInkTablet object to which a cursor belongs or the IInkTablet object that an object or control is currently using to collect input.
     * @remarks
     * 
     * For an object or control that collects ink, this property is valid only when the object or control is collecting ink from just one tablet. Accessing this property for an object or control that is collecting ink from all tablets generates an exception.
     * 
     * Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.
     * 
     * 
     * @returns {IInkTablet} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_tablet
     */
    get_Tablet() {
        result := ComCall(36, this, "ptr*", &SingleTablet := 0, "HRESULT")
        return IInkTablet(SingleTablet)
    }

    /**
     * Gets or sets a value that specifies whether ink is rendered as just one color when the system is in High Contrast mode.
     * @remarks
     * 
     * This property changes the way ink renders when the system changes to High Contrast mode.
     * 
     * Real-time ink application uses the COLOR_WINDOWTEXT color when the system is in High Contrast mode and the <b>SupportHighContrastInk</b> property is <b>TRUE</b>, but the inherent color of a stroke made under these conditions remains unchanged. For example, if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_color">Color</a> property is set to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB(0,0,255)</a> (blue), the COLOR_WINDOWTEXT color is set to RGB(255,255,255) (white), and the system is in High Contrast mode, then a newly drawn stroke renders in white but the actual stroke color is still blue. For more information about this behavior, see the <b>Color</b> property and the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a> function.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-get_supporthighcontrastink
     */
    get_SupportHighContrastInk() {
        result := ComCall(37, this, "short*", &Support := 0, "HRESULT")
        return Support
    }

    /**
     * Gets or sets a value that specifies whether ink is rendered as just one color when the system is in High Contrast mode.
     * @remarks
     * 
     * This property changes the way ink renders when the system changes to High Contrast mode.
     * 
     * Real-time ink application uses the COLOR_WINDOWTEXT color when the system is in High Contrast mode and the <b>SupportHighContrastInk</b> property is <b>TRUE</b>, but the inherent color of a stroke made under these conditions remains unchanged. For example, if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_color">Color</a> property is set to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB(0,0,255)</a> (blue), the COLOR_WINDOWTEXT color is set to RGB(255,255,255) (white), and the system is in High Contrast mode, then a newly drawn stroke renders in white but the actual stroke color is still blue. For more information about this behavior, see the <b>Color</b> property and the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a> function.
     * 
     * 
     * @param {VARIANT_BOOL} Support 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-put_supporthighcontrastink
     */
    put_SupportHighContrastInk(Support) {
        result := ComCall(38, this, "short", Support, "HRESULT")
        return result
    }

    /**
     * Modifies the interest of the object or control in a known gesture.
     * @param {Integer} Gesture The gesture that you want to set the status of.
     * @param {VARIANT_BOOL} Listen <b>VARIANT_TRUE</b> to indicate that the gesture is being used or <b>VARIANT_FALSE</b> if it is being ignored.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_INVALID_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The InkCollector collection mode must be in gesture mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unsupported gesture.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot allocate memory operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-setgesturestatus
     */
    SetGestureStatus(Gesture, Listen) {
        result := ComCall(39, this, "int", Gesture, "short", Listen, "HRESULT")
        return result
    }

    /**
     * Indicates whether the InkCollector or InkOverlay object is interested in a particular application gesture.
     * @param {Integer} Gesture Sets the gesture that you want the status of.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the InkCollector control has interest in a particular application gesture; otherwise, <b>VARIANT_VALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-getgesturestatus
     */
    GetGestureStatus(Gesture) {
        result := ComCall(40, this, "int", Gesture, "short*", &Listening := 0, "HRESULT")
        return Listening
    }

    /**
     * Gets the window rectangle, in pixels, within which ink is drawn.
     * @param {Pointer<IInkRectangle>} WindowInputRectangle The rectangle, of type <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a>, on which ink is drawn.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The InkRectangle object is not registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurs inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-getwindowinputrectangle
     */
    GetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(41, this, "ptr*", WindowInputRectangle, "HRESULT")
        return result
    }

    /**
     * Sets the window rectangle, in pixels, within which ink is drawn.
     * @param {IInkRectangle} WindowInputRectangle The rectangle, in window coordinates, on which ink is drawn.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rectangle coordinates are invalid (for example, width/height of 0).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_COLLECTOR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot update mappings while in the middle of a stroke.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_OVERLAPPING_INPUT_RECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The window input rectangle overlaps with the window input rectangle of an enabled InkCollector.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-setwindowinputrectangle
     */
    SetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(42, this, "ptr", WindowInputRectangle, "HRESULT")
        return result
    }

    /**
     * Allows an ink collector (InkCollector, InkOverlay, or InkPicture) to collect ink from any tablet attached to the Tablet PC.
     * @param {VARIANT_BOOL} UseMouseForInput <b>VARIANT_TRUE</b> to use the mouse for input; otherwise, <b>VARIANT_FALSE</b>. The default value is <b>VARIANT_TRUE</b>. This parameter is optional.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_COLLECTOR_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot change modes while the InkCollector is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode
     */
    SetAllTabletsMode(UseMouseForInput) {
        result := ComCall(43, this, "short", UseMouseForInput, "HRESULT")
        return result
    }

    /**
     * Allows the ink collector (InkCollector, InkOverlay, or InkPicture) to collect ink from only one tablet. Ink from other tablets is ignored by the ink collector.
     * @param {IInkTablet} Tablet The tablet on which ink is collected, or drawn.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_COLLECTOR_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tablet cannot change modes while the collector is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred while processing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_INCOMPATIBLE_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tablet does not point to a compatible Ink object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode
     */
    SetSingleTabletIntegratedMode(Tablet) {
        result := ComCall(44, this, "ptr", Tablet, "HRESULT")
        return result
    }

    /**
     * Retrieves the interest an object has in a particular event for the InkCollector class, InkOverlay class, or InkPicture class.
     * @param {Integer} EventId The event this method checks the interest of.
     * @returns {VARIANT_BOOL} <b>VARIANT_BOOL</b> if interest in the specified event has been set; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-geteventinterest
     */
    GetEventInterest(EventId) {
        result := ComCall(45, this, "int", EventId, "short*", &Listen := 0, "HRESULT")
        return Listen
    }

    /**
     * Modifies a value that indicates whether an object or control has interest in a specified event.
     * @param {Integer} EventId The event to be listened for.
     * @param {VARIANT_BOOL} Listen <b>VARIANT_TRUE</b> to indicate that the event is being used; <b>VARIANT_FALSE</b> if it is being ignored.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid event interest.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred during processing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkcollector-seteventinterest
     */
    SetEventInterest(EventId, Listen) {
        result := ComCall(46, this, "int", EventId, "short", Listen, "HRESULT")
        return result
    }
}
