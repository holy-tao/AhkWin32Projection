#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IInkDrawingAttributes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Displays the tablet pen data in real-time as that data is being handled by the RealTimeStylus Class object.
 * @remarks
 * 
 * This interface is implemented by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a>.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a> renders packet data dynamically.
 * 
 * Be sure the set the handle of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a> before you add it to a plug-in collection on the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a>. If the handle is not set, the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-error">IStylusPlugin::Error Method</a> notification method on each plug-in is called. For more information see <a href="https://docs.microsoft.com/windows/desktop/tablet/error-handling-considerations-for-the-stylusinput-apis">Error Handling Considerations for the StylusInput APIs</a>.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a> implements the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylussyncplugin">IStylusSyncPlugin</a> interface.
 * 
 * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a> object can redraw the ink when a window has been invalidated.
 * 
 * While it is possible to have a given plug-in associated with multiple <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> objects, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a> plug-ins are not designed to support this.
 * 
 * <div class="alert"><b>Note</b>  Calling interface members directly without the intervention of a <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> instance is not supported.</div>
 * <div> </div>
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a> has two categories of properties: those for which changes take effect immediately and those for which changes take effect upon the next <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusdown">IStylusPlugin::StylusDown Method</a> event notification. The <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-get_cliprectangle">IDynamicRenderer::ClipRectangle Property</a> property takes effect immediately, enabling the text input area to grow dynamically as the user writes. The other properties take effect after the next <b>IStylusPlugin::StylusDown Method</b> event notification.
 * 
 * The following are the properties for which changes take immediate effect:
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-get_cliprectangle">IDynamicRenderer::ClipRectangle Property</a>
 * 
 * 
 * The following are the properties for which changes do not take immediate effect and are delayed:
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-get_datacacheenabled">IDynamicRenderer::DataCacheEnabled Property</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-get_drawingattributes">IDynamicRenderer::DrawingAttributes Property</a>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-idynamicrenderer
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IDynamicRenderer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDynamicRenderer
     * @type {Guid}
     */
    static IID => Guid("{a079468e-7165-46f9-b7af-98ad01a93009}")

    /**
     * The class identifier for DynamicRenderer
     * @type {Guid}
     */
    static CLSID => Guid("{ecd32aea-746f-4dcb-bf68-082757faff18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Enabled", "put_Enabled", "get_HWND", "put_HWND", "get_ClipRectangle", "put_ClipRectangle", "get_ClipRegion", "put_ClipRegion", "get_DrawingAttributes", "putref_DrawingAttributes", "get_DataCacheEnabled", "put_DataCacheEnabled", "ReleaseCachedData", "Refresh", "Draw"]

    /**
     * @type {BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {HANDLE_PTR} 
     */
    HWND {
        get => this.get_HWND()
        set => this.put_HWND(value)
    }

    /**
     * @type {RECT} 
     */
    ClipRectangle {
        get => this.get_ClipRectangle()
        set => this.put_ClipRectangle(value)
    }

    /**
     * @type {HANDLE_PTR} 
     */
    ClipRegion {
        get => this.get_ClipRegion()
        set => this.put_ClipRegion(value)
    }

    /**
     * @type {IInkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
    }

    /**
     * @type {BOOL} 
     */
    DataCacheEnabled {
        get => this.get_DataCacheEnabled()
        set => this.put_DataCacheEnabled(value)
    }

    /**
     * Gets or sets a value that turns dynamic rendering on and off.
     * @remarks
     * 
     * The changes to this property are applied between strokes as they are starting or ending.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-get_enabled
     */
    get_Enabled() {
        result := ComCall(3, this, "int*", &bEnabled := 0, "HRESULT")
        return bEnabled
    }

    /**
     * Gets or sets a value that turns dynamic rendering on and off.
     * @remarks
     * 
     * The changes to this property are applied between strokes as they are starting or ending.
     * 
     * 
     * @param {BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-put_enabled
     */
    put_Enabled(bEnabled) {
        result := ComCall(4, this, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * Gets or sets the window handle, HWND, associated with the DynamicRenderer Class object.
     * @returns {HANDLE_PTR} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-get_hwnd
     */
    get_HWND() {
        result := ComCall(5, this, "ptr*", &hwnd := 0, "HRESULT")
        return hwnd
    }

    /**
     * Gets or sets the window handle, HWND, associated with the DynamicRenderer Class object.
     * @param {HANDLE_PTR} hwnd 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-put_hwnd
     */
    put_HWND(hwnd) {
        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * Gets or sets the clipping rectangle for the DynamicRenderer Class object.
     * @remarks
     * 
     * The <b>ClipRectangle</b> property is set immediately and applies to the stroke that is being drawn. It differs from the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-get_drawingattributes">IDynamicRenderer::DrawingAttributes Property</a> property, which applies to the next stroke drawn. This allows the clip rectangle to grow as the stroke is drawn.
     * 
     * When calling the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-refresh">IDynamicRenderer::Refresh Method</a> from within a Paint event handler, set the <b>IDynamicRenderer::ClipRectangle Property</b> to the Paint event's rectangle.
     * 
     * <div class="alert"><b>Note</b>  If the <b>ClipRectangle</b> is expanded in mid-stroke, then a <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-refresh">IDynamicRenderer::Refresh Method</a> call is required in order to display the new ink. This refresh call must be made every time new ink appears in a new area; however, doing so may cause performance problems when inking in the new area.</div>
     * <div> </div>
     * 
     * 
     * @returns {RECT} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-get_cliprectangle
     */
    get_ClipRectangle() {
        prcClipRect := RECT()
        result := ComCall(7, this, "ptr", prcClipRect, "HRESULT")
        return prcClipRect
    }

    /**
     * Gets or sets the clipping rectangle for the DynamicRenderer Class object.
     * @remarks
     * 
     * The <b>ClipRectangle</b> property is set immediately and applies to the stroke that is being drawn. It differs from the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-get_drawingattributes">IDynamicRenderer::DrawingAttributes Property</a> property, which applies to the next stroke drawn. This allows the clip rectangle to grow as the stroke is drawn.
     * 
     * When calling the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-refresh">IDynamicRenderer::Refresh Method</a> from within a Paint event handler, set the <b>IDynamicRenderer::ClipRectangle Property</b> to the Paint event's rectangle.
     * 
     * <div class="alert"><b>Note</b>  If the <b>ClipRectangle</b> is expanded in mid-stroke, then a <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-refresh">IDynamicRenderer::Refresh Method</a> call is required in order to display the new ink. This refresh call must be made every time new ink appears in a new area; however, doing so may cause performance problems when inking in the new area.</div>
     * <div> </div>
     * 
     * 
     * @param {Pointer<RECT>} prcClipRect 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-put_cliprectangle
     */
    put_ClipRectangle(prcClipRect) {
        result := ComCall(8, this, "ptr", prcClipRect, "HRESULT")
        return result
    }

    /**
     * Gets or sets the clipping region for the DynamicRenderer Class object.
     * @remarks
     * 
     * Data can be rendered to any defined surface. The collection surface for dynamic rendering may consist of more than one clip rectangle.
     * 
     * <div class="alert"><b>Note</b>  Setting the clipping region does not trigger a redraw.</div>
     * <div> </div>
     * 
     * 
     * @returns {HANDLE_PTR} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-get_clipregion
     */
    get_ClipRegion() {
        result := ComCall(9, this, "ptr*", &phClipRgn := 0, "HRESULT")
        return phClipRgn
    }

    /**
     * Gets or sets the clipping region for the DynamicRenderer Class object.
     * @remarks
     * 
     * Data can be rendered to any defined surface. The collection surface for dynamic rendering may consist of more than one clip rectangle.
     * 
     * <div class="alert"><b>Note</b>  Setting the clipping region does not trigger a redraw.</div>
     * <div> </div>
     * 
     * 
     * @param {HANDLE_PTR} hClipRgn 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-put_clipregion
     */
    put_ClipRegion(hClipRgn) {
        result := ComCall(10, this, "ptr", hClipRgn, "HRESULT")
        return result
    }

    /**
     * Gets or sets the DrawingAttributes object used by the DynamicRenderer Class object.
     * @remarks
     * 
     * Enables the caller to set or modify the drawing attributes for the next stroke. Device rendering should not use the dynamic renderer. The sole purpose of the dynamic renderer is to perform real time dynamic rendering as part of a user interface.
     * 
     * When creating an instance of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a> class, a default <b>DrawingAttributes</b> instance is created with the following standard attributes:
     * 
     * <ul>
     * <li>Color = Black</li>
     * <li>Width = 53 (2 pixels on a 96 dpi screen)</li>
     * <li>Height = 1</li>
     * <li>PenTip = Ball</li>
     * <li>Transparency = 0</li>
     * <li>AntiAliased = true</li>
     * <li>FitToCurve = false</li>
     * <li>ExtendedProperties = empty collection</li>
     * </ul>
     * Changes to this property are applied between strokes, when they are starting or ending.
     * 
     * If this property is changed while a user is drawing a stroke, the new drawing attributes are not applied to the current stroke, but take effect on the next stroke drawn. For example, setting this property to <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusdown">IStylusPlugin::StylusDown Method</a> during an <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> implementation does not affect an active stroke.
     * 
     * When a <b>DisplaySettingsChanged</b> event occurs, recalculate the Width and Height properties of the <b>DrawingAttributes</b> object in a <b>DisplaySettingsChanged</b> event handler. This is necessary to account for possible dots per inch (dpi) changes that result from the <b>DisplaySettingsChanged</b> event.
     * 
     * The following are default values for the drawing attributes:
     * 
     * <table>
     * <tr>
     * <th>Drawing Attribute</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>
     * AntiAliased
     * 
     * </td>
     * <td>
     * True
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Color
     * 
     * </td>
     * <td>
     * Color.Black
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FitToCurve
     * 
     * </td>
     * <td>
     * false
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Height
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * IgnorePressure
     * 
     * </td>
     * <td>
     * False
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PenTip
     * 
     * </td>
     * <td>
     * Ball
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * RasterOperation
     * 
     * </td>
     * <td>
     * CopyPen
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Transparency
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Width
     * 
     * </td>
     * <td>
     * 53
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-get_drawingattributes
     */
    get_DrawingAttributes() {
        result := ComCall(11, this, "ptr*", &ppiDA := 0, "HRESULT")
        return IInkDrawingAttributes(ppiDA)
    }

    /**
     * 
     * @param {IInkDrawingAttributes} piDA 
     * @returns {HRESULT} 
     */
    putref_DrawingAttributes(piDA) {
        result := ComCall(12, this, "ptr", piDA, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates whether data caching is enabled for the DynamicRenderer Class object.
     * @remarks
     * 
     * Setting the <b>DataCacheEnabled</b> property to <b>TRUE</b> enables you to manage the situation where slow processes block the output queue. When the window is invalidated after strokes are drawn by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a> object, there may be a delay before the collected strokes are drawn. Place the strokes of the dynamic renderer in a cache and use the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-refresh">IDynamicRenderer::Refresh Method</a> method to redraw the strokes.
     * 
     * After the strokes are collected, you must release them from the cache by calling the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-releasecacheddata">IDynamicRenderer::ReleaseCachedData Method</a> method. Use the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-customstylusdataadded">IStylusPlugin::CustomStylusDataAdded Method</a> method to release the strokes.
     * 
     * It is also useful to set the <b>DataCacheEnabled</b> property to <b>TRUE</b> when you want to display strokes as they are drawn, but have no need to store the strokes after you have done something with them. In this case, store the data identifiers in the data parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-customstylusdataadded">IStylusPlugin::CustomStylusDataAdded Method</a> method, and then release the data when you no longer need the cached strokes.
     * 
     * If this property is <b>TRUE</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-releasecacheddata">IDynamicRenderer::ReleaseCachedData Method</a> method for strokes which have been stored in the ink collecting object. If <b>FALSE</b>, you are not required to call the <b>IDynamicRenderer::ReleaseCachedData Method</b> method. The disadvantage to setting this property to <b>FALSE</b> is that any stroke data that was initially dynamically rendered but invalidated by other miscellaneous operations does not render until the stroke data reaches the ink collection object and is rendered there.
     * 
     * Setting this property to <b>FALSE</b> clears the cached data.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-get_datacacheenabled
     */
    get_DataCacheEnabled() {
        result := ComCall(13, this, "int*", &pfCacheData := 0, "HRESULT")
        return pfCacheData
    }

    /**
     * Gets or sets a value that indicates whether data caching is enabled for the DynamicRenderer Class object.
     * @remarks
     * 
     * Setting the <b>DataCacheEnabled</b> property to <b>TRUE</b> enables you to manage the situation where slow processes block the output queue. When the window is invalidated after strokes are drawn by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms701168(v=vs.85)">DynamicRenderer Class</a> object, there may be a delay before the collected strokes are drawn. Place the strokes of the dynamic renderer in a cache and use the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-refresh">IDynamicRenderer::Refresh Method</a> method to redraw the strokes.
     * 
     * After the strokes are collected, you must release them from the cache by calling the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-releasecacheddata">IDynamicRenderer::ReleaseCachedData Method</a> method. Use the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-customstylusdataadded">IStylusPlugin::CustomStylusDataAdded Method</a> method to release the strokes.
     * 
     * It is also useful to set the <b>DataCacheEnabled</b> property to <b>TRUE</b> when you want to display strokes as they are drawn, but have no need to store the strokes after you have done something with them. In this case, store the data identifiers in the data parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-customstylusdataadded">IStylusPlugin::CustomStylusDataAdded Method</a> method, and then release the data when you no longer need the cached strokes.
     * 
     * If this property is <b>TRUE</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-idynamicrenderer-releasecacheddata">IDynamicRenderer::ReleaseCachedData Method</a> method for strokes which have been stored in the ink collecting object. If <b>FALSE</b>, you are not required to call the <b>IDynamicRenderer::ReleaseCachedData Method</b> method. The disadvantage to setting this property to <b>FALSE</b> is that any stroke data that was initially dynamically rendered but invalidated by other miscellaneous operations does not render until the stroke data reaches the ink collection object and is rendered there.
     * 
     * Setting this property to <b>FALSE</b> clears the cached data.
     * 
     * 
     * @param {BOOL} fCacheData 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-put_datacacheenabled
     */
    put_DataCacheEnabled(fCacheData) {
        result := ComCall(14, this, "int", fCacheData, "HRESULT")
        return result
    }

    /**
     * Releases specified stroke data from the temporal data held by DynamicRenderer Class.
     * @param {Integer} strokeId The identifier for the stroke.
     * @returns {HRESULT} For a description of the return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-releasecacheddata
     */
    ReleaseCachedData(strokeId) {
        result := ComCall(15, this, "uint", strokeId, "HRESULT")
        return result
    }

    /**
     * Causes the DynamicRenderer Class object to redraw the ink data that is currently rendering.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-refresh
     */
    Refresh() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Draws the cached data to the specified device context.
     * @param {HANDLE_PTR} hDC The handle of the device context on which to draw.
     * @returns {HRESULT} For a description of the return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-idynamicrenderer-draw
     */
    Draw(hDC) {
        result := ComCall(17, this, "ptr", hDC, "HRESULT")
        return result
    }
}
