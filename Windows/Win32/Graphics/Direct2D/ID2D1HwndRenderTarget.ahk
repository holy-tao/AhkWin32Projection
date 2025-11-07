#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\ID2D1RenderTarget.ahk

/**
 * Renders drawing instructions to a window.
 * @remarks
 * 
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
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1hwndrendertarget
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1HwndRenderTarget extends ID2D1RenderTarget{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1HwndRenderTarget
     * @type {Guid}
     */
    static IID => Guid("{2cd90698-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckWindowState", "Resize", "GetHwnd"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1hwndrendertarget-checkwindowstate
     */
    CheckWindowState() {
        result := ComCall(57, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_SIZE_U>} pixelSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1hwndrendertarget-resize
     */
    Resize(pixelSize) {
        result := ComCall(58, this, "ptr", pixelSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1hwndrendertarget-gethwnd
     */
    GetHwnd() {
        result := ComCall(59, this, "ptr")
        return HWND({Value: result}, True)
    }
}
