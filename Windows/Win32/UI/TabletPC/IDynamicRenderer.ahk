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
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-get_enabled
     */
    get_Enabled() {
        result := ComCall(3, this, "int*", &bEnabled := 0, "HRESULT")
        return bEnabled
    }

    /**
     * 
     * @param {BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-put_enabled
     */
    put_Enabled(bEnabled) {
        result := ComCall(4, this, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE_PTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-get_hwnd
     */
    get_HWND() {
        result := ComCall(5, this, "ptr*", &hwnd := 0, "HRESULT")
        return hwnd
    }

    /**
     * 
     * @param {HANDLE_PTR} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-put_hwnd
     */
    put_HWND(hwnd) {
        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-get_cliprectangle
     */
    get_ClipRectangle() {
        prcClipRect := RECT()
        result := ComCall(7, this, "ptr", prcClipRect, "HRESULT")
        return prcClipRect
    }

    /**
     * 
     * @param {Pointer<RECT>} prcClipRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-put_cliprectangle
     */
    put_ClipRectangle(prcClipRect) {
        result := ComCall(8, this, "ptr", prcClipRect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE_PTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-get_clipregion
     */
    get_ClipRegion() {
        result := ComCall(9, this, "ptr*", &phClipRgn := 0, "HRESULT")
        return phClipRgn
    }

    /**
     * 
     * @param {HANDLE_PTR} hClipRgn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-put_clipregion
     */
    put_ClipRegion(hClipRgn) {
        result := ComCall(10, this, "ptr", hClipRgn, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-get_drawingattributes
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
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-get_datacacheenabled
     */
    get_DataCacheEnabled() {
        result := ComCall(13, this, "int*", &pfCacheData := 0, "HRESULT")
        return pfCacheData
    }

    /**
     * 
     * @param {BOOL} fCacheData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-put_datacacheenabled
     */
    put_DataCacheEnabled(fCacheData) {
        result := ComCall(14, this, "int", fCacheData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} strokeId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-releasecacheddata
     */
    ReleaseCachedData(strokeId) {
        result := ComCall(15, this, "uint", strokeId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-refresh
     */
    Refresh() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE_PTR} hDC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-idynamicrenderer-draw
     */
    Draw(hDC) {
        result := ComCall(17, this, "ptr", hDC, "HRESULT")
        return result
    }
}
