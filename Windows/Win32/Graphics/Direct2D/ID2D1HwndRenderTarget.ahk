#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_SIZE_U.ahk" { D2D_SIZE_U }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_WINDOW_STATE.ahk" { D2D1_WINDOW_STATE }
#Import ".\ID2D1RenderTarget.ahk" { ID2D1RenderTarget }

/**
 * Renders drawing instructions to a window.
 * @remarks
 * As is the case with other render targets, you must call <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a>  before issuing drawing commands. After you've finished drawing, call <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> to indicate that drawing is finished and to release access to the buffer backing the render target.
 * 
 * For <b>ID2D1HwndRenderTarget</b>, the only side effect of <b>BeginDraw</b> is changing the state of the render target to allow drawing commands to be issued.
 * 
 * <b>EndDraw</b> flushes any batched drawing commands. If no errors have occurred, then it also presents the buffer, causing it to appear on the associated window. Finally, <b>EndDraw</b> returns the HRESULT of the first error that occurred in drawing or presenting, as well as the tag state at the time the error occurred.
 * 
 * <b>ID2D1HwndRenderTarget</b> objects are double buffered, so drawing commands issued do not appear immediately, but rather are performed on an offscreen surface. When <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> is called, if there have been no rendering errors, the offscreen buffer is presented. If there have been rendering errors in the batch flushed by <b>EndDraw</b>, then the buffer is not presented, and the application must call <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a> and re-draw the frame. <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">Flush</a> can be used to check for errors before calling <b>EndDraw</b> if an application wants the frame to be presented regardless of errors.
 * 
 * 
 * 
 * A hardware render target's back-buffer is the size specified by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1hwndrendertarget-resize(constd2d1_size_u)">GetPixelSize</a>. If <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> presents the buffer, this bitmap is stretched to cover the surface where it is presented: the entire client area of the window. This stretch is performed using bilinear filtering if the render target is rendering in hardware and using nearest-neighbor filtering if the rendering target is using software. (Typically, an application will call Resize to ensure the pixel size of the render target and the pixel size of the destination match, and no scaling is necessary, though this is not a requirement.)
 * 
 * 
 * 
 * In the case where a window straddles adapters, Direct2D ensures that the portion of the off-screen render target is copied from the adapter where rendering is occurring to the adapter that needs to display the contents.
 * 
 * 
 * 
 * If the adapter a render target is on has been removed or the driver upgraded while the application is running, this is returned as an error in the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> call. In this case, the application should create a new render target and resources as necessary.
 * 
 * 
 * <h3><a id="Creating_ID2D1HwndRenderTarget_Objects"></a><a id="creating_id2d1hwndrendertarget_objects"></a><a id="CREATING_ID2D1HWNDRENDERTARGET_OBJECTS"></a>Creating ID2D1HwndRenderTarget Objects</h3>
 * To create an <b>ID2D1HwndRenderTarget</b>, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createhwndrendertarget(constd2d1_render_target_properties_constd2d1_hwnd_render_target_properties_id2d1hwndrendertarget)">ID2D1Factory::CreateHwndRenderTarget</a> method.
 * 
 * Your application should create render targets once and hold onto them for the life of the application or until the render target's  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> method returns the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-error-codes">D2DERR_RECREATE_TARGET</a>  error. When you receive this error, you need to recreate the render target (and any resources it created).
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1HwndRenderTarget extends ID2D1RenderTarget {
    /**
     * The interface identifier for ID2D1HwndRenderTarget
     * @type {Guid}
     */
    static IID := Guid("{2cd90698-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1HwndRenderTarget interfaces
    */
    struct Vtbl extends ID2D1RenderTarget.Vtbl {
        CheckWindowState : IntPtr
        Resize           : IntPtr
        GetHwnd          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1HwndRenderTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates whether the HWND associated with this render target is occluded.
     * @remarks
     * <div class="alert"><b>Note</b>  If the window was occluded the last time  that <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> was called, the next time that the render target calls <b>CheckWindowState</b>, it will return <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_window_state">D2D1_WINDOW_STATE_OCCLUDED</a> regardless of the current window state. If you want to use <b>CheckWindowState</b> to determine the current window state, you should call <b>CheckWindowState</b> after every <b>EndDraw</b> call and ignore its return value. This call will ensure that your next call to <b>CheckWindowState</b> state will return the actual window state.</div>
     * <div> </div>
     * @returns {D2D1_WINDOW_STATE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_window_state">D2D1_WINDOW_STATE</a></b>
     * 
     * A value that indicates whether the HWND associated with this render target is occluded.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1hwndrendertarget-checkwindowstate
     */
    CheckWindowState() {
        result := ComCall(57, this, D2D1_WINDOW_STATE)
        return result
    }

    /**
     * Changes the size of the render target to the specified pixel size.
     * @remarks
     * After this method is called, the contents of the render target's back-buffer are not defined, even if the [**D2D1\_PRESENT\_OPTIONS\_RETAIN\_CONTENTS**](/windows/win32/api/d2d1/ne-d2d1-d2d1_present_options) option was specified when the render target was created.
     * @param {Pointer<D2D_SIZE_U>} pixelSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1hwndrendertarget-resize
     */
    Resize(pixelSize) {
        result := ComCall(58, this, D2D_SIZE_U.Ptr, pixelSize, "HRESULT")
        return result
    }

    /**
     * Returns the HWND associated with this render target.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * The HWND associated with this render target.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1hwndrendertarget-gethwnd
     */
    GetHwnd() {
        result := ComCall(59, this, HWND)
        return result
    }

    Query(iid) {
        if (ID2D1HwndRenderTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckWindowState := CallbackCreate(GetMethod(implObj, "CheckWindowState"), flags, 1)
        this.vtbl.Resize := CallbackCreate(GetMethod(implObj, "Resize"), flags, 2)
        this.vtbl.GetHwnd := CallbackCreate(GetMethod(implObj, "GetHwnd"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckWindowState)
        CallbackFree(this.vtbl.Resize)
        CallbackFree(this.vtbl.GetHwnd)
    }
}
