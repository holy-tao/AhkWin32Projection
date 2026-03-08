#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a physical bitmap that can be associated with a visual for composition in a visual tree. This interface can also be used to update the bitmap contents.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionsurface
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionSurface extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionSurface
     * @type {Guid}
     */
    static IID => Guid("{bb8a4953-2c99-4f5a-96f5-4819027fa3ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginDraw", "EndDraw", "SuspendDraw", "ResumeDraw", "Scroll"]

    /**
     * Initiates drawing on this Microsoft DirectComposition surface object.
     * @remarks
     * This method enables an application to incrementally update the contents of a DirectComposition surface object. The application must use the following sequence:
     * 
     * 
     * 
     * <ol>
     * <li>Call <b>BeginDraw</b> to initiate the incremental update.</li>
     * <li>Use the retrieved surface as a render target and draw the updated contents at the retrieved offset.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-enddraw">IDCompositionSurface::EndDraw</a> method to finish the update.</li>
     * </ol>
     * The update object returned by this method is either a Direct2D device context or a DXGI surface, depending on the value of the <i>iid</i> parameter and on how the DirectComposition surface object was created. If the <i>iid</i> parameter is __uuidof(ID2D1DeviceContext), then the returned object is a Direct2D device context that already has the DirectComposition surface selected as a render target. Otherwise, it is a DXGI surface which the application may use as a render target. In either case, the returned object is associated with the Direct2D or DXGI device passed by the application to the DCompositionCreateDevice2 function or the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice2-createsurfacefactory">IDCompositionDevice2::CreateSurfaceFactory</a> method.
     * 
     * 
     * 
     * The <i>iid</i> parameter may only be __uuidof(ID2D1DeviceContext) if the DirectComposition surface object was created from a DirectComposition device or surface factory that was, itself, created with an associated Direct2D device. In particular, the application must have called either the DCompositionCreateDevice2 function or the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice2-createsurfacefactory">IDCompositionDevice2::CreateSurfaceFactory</a> method with a Direct2D device as the <i>renderingDevice</i> parameter. If the DirectComposition surface was created via a surface factory that was not associated with a Direct2D device, or if it was created directly via the IDCompositionDevice2 interface and the device was not directly associated with a Direct2D device, then passing __uuidof(ID2D1DeviceContext) as the iid parameter causes this method to return E_INVALIDARG.
     * 
     * 
     * 
     * If the application successfully retrieves a Direct2D device context as the update object, then the application should not call either the ID2D1DeviceContext::BeginDraw or ID2D1DeviceContext::EndDraw methods on the returned Direct2D device context.
     * 
     * 
     * The retrieved offset is not necessarily the same as the top-left corner of the requested update rectangle. The application must transform its rendering primitives to draw within a rectangle of the same width and height as the input rectangle, but at the given offset. The application should not draw outside of this rectangle.
     * 
     * 
     * 
     * If the <i>updateRectangle</i> parameter is NULL, the entire surface is updated. In that case, because the retrieved offset still might not be (0,0), the application still needs to transform its rendering primitives accordingly.
     * 
     * 
     * 
     * If the surface is not a virtual surface, then the first time the application calls this method for a particular non-virtual surface, the update rectangle must cover the entire surface, either by specifying the full surface in the requested update rectangle, or by specifying NULL as the <i>updateRectangle</i> parameter. For virtual surfaces, the first call may be any sub-rectangle of the surface.
     * 
     * 
     * 
     * Because each call to this method might retrieve a different object in the <i>updateObject</i> surface, the application should not cache the retrieved surface pointer. The application should release the retrieved pointer as soon as it finishes drawing. 
     * 
     * The retrieved surface rectangle does not contain the previous contents of the bitmap. The application must update every pixel in the update rectangle, either by first clearing the render target, or by issuing enough rendering primitives to fully cover the update rectangle. Because the initial contents of the update surface are undefined, failing to update every pixel leads to undefined behavior.
     * 
     * 
     * 
     * Only one DirectComposition surface can be updated at a time. An application must suspend drawing on one surface before beginning or resuming to draw on another surface. If the application calls <b>BeginDraw</b> twice, either for the same surface or for another surface belonging to the same DirectComposition device, without an intervening call to <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-enddraw">IDCompositionSurface::EndDraw</a>, the second call fails. If the application calls <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice2-commit">IDCompositionDevice2::Commit</a> without calling <b>EndDraw</b>, the update remains pending. The update takes effect only after the application calls <b>EndDraw</b> and then  calls the <b>IDCompositionDevice2::Commit</b>  method.
     * @param {Pointer<RECT>} updateRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The rectangle to be updated. If this parameter is NULL, the entire bitmap is updated.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The identifier of the interface to retrieve.
     * @param {Pointer<Pointer<Void>>} updateObject Type: <b>void**</b>
     * 
     * Receives an interface pointer of the type specified in the <i>iid</i> parameter.   This parameter must not be NULL.
     * 
     * <div class="alert"><b>Note</b>  In Windows 8, this parameter was <i>surface</i>.</div>
     * <div> </div>
     * @param {Pointer<POINT>} updateOffset Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * The offset into the surface where the application should draw updated content. This offset will reference the upper left corner of the update rectangle.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-begindraw
     */
    BeginDraw(updateRect, iid, updateObject, updateOffset) {
        updateObjectMarshal := updateObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", updateRect, "ptr", iid, updateObjectMarshal, updateObject, "ptr", updateOffset, "HRESULT")
        return result
    }

    /**
     * Marks the end of drawing on this Microsoft DirectComposition surface object.
     * @remarks
     * This method completes an update that was begun by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> method. After this method returns, the application can start another update on the same surface object or on a different one.
     * 
     * 
     * 
     * If the application calls <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice2-commit">IDCompositionDevice2::Commit</a> before calling <b>IDCompositionSurface::EndDraw</b> for a surface with a pending update, that update is not processed by that Commit call. The update only takes effect on screen after the application calls <b>IDCompositionSurface::EndDraw</b> followed by the IDCompositionDevice2::Commit method.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code, which can include <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_NOT_BEING_RENDERED</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-enddraw
     */
    EndDraw() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Suspends the drawing on this Microsoft DirectComposition surface object.
     * @remarks
     * Because only one surface can be open for drawing at a time, calling <b>SuspendDraw</b> allows the user to call <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> on a different surface. Drawing to this surface can be resumed by calling <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-resumedraw">IDCompositionSurface::ResumeDraw</a>.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code, which can include <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_BEING_RENDERED</a> and <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_NOT_BEING_RENDERED</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-suspenddraw
     */
    SuspendDraw() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Resumes drawing on this Microsoft DirectComposition surface object.
     * @remarks
     * This method allows the surface update to continue unless there are other surfaces that have active, unsuspended draws.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code, which can include <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_BEING_RENDERED</a> and <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_NOT_BEING_RENDERED</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-resumedraw
     */
    ResumeDraw() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Scrolls a rectangular area of a Microsoft DirectComposition logical surface.
     * @remarks
     * This method allows an application to blt/copy a sub-rectangle of a DirectComposition surface object. This avoids re-rendering content that is already available.  
     * 
     * 
     * 
     * The <i>scrollRect</i> rectangle must be contained in the boundaries of the surface.  If the <i>scrollRect</i> rectangle goes outside the bounds of the surface, this method fails.
     * 
     * 
     * 
     * The bits copied by the scroll operation (source) are defined by the intersection of the <i>scrollRect</i> and <i>clipRect</i> rectangles.  
     * 
     * The bits shown on the screen (destination) are defined by the intersection of the offset source rectangle and <i>clipRect</i>.
     * 
     * 
     * 
     * Scroll operations can only be called before calling <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">BeginDraw</a> or after calling <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-enddraw">EndDraw</a>.  Suspended or resumed surfaces are not candidates for scrolling because they are still being updated.
     * 
     * 
     * 
     * The application is responsible for ensuring that the scrollable area for an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvirtualsurface">IDCompositionVirtualSurface</a> is limited to valid pixels. The behavior for invalid pixels in the <i>scrollRect</i> is undefined.  
     * 
     * Virtual surface sub-rectangular areas that were discarded by a trim or a resize operation can't be scrolled even if the trim or resize is applied in the same batch.  <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvirtualsurface-trim">Trim</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvirtualsurface-resize">Resize</a> are applied immediately.
     * @param {Pointer<RECT>} scrollRect The rectangular area of the surface to be scrolled, relative to the upper-left corner of the surface. If this parameter is NULL, the entire surface is scrolled.
     * @param {Pointer<RECT>} clipRect The <i>clipRect</i> clips the destination (<i>scrollRect</i> after offset) of the scroll.
     * The only bitmap content that will be scrolled are those that remain inside the clip rectangle after the scroll is completed.
     * @param {Integer} offsetX The amount of horizontal scrolling, in pixels. Use positive values to scroll right, and negative values to scroll left.
     * @param {Integer} offsetY The amount of vertical scrolling, in pixels. Use positive values to scroll down, and negative values to scroll up.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-scroll
     */
    Scroll(scrollRect, clipRect, offsetX, offsetY) {
        result := ComCall(7, this, "ptr", scrollRect, "ptr", clipRect, "int", offsetX, "int", offsetY, "HRESULT")
        return result
    }
}
