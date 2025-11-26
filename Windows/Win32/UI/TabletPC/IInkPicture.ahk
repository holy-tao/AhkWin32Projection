#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkRenderer.ahk
#Include .\IInkDisp.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Ole\IPictureDisp.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkCursors.ahk
#Include .\IInkTablet.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkpicture
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkPicture extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPicture
     * @type {Guid}
     */
    static IID => Guid("{e85662e0-379a-40d7-9b5c-757d233f9923}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_hWnd", "get_DefaultDrawingAttributes", "putref_DefaultDrawingAttributes", "get_Renderer", "putref_Renderer", "get_Ink", "putref_Ink", "get_AutoRedraw", "put_AutoRedraw", "get_CollectingInk", "get_CollectionMode", "put_CollectionMode", "get_DynamicRendering", "put_DynamicRendering", "get_DesiredPacketDescription", "put_DesiredPacketDescription", "get_MouseIcon", "put_MouseIcon", "putref_MouseIcon", "get_MousePointer", "put_MousePointer", "get_EditingMode", "put_EditingMode", "get_Selection", "put_Selection", "get_EraserMode", "put_EraserMode", "get_EraserWidth", "put_EraserWidth", "putref_Picture", "put_Picture", "get_Picture", "put_SizeMode", "get_SizeMode", "put_BackColor", "get_BackColor", "get_Cursors", "get_MarginX", "put_MarginX", "get_MarginY", "put_MarginY", "get_Tablet", "get_SupportHighContrastInk", "put_SupportHighContrastInk", "get_SupportHighContrastSelectionUI", "put_SupportHighContrastSelectionUI", "HitTestSelection", "SetGestureStatus", "GetGestureStatus", "GetWindowInputRectangle", "SetWindowInputRectangle", "SetAllTabletsMode", "SetSingleTabletIntegratedMode", "GetEventInterest", "SetEventInterest", "get_InkEnabled", "put_InkEnabled", "get_Enabled", "put_Enabled"]

    /**
     * @type {Pointer} 
     */
    hWnd {
        get => this.get_hWnd()
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
     * @type {Integer} 
     */
    EditingMode {
        get => this.get_EditingMode()
        set => this.put_EditingMode(value)
    }

    /**
     * @type {IInkStrokes} 
     */
    Selection {
        get => this.get_Selection()
        set => this.put_Selection(value)
    }

    /**
     * @type {Integer} 
     */
    EraserMode {
        get => this.get_EraserMode()
        set => this.put_EraserMode(value)
    }

    /**
     * @type {Integer} 
     */
    EraserWidth {
        get => this.get_EraserWidth()
        set => this.put_EraserWidth(value)
    }

    /**
     * @type {IPictureDisp} 
     */
    Picture {
        get => this.get_Picture()
        set => this.put_Picture(value)
    }

    /**
     * @type {Integer} 
     */
    SizeMode {
        get => this.get_SizeMode()
        set => this.put_SizeMode(value)
    }

    /**
     * @type {Integer} 
     */
    BackColor {
        get => this.get_BackColor()
        set => this.put_BackColor(value)
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
     * @type {VARIANT_BOOL} 
     */
    SupportHighContrastSelectionUI {
        get => this.get_SupportHighContrastSelectionUI()
        set => this.put_SupportHighContrastSelectionUI(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    InkEnabled {
        get => this.get_InkEnabled()
        set => this.put_InkEnabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Gets or sets the handle value of the window on which ink is drawn.
     * @remarks
     * 
     * If two or more windows exist, this property allows you to specify which window collects ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> objects, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>VARIANT_FALSE</b>. You can then set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd">hWnd</a> property and re-enable the object by setting the <b>Enabled</b> property to <b>VARIANT_TRUE</b>.</div>
     * <div> </div>
     * In Automation, this property is called <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd">hWnd Property</a>.
     * 
     * 
     * @returns {Pointer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_hwnd
     */
    get_hWnd() {
        result := ComCall(7, this, "ptr*", &CurrentWindow := 0, "HRESULT")
        return CurrentWindow
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_defaultdrawingattributes
     */
    get_DefaultDrawingAttributes() {
        result := ComCall(8, this, "ptr*", &CurrentAttributes := 0, "HRESULT")
        return IInkDrawingAttributes(CurrentAttributes)
    }

    /**
     * 
     * @param {IInkDrawingAttributes} NewAttributes 
     * @returns {HRESULT} 
     */
    putref_DefaultDrawingAttributes(NewAttributes) {
        result := ComCall(9, this, "ptr", NewAttributes, "HRESULT")
        return result
    }

    /**
     * Gets or sets the InkRenderer object that is used to draw ink.
     * @remarks
     * 
     * When handling certain window messages, changing the <b>Renderer</b> associated with the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> can cause a reentrant function call, generating unexpected results. For example, changing to a different <i>Renderer</i> or modifying its transforms within a message handler can result in a reentrant call. This affects the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). It is an issue with single-threaded apartment model applications.
     * 
     * 
     * @returns {IInkRenderer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_renderer
     */
    get_Renderer() {
        result := ComCall(10, this, "ptr*", &CurrentInkRenderer := 0, "HRESULT")
        return IInkRenderer(CurrentInkRenderer)
    }

    /**
     * 
     * @param {IInkRenderer} NewInkRenderer 
     * @returns {HRESULT} 
     */
    putref_Renderer(NewInkRenderer) {
        result := ComCall(11, this, "ptr", NewInkRenderer, "HRESULT")
        return result
    }

    /**
     * Gets or sets the InkDisp object that is associated with the InkPicture control.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control must be disabled before setting this property. To disable inking in the InkPicture control, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property to <b>FALSE</b>. You can then set the <b>Ink</b> property, and re-enable the control by setting the <b>InkEnabled</b> property to <b>TRUE</b>.</div>
     * <div> </div>
     * For further details about this property, refer to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_ink">Ink</a> property, which has the same functionality.
     * 
     * 
     * @returns {IInkDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_ink
     */
    get_Ink() {
        result := ComCall(12, this, "ptr*", &Ink := 0, "HRESULT")
        return IInkDisp(Ink)
    }

    /**
     * 
     * @param {IInkDisp} NewInk 
     * @returns {HRESULT} 
     */
    putref_Ink(NewInk) {
        result := ComCall(13, this, "ptr", NewInk, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether an ink collectcor repaints the ink when the window is invalidated.
     * @remarks
     * 
     * If <b>AutoRedraw</b> is <b>VARIANT_TRUE</b>, the ink collector repaints the ink when the window is invalidated. For example, if you minimize the window and then restore it, the ink is automatically redrawn. If <b>VARIANT_FALSE</b>, the ink collector does not repaint the ink when the window is invalidated. For example, if you minimize the window and then restore it, the ink disappears from the screen.
     * 
     * When <b>AutoRedraw</b> is <b>VARIANT_FALSE</b>, the ink appears while inking unless the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_dynamicrendering">DynamicRendering</a> property is false.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_autoredraw
     */
    get_AutoRedraw() {
        result := ComCall(14, this, "short*", &AutoRedraw := 0, "HRESULT")
        return AutoRedraw
    }

    /**
     * Gets or sets a value that specifies whether an ink collectcor repaints the ink when the window is invalidated.
     * @remarks
     * 
     * If <b>AutoRedraw</b> is <b>VARIANT_TRUE</b>, the ink collector repaints the ink when the window is invalidated. For example, if you minimize the window and then restore it, the ink is automatically redrawn. If <b>VARIANT_FALSE</b>, the ink collector does not repaint the ink when the window is invalidated. For example, if you minimize the window and then restore it, the ink disappears from the screen.
     * 
     * When <b>AutoRedraw</b> is <b>VARIANT_FALSE</b>, the ink appears while inking unless the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_dynamicrendering">DynamicRendering</a> property is false.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_autoredraw
     */
    put_AutoRedraw(AutoRedraw) {
        result := ComCall(15, this, "short", AutoRedraw, "HRESULT")
        return result
    }

    /**
     * Gets a value that specifies whether ink is currently being drawn on an ink collector (InkCollector, InkOverlay, or InkPicture).
     * @remarks
     * 
     * You can use the <b>CollectingInk</b> property to see if ink is being drawn on an ink collector rather than monitoring the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-stroke">Stroke</a> event.
     * 
     * <div class="alert"><b>Note</b>  Because ink collection is happening on a different thread than your application code, it is possible that the <b>CollectingInk</b> property can change soon after you have checked it. Thus, your code may be operating under the assumption that the ink collector is not collecting ink, when in fact it is. If this occurs, an error is thrown. To be safe, put such code in a try-catch block.</div>
     * <div> </div>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_collectingink
     */
    get_CollectingInk() {
        result := ComCall(16, this, "short*", &Collecting := 0, "HRESULT")
        return Collecting
    }

    /**
     * Gets or sets the collection mode that determines whether ink, gestures, or both are recognized as the user writes.
     * @remarks
     * 
     * For a list of the modes that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkCollectionMode</a> enumeration type.
     * 
     * For further details about this property, refer to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_collectionmode">CollectionMode</a> property, which has the same functionality.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_collectionmode
     */
    get_CollectionMode() {
        result := ComCall(17, this, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * Gets or sets the collection mode that determines whether ink, gestures, or both are recognized as the user writes.
     * @remarks
     * 
     * For a list of the modes that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode">InkCollectionMode</a> enumeration type.
     * 
     * For further details about this property, refer to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_collectionmode">CollectionMode</a> property, which has the same functionality.
     * 
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_collectionmode
     */
    put_CollectionMode(Mode) {
        result := ComCall(18, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * Gets or sets the value that specifies whether ink is rendered as it is drawn.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_dynamicrendering
     */
    get_DynamicRendering() {
        result := ComCall(19, this, "short*", &Enabled := 0, "HRESULT")
        return Enabled
    }

    /**
     * Gets or sets the value that specifies whether ink is rendered as it is drawn.
     * @param {VARIANT_BOOL} Enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_dynamicrendering
     */
    put_DynamicRendering(Enabled) {
        result := ComCall(20, this, "short", Enabled, "HRESULT")
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
     * By default, <b>DesiredPacketDescription</b> contains <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">STR_GUID_X</a>, STR_GUID_Y, and STR_GUID_NORMALPRESSURE from the PacketProperty object. If you set <b>DesiredPacketDescription</b> to anything else, STR_GUID_BUTTONPRESSURE only for example, STR_GUID_X and STR_GUID_Y is also added.  A get of <b>DesiredPacketDescription</b> returns {X,Y,ButtonPressure} and not {ButtonPressure}.
     * 
     * When <b>DesiredPacketDescription</b> is set to something that includes <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">STR_GUID_PAKETSTATUS</a>, the packet status is added in the third position. For example, if you set <b>DesiredPacketDescription</b> to (a, b, c, d, PacketStatus, e, f), when you get <b>DesiredPacketDescription</b> the result is (X, Y, PacketStatus, a, b, c, d, e, f).
     * 
     * Changes to this property do not affect incoming packet data until the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property changes from <b>FALSE</b> to <b>TRUE</b>.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_desiredpacketdescription
     */
    get_DesiredPacketDescription() {
        PacketGuids := VARIANT()
        result := ComCall(21, this, "ptr", PacketGuids, "HRESULT")
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
     * By default, <b>DesiredPacketDescription</b> contains <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">STR_GUID_X</a>, STR_GUID_Y, and STR_GUID_NORMALPRESSURE from the PacketProperty object. If you set <b>DesiredPacketDescription</b> to anything else, STR_GUID_BUTTONPRESSURE only for example, STR_GUID_X and STR_GUID_Y is also added.  A get of <b>DesiredPacketDescription</b> returns {X,Y,ButtonPressure} and not {ButtonPressure}.
     * 
     * When <b>DesiredPacketDescription</b> is set to something that includes <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">STR_GUID_PAKETSTATUS</a>, the packet status is added in the third position. For example, if you set <b>DesiredPacketDescription</b> to (a, b, c, d, PacketStatus, e, f), when you get <b>DesiredPacketDescription</b> the result is (X, Y, PacketStatus, a, b, c, d, e, f).
     * 
     * Changes to this property do not affect incoming packet data until the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property changes from <b>FALSE</b> to <b>TRUE</b>.
     * 
     * 
     * @param {VARIANT} PacketGuids 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_desiredpacketdescription
     */
    put_DesiredPacketDescription(PacketGuids) {
        result := ComCall(22, this, "ptr", PacketGuids, "HRESULT")
        return result
    }

    /**
     * Gets or sets the custom mouse icon.
     * @remarks
     * 
     * The [propputref] function can accept a <b>NULL</b> reference, in which case S_OK is returned.
     * 
     * This property provides a custom icon that is used when the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_mousepointer">MousePointer</a> property is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Custom</a>.
     * 
     * You can use the <b>MouseIcon</b> property to load either cursor or icon files. The <b>MouseIcon</b> property provides your application with access to custom cursors of any size with any desired hot spot location.
     * 
     * 
     * @returns {IPictureDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_mouseicon
     */
    get_MouseIcon() {
        result := ComCall(23, this, "ptr*", &MouseIcon := 0, "HRESULT")
        return IPictureDisp(MouseIcon)
    }

    /**
     * Gets or sets the custom mouse icon.
     * @remarks
     * 
     * The [propputref] function can accept a <b>NULL</b> reference, in which case S_OK is returned.
     * 
     * This property provides a custom icon that is used when the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_mousepointer">MousePointer</a> property is set to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Custom</a>.
     * 
     * You can use the <b>MouseIcon</b> property to load either cursor or icon files. The <b>MouseIcon</b> property provides your application with access to custom cursors of any size with any desired hot spot location.
     * 
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_mouseicon
     */
    put_MouseIcon(MouseIcon) {
        result := ComCall(24, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     */
    putref_MouseIcon(MouseIcon) {
        result := ComCall(25, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the type of mouse pointer that appears.
     * @remarks
     * 
     * If you set the <b>MousePointer</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Default</a>, the mouse cursor setting is based on the current cursor's drawing attributes. If the ink collector is disabled, the mouse cursor setting is based on the underlying windows mouse cursor <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property. If the <b>MousePointer</b> property is set to <b>IMP_Custom</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_mouseicon">MouseIcon</a> property is <b>NULL</b>, then the ink collector no longer handles mouse cursor settings. Setting the mouse cursor to any other setting (other than the <b>MousePointer</b> property set to <b>IMP_Default</b> and the <b>MouseIcon</b> property set to <b>NULL</b>) forces the mouse cursor to use the current setting.
     * 
     * You can use this property when you want to indicate changes in functionality as the mouse pointer passes over controls on a form or dialog box. The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Hourglass</a> setting is useful for indicating that the user should wait for a process or operation to finish.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_mousepointer
     */
    get_MousePointer() {
        result := ComCall(26, this, "int*", &MousePointer := 0, "HRESULT")
        return MousePointer
    }

    /**
     * Gets or sets a value that indicates the type of mouse pointer that appears.
     * @remarks
     * 
     * If you set the <b>MousePointer</b> property to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Default</a>, the mouse cursor setting is based on the current cursor's drawing attributes. If the ink collector is disabled, the mouse cursor setting is based on the underlying windows mouse cursor <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property. If the <b>MousePointer</b> property is set to <b>IMP_Custom</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_mouseicon">MouseIcon</a> property is <b>NULL</b>, then the ink collector no longer handles mouse cursor settings. Setting the mouse cursor to any other setting (other than the <b>MousePointer</b> property set to <b>IMP_Default</b> and the <b>MouseIcon</b> property set to <b>NULL</b>) forces the mouse cursor to use the current setting.
     * 
     * You can use this property when you want to indicate changes in functionality as the mouse pointer passes over controls on a form or dialog box. The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkmousepointer">IMP_Hourglass</a> setting is useful for indicating that the user should wait for a process or operation to finish.
     * 
     * 
     * @param {Integer} MousePointer 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_mousepointer
     */
    put_MousePointer(MousePointer) {
        result := ComCall(27, this, "int", MousePointer, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether the InkPicture control is in ink mode, deletion mode, or selecting/editing mode.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> objects generate an error if you change the <b>EditingMode</b> property while ink is being collected. To avoid this conflict, make sure the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_collectingink">CollectingInk</a> property is <b>FALSE</b> before changing the <b>EditingMode</b> property.
     * 
     * For more information about erasing ink, see <a href="https://docs.microsoft.com/windows/desktop/tablet/erasing-ink-with-the-pen">Erasing Ink with the Pen</a>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_editingmode
     */
    get_EditingMode() {
        result := ComCall(28, this, "int*", &EditingMode := 0, "HRESULT")
        return EditingMode
    }

    /**
     * Gets or sets a value that specifies whether the InkPicture control is in ink mode, deletion mode, or selecting/editing mode.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> objects generate an error if you change the <b>EditingMode</b> property while ink is being collected. To avoid this conflict, make sure the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_collectingink">CollectingInk</a> property is <b>FALSE</b> before changing the <b>EditingMode</b> property.
     * 
     * For more information about erasing ink, see <a href="https://docs.microsoft.com/windows/desktop/tablet/erasing-ink-with-the-pen">Erasing Ink with the Pen</a>.
     * 
     * 
     * @param {Integer} EditingMode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_editingmode
     */
    put_EditingMode(EditingMode) {
        result := ComCall(29, this, "int", EditingMode, "HRESULT")
        return result
    }

    /**
     * Gets or sets theInkStrokes collection that is currently selected inside the InkOverlay object or the InkPicture control.
     * @remarks
     * 
     * For further details about this property, refer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_selection">Selection Property</a> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay Class</a>, which has the same functionality.
     * 
     * 
     * @returns {IInkStrokes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_selection
     */
    get_Selection() {
        result := ComCall(30, this, "ptr*", &Selection := 0, "HRESULT")
        return IInkStrokes(Selection)
    }

    /**
     * Gets or sets theInkStrokes collection that is currently selected inside the InkOverlay object or the InkPicture control.
     * @remarks
     * 
     * For further details about this property, refer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_selection">Selection Property</a> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay Class</a>, which has the same functionality.
     * 
     * 
     * @param {IInkStrokes} Selection 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_selection
     */
    put_Selection(Selection) {
        result := ComCall(31, this, "ptr", Selection, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether ink is erased by stroke or by point.
     * @remarks
     * 
     * This property applies only when the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_editingmode">EditingMode</a> property is set to Delete.
     * 
     * For further details about this property, refer to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_erasermode">EraserMode</a> property, which has the same functionality.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_erasermode
     */
    get_EraserMode() {
        result := ComCall(32, this, "int*", &EraserMode := 0, "HRESULT")
        return EraserMode
    }

    /**
     * Gets or sets a value that specifies whether ink is erased by stroke or by point.
     * @remarks
     * 
     * This property applies only when the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_editingmode">EditingMode</a> property is set to Delete.
     * 
     * For further details about this property, refer to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_erasermode">EraserMode</a> property, which has the same functionality.
     * 
     * 
     * @param {Integer} EraserMode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_erasermode
     */
    put_EraserMode(EraserMode) {
        result := ComCall(33, this, "int", EraserMode, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies the width of the eraser pen tip.
     * @remarks
     * 
     * The value specifies the width of the eraser pen tip in ink space units.
     * 
     * You cannot assign negative values to this property.
     * 
     * This property applies only when the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_editingmode">EditingMode</a> property is set to <b>IOEM_Delete</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_erasermode">EraserMode</a> property is set to <b>IOERM_PointErase</b>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_eraserwidth
     */
    get_EraserWidth() {
        result := ComCall(34, this, "int*", &EraserWidth := 0, "HRESULT")
        return EraserWidth
    }

    /**
     * Gets or sets a value that specifies the width of the eraser pen tip.
     * @remarks
     * 
     * The value specifies the width of the eraser pen tip in ink space units.
     * 
     * You cannot assign negative values to this property.
     * 
     * This property applies only when the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_editingmode">EditingMode</a> property is set to <b>IOEM_Delete</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_erasermode">EraserMode</a> property is set to <b>IOERM_PointErase</b>.
     * 
     * 
     * @param {Integer} newEraserWidth 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_eraserwidth
     */
    put_EraserWidth(newEraserWidth) {
        result := ComCall(35, this, "int", newEraserWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPictureDisp} pPicture 
     * @returns {HRESULT} 
     */
    putref_Picture(pPicture) {
        result := ComCall(36, this, "ptr", pPicture, "HRESULT")
        return result
    }

    /**
     * Gets the graphics file to appear on the InkPicture control.
     * @param {IPictureDisp} pPicture 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_picture
     */
    put_Picture(pPicture) {
        result := ComCall(37, this, "ptr", pPicture, "HRESULT")
        return result
    }

    /**
     * Gets the graphics file to appear on the InkPicture control.
     * @returns {IPictureDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_picture
     */
    get_Picture() {
        result := ComCall(38, this, "ptr*", &ppPicture := 0, "HRESULT")
        return IPictureDisp(ppPicture)
    }

    /**
     * Gets or sets how the InkPicture control handles image placement and sizing.
     * @remarks
     * 
     * Valid values for this property are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpicturesizemode">InkPictureSizeMode</a> enumeration. By default, in <b>IPSM_Normal</b> mode, the picture is positioned in the upper-left corner of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control, and any part of the image too big for the InkPicture control is clipped. Using the <b>IPSM_StretchImage</b> value causes the picture to stretch to fit the control.
     * 
     * 
     * 
     * Using the <b>IPSM_AutoSize</b> value causes the control to resize to always fit the picture. Using the <b>IPSM_CenterImage</b> value causes the picture to be centered in the control.
     * 
     * 
     * @param {Integer} smNewSizeMode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_sizemode
     */
    put_SizeMode(smNewSizeMode) {
        result := ComCall(39, this, "int", smNewSizeMode, "HRESULT")
        return result
    }

    /**
     * Gets or sets how the InkPicture control handles image placement and sizing.
     * @remarks
     * 
     * Valid values for this property are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpicturesizemode">InkPictureSizeMode</a> enumeration. By default, in <b>IPSM_Normal</b> mode, the picture is positioned in the upper-left corner of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control, and any part of the image too big for the InkPicture control is clipped. Using the <b>IPSM_StretchImage</b> value causes the picture to stretch to fit the control.
     * 
     * 
     * 
     * Using the <b>IPSM_AutoSize</b> value causes the control to resize to always fit the picture. Using the <b>IPSM_CenterImage</b> value causes the picture to be centered in the control.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_sizemode
     */
    get_SizeMode() {
        result := ComCall(40, this, "int*", &smSizeMode := 0, "HRESULT")
        return smSizeMode
    }

    /**
     * Gets or sets the background color for the InkPicture control.
     * @param {Integer} newColor 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_backcolor
     */
    put_BackColor(newColor) {
        result := ComCall(41, this, "uint", newColor, "HRESULT")
        return result
    }

    /**
     * Gets or sets the background color for the InkPicture control.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_backcolor
     */
    get_BackColor() {
        result := ComCall(42, this, "uint*", &pColor := 0, "HRESULT")
        return pColor
    }

    /**
     * Gets the collection of cursors that are available for use in the inking region. Each cursor corresponds to the tip of a pen or other ink input device.
     * @remarks
     * 
     * Cursors are local to an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object.
     * 
     * Any new cursors that the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> encounters are added to the returned collection of cursors, although the returned cursors are not necessarily returned in the order in which the <b>InkCollector</b> encounters them.
     * 
     * When a mouse is enabled as an input device on the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> (when the <i>useMouse</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setalltabletsmode">SetAllTabletsMode</a> method is <b>TRUE</b>), the mouse is added to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursors">IInkCursors</a> collection after the <b>InkCollector</b> encounters any other cursor, such as a pen. This is because the pen also acts like a mouse.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-cursorinrange">CursorInRange</a> event is received for the mouse cursor after any other cursor, such as a pen, draws a stroke (which fires the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-stroke">Stroke</a> event).</div>
     * <div> </div>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursors">IInkCursors</a> collection is reset (count set to 0, containing no objects) when:
     * 
     * <ul>
     * <li>The tablet mode is changed (for example, from <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setsingletabletintegratedmode">SetSingleTabletIntegratedMode</a> to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setalltabletsmode">SetAllTabletsMode</a>).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setsingletabletintegratedmode">SetSingleTabletIntegratedMode</a> method is called.</li>
     * </ul>
     * 
     * 
     * @returns {IInkCursors} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_cursors
     */
    get_Cursors() {
        result := ComCall(43, this, "ptr*", &Cursors := 0, "HRESULT")
        return IInkCursors(Cursors)
    }

    /**
     * Gets or sets the x-axis margin around the window rectangle, in screen coordinates.This margin provides a buffer around the edge of the ink window.
     * @remarks
     * 
     * This property is most commonly used with nonintegrated tablet devices-the buffer gives users a margin of error when writing on a device that may not map 1 to 1 with the screen.
     * 
     * The margin is specified in screen coordinates. A positive margin extends outside the context, a negative margin extends inside the context, and a value of zero produces no margin. Ink is collected if the stroke starts within the margin. This behavior does not clip the ink. The context of the object or control is either the window input rectangle from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-getwindowinputrectangle">GetWindowInputRectangle</a> method or the client rectangle for the window.
     * 
     * The margin is effective only within the application's window. If the pen is applied outside the application's window, then the application loses focus and cannot collect ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> object, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property to <b>FALSE</b>. To disable inking in the <b>InkOverlay</b> control, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property to <b>FALSE</b>. You can then set the <b>MarginX</b> property, and re-enable the object or control by setting the <b>Enabled</b> property (or <b>InkEnabled</b> property) to <b>TRUE</b>.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_marginx
     */
    get_MarginX() {
        result := ComCall(44, this, "int*", &MarginX := 0, "HRESULT")
        return MarginX
    }

    /**
     * Gets or sets the x-axis margin around the window rectangle, in screen coordinates.This margin provides a buffer around the edge of the ink window.
     * @remarks
     * 
     * This property is most commonly used with nonintegrated tablet devices-the buffer gives users a margin of error when writing on a device that may not map 1 to 1 with the screen.
     * 
     * The margin is specified in screen coordinates. A positive margin extends outside the context, a negative margin extends inside the context, and a value of zero produces no margin. Ink is collected if the stroke starts within the margin. This behavior does not clip the ink. The context of the object or control is either the window input rectangle from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-getwindowinputrectangle">GetWindowInputRectangle</a> method or the client rectangle for the window.
     * 
     * The margin is effective only within the application's window. If the pen is applied outside the application's window, then the application loses focus and cannot collect ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> object, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property to <b>FALSE</b>. To disable inking in the <b>InkOverlay</b> control, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property to <b>FALSE</b>. You can then set the <b>MarginX</b> property, and re-enable the object or control by setting the <b>Enabled</b> property (or <b>InkEnabled</b> property) to <b>TRUE</b>.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} MarginX 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_marginx
     */
    put_MarginX(MarginX) {
        result := ComCall(45, this, "int", MarginX, "HRESULT")
        return result
    }

    /**
     * Gets or sets the y-axis margin around the window rectangle, in screen coordinates.This margin provides a buffer around the edge of the ink window.
     * @remarks
     * 
     * This property is most commonly used with nonintegrated tablet devices-the buffer gives users a margin of error when writing on a device that may not map 1 to 1 with the screen.
     * 
     * The margin is specified in screen coordinates. A positive margin extends outside the context, a negative margin extends inside the context, and a value of zero produces no margin. Ink is collected if the stroke starts within the margin. This behavior does not clip the ink. The context of the object or control is either the window input rectangle from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-getwindowinputrectangle">GetWindowInputRectangle</a> method or the client rectangle for the window.
     * 
     * The margin is effective only within the application's window. If the pen is applied outside the application's window, then the application loses focus and cannot collect ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> object, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property to <b>FALSE</b>. To disable inking in the <b>InkOverlay</b> control, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property to <b>FALSE</b>. You can then set the <b>MarginY</b> property, and re-enable the object or control by setting the <b>Enabled</b> property (or <b>InkEnabled</b> property) to <b>TRUE</b>.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_marginy
     */
    get_MarginY() {
        result := ComCall(46, this, "int*", &MarginY := 0, "HRESULT")
        return MarginY
    }

    /**
     * Gets or sets the y-axis margin around the window rectangle, in screen coordinates.This margin provides a buffer around the edge of the ink window.
     * @remarks
     * 
     * This property is most commonly used with nonintegrated tablet devices-the buffer gives users a margin of error when writing on a device that may not map 1 to 1 with the screen.
     * 
     * The margin is specified in screen coordinates. A positive margin extends outside the context, a negative margin extends inside the context, and a value of zero produces no margin. Ink is collected if the stroke starts within the margin. This behavior does not clip the ink. The context of the object or control is either the window input rectangle from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-getwindowinputrectangle">GetWindowInputRectangle</a> method or the client rectangle for the window.
     * 
     * The margin is effective only within the application's window. If the pen is applied outside the application's window, then the application loses focus and cannot collect ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> object, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property to <b>FALSE</b>. To disable inking in the <b>InkOverlay</b> control, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property to <b>FALSE</b>. You can then set the <b>MarginY</b> property, and re-enable the object or control by setting the <b>Enabled</b> property (or <b>InkEnabled</b> property) to <b>TRUE</b>.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} MarginY 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_marginy
     */
    put_MarginY(MarginY) {
        result := ComCall(47, this, "int", MarginY, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_tablet
     */
    get_Tablet() {
        result := ComCall(48, this, "ptr*", &SingleTablet := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_supporthighcontrastink
     */
    get_SupportHighContrastInk() {
        result := ComCall(49, this, "short*", &Support := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_supporthighcontrastink
     */
    put_SupportHighContrastInk(Support) {
        result := ComCall(50, this, "short", Support, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether all selection user interface (selection bounding box and selection handles) are drawn in high contrast when the system is in High Contrast mode.
     * @remarks
     * 
     * For further details about this property, refer to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_supporthighcontrastselectionui">SupportHighContrastSelectionUI</a> property, which has the same functionality.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_supporthighcontrastselectionui
     */
    get_SupportHighContrastSelectionUI() {
        result := ComCall(51, this, "short*", &Support := 0, "HRESULT")
        return Support
    }

    /**
     * Gets or sets a value that specifies whether all selection user interface (selection bounding box and selection handles) are drawn in high contrast when the system is in High Contrast mode.
     * @remarks
     * 
     * For further details about this property, refer to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_supporthighcontrastselectionui">SupportHighContrastSelectionUI</a> property, which has the same functionality.
     * 
     * 
     * @param {VARIANT_BOOL} Support 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_supporthighcontrastselectionui
     */
    put_SupportHighContrastSelectionUI(Support) {
        result := ComCall(52, this, "short", Support, "HRESULT")
        return result
    }

    /**
     * Retrieves a member of the SelectionHitResult enumeration, which specifies which part of a selection, if any, was hit during a hit test.
     * @remarks
     * 
     * For further details about this method, refer to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-hittestselection">HitTestSelection</a> method, which has the same functionality.
     * 
     * 
     * @param {Integer} x The x-position, in pixels, of the hit test.
     * @param {Integer} y The y-position, in pixels, of the hit test.
     * @returns {Integer} The value from the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-selectionhitresult">SelectionHitResult</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-hittestselection
     */
    HitTestSelection(x, y) {
        result := ComCall(53, this, "int", x, "int", y, "int*", &SelArea := 0, "HRESULT")
        return SelArea
    }

    /**
     * Modifies the interest of the object or control in a known gesture.
     * @param {Integer} Gesture The gesture that you want to set the status of.
     * @param {VARIANT_BOOL} Listen VARIANT_TRUE to indicate that the gesture is being used; VARIANT_FALSE to indicate the gesture is being ignored.
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
     * InkCollector collection mode must be in gesture mode.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-setgesturestatus
     */
    SetGestureStatus(Gesture, Listen) {
        result := ComCall(54, this, "int", Gesture, "short", Listen, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the InkPicture control has interest in a particular application gesture.
     * @param {Integer} Gesture The gesture that you want the status of.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control has interest in the gesture and the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-gesture">Gesture Event</a> fires when the gesture is recognized. <b>VARIANT_FALSE</b> if the InkPicture control has no interest in the gesture, and the strokes that were recognized as a gesture remain as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-getgesturestatus
     */
    GetGestureStatus(Gesture) {
        result := ComCall(55, this, "int", Gesture, "short*", &Listening := 0, "HRESULT")
        return Listening
    }

    /**
     * Retrieves the window rectangle, in pixels, within which ink is drawn.
     * @param {Pointer<IInkRectangle>} WindowInputRectangle Gets the rectangle, of type <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a>, on which ink is drawn.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-getwindowinputrectangle
     */
    GetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(56, this, "ptr*", WindowInputRectangle, "HRESULT")
        return result
    }

    /**
     * Modifies the window rectangle, in pixels, within which ink is drawn.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-setwindowinputrectangle
     */
    SetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(57, this, "ptr", WindowInputRectangle, "HRESULT")
        return result
    }

    /**
     * Allows an ink collector (InkCollector, InkOverlay, or InkPicture) to collect ink from any tablet attached to the Tablet PC.
     * @param {VARIANT_BOOL} UseMouseForInput Optional. <b>VARIANT_TRUE</b> to use the mouse as an input device; otherwise, <b>VARIANT_FALSE. </b>The default value is <b>VARIANT_TRUE</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-setalltabletsmode
     */
    SetAllTabletsMode(UseMouseForInput) {
        result := ComCall(58, this, "short", UseMouseForInput, "HRESULT")
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
     * Cannot change modes while the collector is enabled.
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
     * <i>tablet</i> does not point to a compatible Ink object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-setsingletabletintegratedmode
     */
    SetSingleTabletIntegratedMode(Tablet) {
        result := ComCall(59, this, "ptr", Tablet, "HRESULT")
        return result
    }

    /**
     * Retrieves the interest an object has in a particular event for the InkCollector class, InkOverlay class, or InkPicture class.
     * @param {Integer} EventId The event about which the ink collector specifies the interest level.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if interest in the specified event has been sent; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-geteventinterest
     */
    GetEventInterest(EventId) {
        result := ComCall(60, this, "int", EventId, "short*", &Listen := 0, "HRESULT")
        return Listen
    }

    /**
     * Modifies a value that indicates whether an object or control has interest in a specified event.
     * @param {Integer} EventId The event to be listened for. Possible values for <i>eventID</i> appear in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectoreventinterest">InkCollectorEventInterest</a> enumeration type.
     * @param {VARIANT_BOOL} Listen <b>VARIANT_TRUE</b> to indicate the event is being used; <b>VARIANT_FALSE</b> to indicate the event is being ignored.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-seteventinterest
     */
    SetEventInterest(EventId, Listen) {
        result := ComCall(61, this, "int", EventId, "short", Listen, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that specifies whether the InkPicture control collects pen input (in-air packets, cursor in range events, and so on).
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control">InkPicture</a> control collects ink in Windows Vista, Microsoft Windows XP Tablet PC Edition or any edition of Windows 2000, Windows Server 2003, or Windows XP on which the Windows XP Tablet PC Edition Software Development Kit (SDK) is installed. However, handwriting recognition occurs only if Windows Vista, Windows XP Tablet PC Edition, or the Recognizer Pack is installed.
     * 
     * In any edition of Windows 2000, Windows Server 2003, or of Windows XP other than Windows XP Tablet PC Edition, the <b>InkEnabled</b> property is always <b>FALSE</b> if the Tablet PC SDK is not installed.
     * 
     * If the window input rectangle of an enabled object (set in the constructor or with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setwindowinputrectangle">SetWindowInputRectangle Method</a>) overlaps the window input rectangle of another enabled object, the E_INK_OVERLAPPING_INPUT_RECT error is returned.
     * 
     * <div class="alert"><b>Note</b>  Overlap can occur without an error as long as only one of the input rectangles is enabled at any time.</div>
     * <div> </div>
     * While the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control is not enabled, you receive no events.
     * 
     * When the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property of a container <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control is set to <b>VARIANT_FALSE</b>, all of its contained controls are disabled as well.
     * 
     * You cannot set this property to <b>VARIANT_FALSE</b> while the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control is collecting ink (the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_collectingink">CollectingInk Property</a> property is <b>VARIANT_TRUE</b>).
     * 
     * For best results, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property to <b>VARIANT_FALSE</b> when an application shuts down.
     * 
     * This property must be set to <b>VARIANT_FALSE</b> before setting or calling specific properties and methods of the control. If you try to change the specified properties or call the specified methods, an error occurs. The following properties and methods cannot be set or called unless the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property is first set to <b>VARIANT_FALSE</b>:
     * 
     * <ol>
     * <li>Properties:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_ink">Ink</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_marginx">MarginX Property</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_marginy">MarginY Property</a>
     * </li>
     * </ul>
     * </li>
     * <li>Methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setalltabletsmode">SetAllTabletsMode Method</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setsingletabletintegratedmode">SetSingleTabletIntegratedMode Method</a>
     * </li>
     * </ul>
     * </li>
     * </ol>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_inkenabled
     */
    get_InkEnabled() {
        result := ComCall(62, this, "short*", &Collecting := 0, "HRESULT")
        return Collecting
    }

    /**
     * Gets or sets a value that specifies whether the InkPicture control collects pen input (in-air packets, cursor in range events, and so on).
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control">InkPicture</a> control collects ink in Windows Vista, Microsoft Windows XP Tablet PC Edition or any edition of Windows 2000, Windows Server 2003, or Windows XP on which the Windows XP Tablet PC Edition Software Development Kit (SDK) is installed. However, handwriting recognition occurs only if Windows Vista, Windows XP Tablet PC Edition, or the Recognizer Pack is installed.
     * 
     * In any edition of Windows 2000, Windows Server 2003, or of Windows XP other than Windows XP Tablet PC Edition, the <b>InkEnabled</b> property is always <b>FALSE</b> if the Tablet PC SDK is not installed.
     * 
     * If the window input rectangle of an enabled object (set in the constructor or with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setwindowinputrectangle">SetWindowInputRectangle Method</a>) overlaps the window input rectangle of another enabled object, the E_INK_OVERLAPPING_INPUT_RECT error is returned.
     * 
     * <div class="alert"><b>Note</b>  Overlap can occur without an error as long as only one of the input rectangles is enabled at any time.</div>
     * <div> </div>
     * While the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control is not enabled, you receive no events.
     * 
     * When the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property of a container <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control is set to <b>VARIANT_FALSE</b>, all of its contained controls are disabled as well.
     * 
     * You cannot set this property to <b>VARIANT_FALSE</b> while the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control is collecting ink (the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_collectingink">CollectingInk Property</a> property is <b>VARIANT_TRUE</b>).
     * 
     * For best results, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property to <b>VARIANT_FALSE</b> when an application shuts down.
     * 
     * This property must be set to <b>VARIANT_FALSE</b> before setting or calling specific properties and methods of the control. If you try to change the specified properties or call the specified methods, an error occurs. The following properties and methods cannot be set or called unless the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_enabled">Enabled</a> property is first set to <b>VARIANT_FALSE</b>:
     * 
     * <ol>
     * <li>Properties:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_ink">Ink</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_marginx">MarginX Property</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_marginy">MarginY Property</a>
     * </li>
     * </ul>
     * </li>
     * <li>Methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setalltabletsmode">SetAllTabletsMode Method</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-setsingletabletintegratedmode">SetSingleTabletIntegratedMode Method</a>
     * </li>
     * </ul>
     * </li>
     * </ol>
     * 
     * 
     * @param {VARIANT_BOOL} Collecting 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_inkenabled
     */
    put_InkEnabled(Collecting) {
        result := ComCall(63, this, "short", Collecting, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that determines whether the InkPicture control can respond to user-generated events.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This property is not the same as the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> objects. This property is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property.</div>
     * <div> </div>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-get_enabled
     */
    get_Enabled() {
        result := ComCall(64, this, "short*", &pbool := 0, "HRESULT")
        return pbool
    }

    /**
     * Gets or sets a value that determines whether the InkPicture control can respond to user-generated events.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This property is not the same as the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> objects. This property is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkpicture-get_inkenabled">InkEnabled</a> property.</div>
     * <div> </div>
     * 
     * 
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkpicture-put_enabled
     */
    put_Enabled(vbool) {
        result := ComCall(65, this, "short", vbool, "HRESULT")
        return result
    }
}
