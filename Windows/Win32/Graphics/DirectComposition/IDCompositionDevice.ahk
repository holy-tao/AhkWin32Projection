#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DCOMPOSITION_FRAME_STATISTICS.ahk
#Include .\IDCompositionTarget.ahk
#Include .\IDCompositionVisual.ahk
#Include .\IDCompositionSurface.ahk
#Include .\IDCompositionVirtualSurface.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IDCompositionTranslateTransform.ahk
#Include .\IDCompositionScaleTransform.ahk
#Include .\IDCompositionRotateTransform.ahk
#Include .\IDCompositionSkewTransform.ahk
#Include .\IDCompositionMatrixTransform.ahk
#Include .\IDCompositionTransform.ahk
#Include .\IDCompositionTranslateTransform3D.ahk
#Include .\IDCompositionScaleTransform3D.ahk
#Include .\IDCompositionRotateTransform3D.ahk
#Include .\IDCompositionMatrixTransform3D.ahk
#Include .\IDCompositionTransform3D.ahk
#Include .\IDCompositionEffectGroup.ahk
#Include .\IDCompositionRectangleClip.ahk
#Include .\IDCompositionAnimation.ahk

/**
 * Serves as a factory for all other Microsoft DirectComposition objects and provides methods to control transactional composition. (IDCompositionDevice)
 * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nn-dcomp-idcompositiondevice
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionDevice
     * @type {Guid}
     */
    static IID => Guid("{c37ea93a-e7aa-450d-b16f-9746cb0407f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit", "WaitForCommitCompletion", "GetFrameStatistics", "CreateTargetForHwnd", "CreateVisual", "CreateSurface", "CreateVirtualSurface", "CreateSurfaceFromHandle", "CreateSurfaceFromHwnd", "CreateTranslateTransform", "CreateScaleTransform", "CreateRotateTransform", "CreateSkewTransform", "CreateMatrixTransform", "CreateTransformGroup", "CreateTranslateTransform3D", "CreateScaleTransform3D", "CreateRotateTransform3D", "CreateMatrixTransform3D", "CreateTransform3DGroup", "CreateEffectGroup", "CreateRectangleClip", "CreateAnimation", "CheckDeviceState"]

    /**
     * Commits all DirectComposition commands that are pending on this device. (IDCompositionDevice.Commit)
     * @remarks
     * Calls to DirectComposition methods are always batched and executed atomically as a single transaction. Calls take effect only when <b>IDCompositionDevice::Commit</b> is called, at which time all pending method calls for a device are executed at once. 
     * 
     * An application that uses multiple devices must call <b>Commit</b> for each device separately. However, because the composition engine processes the calls individually, the batch of commands might not take effect at the same time.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-commit
     */
    Commit() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Waits for the composition engine to finish processing the previous call to the IDCompositionDevice::Commit method.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-waitforcommitcompletion
     */
    WaitForCommitCompletion() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDCompositionDevice::GetFrameStatistics method retrieves information from the composition engine about composition times and the frame rate.
     * @remarks
     * This method retrieves timing information about the composition engine that an application can use to synchronize the rasterization of bitmaps with independent animations.
     * @returns {DCOMPOSITION_FRAME_STATISTICS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ns-dcomptypes-dcomposition_frame_statistics">DCOMPOSITION_FRAME_STATISTICS</a>*</b>
     * 
     * A structure that receives composition times and frame rate information.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-getframestatistics
     */
    GetFrameStatistics() {
        statistics := DCOMPOSITION_FRAME_STATISTICS()
        result := ComCall(5, this, "ptr", statistics, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return statistics
    }

    /**
     * Creates a composition target object that is bound to the window that is represented by the specified window handle (HWND).
     * @remarks
     * A Microsoft DirectComposition visual tree must be bound to a window before anything can be displayed on screen. The window can be a top-level window or a child window. In either case, the window can be a layered window, but in all cases the window must belong to the calling process. If the window belongs to a different process, this method returns <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_ACCESS_DENIED</a>. 
     * 
     * When DirectComposition content is composed to the window, the content is always composed on top of whatever is drawn directly to that window through the device context (<a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a>) returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdc">GetDC</a> function, or by calls to Microsoft DirectX <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">Present</a> methods. However, because window clipping rules apply to DirectComposition content, if the window has child windows, those child windows may clip the visual tree. The <i>topmost</i> parameter determines whether child windows clip the visual tree. 
     * 
     *  Conceptually, each window consists of four layers:
     * 
     * <ol>
     * <li>The contents drawn directly to the window handle (this is the bottommost layer).</li>
     * <li>An optional DirectComposition visual tree.</li>
     * <li>The contents of all child windows, if any.</li>
     * <li>Another optional DirectComposition visual tree (this is the topmost layer).</li>
     * </ol>
     * All four layers are clipped to the window's visible region.
     * 
     * At most, only two composition targets can be created for each window in the system, one topmost and one not topmost. If a composition target is already bound to the specified window at the specified layer, this method fails. When a composition target object is destroyed, the layer it composed is available for use by a new composition target object.
     * @param {HWND} hwnd_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The window to which the  composition target object should be bound. This parameter must not be NULL.
     * @param {BOOL} topmost Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * TRUE if the visual tree should be displayed on top of the children of the window specified by the <i>hwnd</i> parameter; otherwise, the visual tree is displayed behind the children.
     * @returns {IDCompositionTarget} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontarget">IDCompositionTarget</a>**</b>
     * 
     * The new composition target object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createtargetforhwnd
     */
    CreateTargetForHwnd(hwnd_, topmost) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(6, this, "ptr", hwnd_, "int", topmost, "ptr*", &target := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionTarget(target)
    }

    /**
     * The IDCompositionDevice::CreateVisual method creates a new visual object.
     * @remarks
     * A new visual object has a static value of zero for the OffsetX and OffsetY properties, and NULL for the Transform, Clip, and Content properties. Initially, the visual  does not cause the contents of a window to change. The visual must be added as a child of another visual, or as the root of a composition target, before it can affect the appearance of a window.
     * @returns {IDCompositionVisual} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>**</b>
     * 
     * The new visual object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createvisual
     */
    CreateVisual() {
        result := ComCall(7, this, "ptr*", &visual := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionVisual(visual)
    }

    /**
     * The IDCompositionDevice::CreateSurface method creates an updatable surface object that can be associated with one or more visuals for composition.
     * @remarks
     * A Microsoft DirectComposition surface is a rectangular array of pixels that can be associated with a visual for composition. 
     * 
     * A newly created surface object is in an uninitialized state. While it is uninitialized, the surface has no effect on the composition of the visual tree. It behaves exactly like a surface that has  100% transparent pixels.
     * 
     * 
     * 
     * To initialize the surface with pixel data, use the <b>IDCompositionSurface::BeginDraw</b> method. The first call to this method must cover the entire surface area to provide an initial value for every pixel. Subsequent calls may specify smaller sub-rectangles of the surface to update.
     * 
     * 
     * 
     * DirectComposition surfaces support the following pixel formats: 
     * 
     * <ul>
     * <li><b>DXGI_FORMAT_B8G8R8A8_UNORM</b></li>
     * <li><b>DXGI_FORMAT_R8G8B8A8_UNORM</b></li>
     * <li><b>DXGI_FORMAT_R16G16B16A16_FLOAT</b></li>
     * </ul>
     * @param {Integer} width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width of the surface, in pixels.
     * @param {Integer} height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The height of the surface, in pixels.
     * @param {Integer} pixelFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The pixel format of the surface.
     * @param {Integer} alphaMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode">DXGI_ALPHA_MODE</a></b>
     * @returns {IDCompositionSurface} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsurface">IDCompositionSurface</a>**</b>
     * 
     * The newly created surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createsurface
     */
    CreateSurface(width, height, pixelFormat, alphaMode) {
        result := ComCall(8, this, "uint", width, "uint", height, "int", pixelFormat, "int", alphaMode, "ptr*", &surface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionSurface(surface)
    }

    /**
     * The IDCompositionDevice::CreateVirtualSurface method creates a sparsely populated surface that can be associated with one or more visuals for composition.
     * @remarks
     * A Microsoft DirectComposition sparse surface is a logical object that behaves like a rectangular array of pixels that can be associated with a visual for composition. The surface is not necessarily backed by any physical video or system memory for every one of its pixels. The application can realize or virtualize parts of the logical surface at different times.
     * 
     * 
     * 
     * A newly created surface object is in an uninitialized state. While it is uninitialized, the surface has no effect on the composition of the visual tree. It behaves exactly like a surface that is initialized with 100% transparent pixels. 
     * 
     * To initialize the surface with pixel data, use the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> method. This method not only provides pixels for the surface, but it also allocates actual storage space for those pixels. The memory allocation persists until the application returns some of the memory to the system. The application can free part or all of the allocated memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvirtualsurface-trim">IDComposition::VirtualSurfaceTrim</a> method.
     * 
     * 
     * 
     * DirectComposition surfaces support the following pixel formats:
     * 
     * <ul>
     * <li><b>DXGI_FORMAT_B8G8R8A8_UNORM</b></li>
     * <li><b>DXGI_FORMAT_R8G8B8A8_UNORM</b></li>
     * <li><b>DXGI_FORMAT_R16G16B16A16_FLOAT</b></li>
     * </ul>
     * This method fails if <i>initialWidth</i> or <i>initialHeight</i> exceeds 16,777,216 pixels.
     * @param {Integer} initialWidth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width of the surface, in pixels. The maximum width is 16,777,216 pixels.
     * @param {Integer} initialHeight Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The height of the surface, in pixels. The maximum height is 16,777,216 pixels.
     * @param {Integer} pixelFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The pixel format of the surface.
     * @param {Integer} alphaMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode">DXGI_ALPHA_MODE</a></b>
     * @returns {IDCompositionVirtualSurface} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvirtualsurface">IDCompositionVirtualSurface</a>**</b>
     * 
     * The newly created surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createvirtualsurface
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode) {
        result := ComCall(9, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr*", &virtualSurface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionVirtualSurface(virtualSurface)
    }

    /**
     * The IDCompositionDevice::CreateSurfaceFromHandle method creates a new composition surface object that wraps an existing composition surface.
     * @remarks
     * This method enables an application to use a shared composition surface in a composition tree.
     * @param {HANDLE} handle_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * The handle of an existing composition surface that was created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-dcompositioncreatesurfacehandle">DCompositionCreateSurfaceHandle</a> function.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsurface">IUnknown</a>**</b>
     * 
     * The new composition surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhandle
     */
    CreateSurfaceFromHandle(handle_) {
        handle_ := handle_ is Win32Handle ? NumGet(handle_, "ptr") : handle_

        result := ComCall(10, this, "ptr", handle_, "ptr*", &surface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(surface)
    }

    /**
     * The IDCompositionDevice::CreateSurfaceFromHwnd method creates a wrapper object that represents the rasterization of a layered window, and that can be associated with a visual for composition.
     * @remarks
     * You can use the <i>surface</i> pointer in calls to the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvisual-setcontent">IDCompositionVisual::SetContent</a> method to set the content of one or more visuals. After setting the content, the visuals compose the contents of the specified layered window as long as the window is layered. If the window is unlayered, the window content disappears from the output of the composition tree. If the window is later re-layered, the window content reappears as long as it is still associated with a visual.
     * 
     * If the window is resized, the affected visuals are re-composed. 
     * 
     * The contents of the window are not cached beyond the life of the window. That is, if the window is destroyed, the affected visuals stop composing the window.
     * 
     * If the window is moved off-screen or resized to zero, the system stops composing the content of visuals. You should use the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a> function with the <b>DWMWA_CLOAK</b> flag to "cloak" the layered child window when you need to hide the original window while allowing the system to continue to compose the content of the visuals. For more information, see <a href="https://docs.microsoft.com/windows/desktop/directcomp/how-to--animate-the-bitmap-of-a-layered-child-window">How to animate the bitmap of a layered child window</a> and <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/DirectCompositionLayeredChildWindow">DirectComposition layered child window sample</a>.
     * @param {HWND} hwnd_ Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the layered window for which to create a  wrapper. A layered window is created by specifying <b>WS_EX_LAYERED</b> when creating the window with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function or by setting <b>WS_EX_LAYERED</b> via <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowlonga">SetWindowLong</a> after the window has been created.
     * @returns {IUnknown} Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * The new composition surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhwnd
     */
    CreateSurfaceFromHwnd(hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(11, this, "ptr", hwnd_, "ptr*", &surface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(surface)
    }

    /**
     * The IDCompositionDevice::CreateTranslateTransform method creates a 2D translation transform object.
     * @remarks
     * A new 2D translation transform object has a static value of zero for the OffsetX and OffsetY properties.
     * @returns {IDCompositionTranslateTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontranslatetransform">IDCompositionTranslateTransform</a>**</b>
     * 
     * The new 2D translation transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createtranslatetransform
     */
    CreateTranslateTransform() {
        result := ComCall(12, this, "ptr*", &translateTransform := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionTranslateTransform(translateTransform)
    }

    /**
     * The IDCompositionDevice::CreateScaleTransform method creates a 2D scale transform object.
     * @remarks
     * A new 2D scale transform object has a static value of zero for the ScaleX, ScaleY, CenterX, and CenterY properties.
     * @returns {IDCompositionScaleTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionscaletransform">IDCompositionScaleTransform</a>**</b>
     * 
     * The new 2D scale transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createscaletransform
     */
    CreateScaleTransform() {
        result := ComCall(13, this, "ptr*", &scaleTransform := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionScaleTransform(scaleTransform)
    }

    /**
     * Creates a 2D rotation transform object. (IDCompositionDevice.CreateRotateTransform)
     * @remarks
     * A new 2D rotation transform object has a static value of zero for the Angle, CenterX, and CenterY properties.
     * @returns {IDCompositionRotateTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionrotatetransform">IDCompositionRotateTransform</a>**</b>
     * 
     * The new rotation transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createrotatetransform
     */
    CreateRotateTransform() {
        result := ComCall(14, this, "ptr*", &rotateTransform := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionRotateTransform(rotateTransform)
    }

    /**
     * The IDCompositionDevice::CreateSkewTransform method creates a 2D skew transform object.
     * @remarks
     * A new 2D skew transform object has a static value of zero for the AngleX, AngleY, CenterX, and CenterY properties.
     * @returns {IDCompositionSkewTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionskewtransform">IDCompositionSkewTransform</a>**</b>
     * 
     * The new 2D skew transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createskewtransform
     */
    CreateSkewTransform() {
        result := ComCall(15, this, "ptr*", &skewTransform := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionSkewTransform(skewTransform)
    }

    /**
     * Creates a 2D 3-by-2 matrix transform object. (IDCompositionDevice.CreateMatrixTransform)
     * @remarks
     * A new matrix transform object has the identity matrix as its initial value. The identity matrix is the 3x2 matrix with ones on the main diagonal and zeros elsewhere, as shown in the following illustration. 
     * 
     * <img alt="Three-by-two identity matrix" src="./images/identity_3x2matrix.png"/>
     * 
     * When an identity transform is applied to an object, it does not change the position, shape, or size of the object. It is similar to the way that multiplying a number by one does not change the number. Any transform other than the identity transform will modify the position, shape, and/or size of objects.
     * @returns {IDCompositionMatrixTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionmatrixtransform">IDCompositionMatrixTransform</a>**</b>
     * 
     * The new matrix transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-creatematrixtransform
     */
    CreateMatrixTransform() {
        result := ComCall(16, this, "ptr*", &matrixTransform := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionMatrixTransform(matrixTransform)
    }

    /**
     * The IDCompositionDevice::CreateTransformGroup method creates a 2D transform group object that holds an array of 2D transform objects.
     * @remarks
     * The array entries in a transform group cannot be changed. However, each transform in the array can be modified through its own property setting methods. If a transform in the array is modified, the change is reflected in the computed matrix of the transform group.
     * @param {Pointer<IDCompositionTransform>} transforms Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform">IDCompositionTransform</a>**</b>
     * 
     * An array of 2D transform objects that make up this transform group.
     * @param {Integer} elements Type: <b>UINT</b>
     * 
     * The number of elements in the <i>transforms</i> array.
     * @returns {IDCompositionTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform">IDCompositionTransform</a>**</b>
     * 
     * The new transform group object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createtransformgroup
     */
    CreateTransformGroup(transforms, elements) {
        result := ComCall(17, this, "ptr*", transforms, "uint", elements, "ptr*", &transformGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionTransform(transformGroup)
    }

    /**
     * The IDCompositionDevice::CreateTranslateTransform3D method creates a 3D translation transform object.
     * @remarks
     * A newly created 3D translation transform has a static value of 0 for the OffsetX, OffsetY, and OffsetZ properties.
     * @returns {IDCompositionTranslateTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontranslatetransform3d">IDCompositionTranslateTransform3D</a>**</b>
     * 
     * The new 3D translation transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createtranslatetransform3d
     */
    CreateTranslateTransform3D() {
        result := ComCall(18, this, "ptr*", &translateTransform3D := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionTranslateTransform3D(translateTransform3D)
    }

    /**
     * The IDCompositionDevice::CreateScaleTransform3D method creates a 3D scale transform object.
     * @remarks
     * A new 3D scale transform object has a static value of 1.0 for the ScaleX, ScaleY, and ScaleZ properties.
     * @returns {IDCompositionScaleTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionscaletransform3d">IDCompositionScaleTransform3D</a>**</b>
     * 
     * The new 3D scale transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createscaletransform3d
     */
    CreateScaleTransform3D() {
        result := ComCall(19, this, "ptr*", &scaleTransform3D := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionScaleTransform3D(scaleTransform3D)
    }

    /**
     * The CreateRotateTransform3D method in the IDCompositionDevice interface creates a 3D rotation transform object.
     * @remarks
     * A new 3D rotation transform object has a default static value of zero for the Angle, CenterX, CenterY, AxisX, and AxisY properties, and a default static value of 1.0 for the AxisZ property.
     * @returns {IDCompositionRotateTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionrotatetransform3d">IDCompositionRotateTransform3D</a>**</b>
     * 
     * The new 3D rotation transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createrotatetransform3d
     */
    CreateRotateTransform3D() {
        result := ComCall(20, this, "ptr*", &rotateTransform3D := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionRotateTransform3D(rotateTransform3D)
    }

    /**
     * Creates a 3D 4-by-4 matrix transform object. (IDCompositionDevice.CreateMatrixTransform3D)
     * @remarks
     * The new 3D matrix transform has the identity matrix as its value. The identity matrix is the 4-by-4 matrix with ones on the main diagonal and zeros elsewhere, as shown in the following illustration. 
     * 
     * <img alt="Four-by-four identity matrix" src="./images/identity_4x4matrix.png"/>
     * 
     * When an identity transform is applied to an object, it does not change the position, shape, or size of the object. It is similar to the way that multiplying a number by one does not change the number. Any transform other than the identity transform will modify the position, shape, and/or size of objects.
     * @returns {IDCompositionMatrixTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionmatrixtransform3d">IDCompositionMatrixTransform3D</a>**</b>
     * 
     * The new 3D matrix transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-creatematrixtransform3d
     */
    CreateMatrixTransform3D() {
        result := ComCall(21, this, "ptr*", &matrixTransform3D := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionMatrixTransform3D(matrixTransform3D)
    }

    /**
     * The IDCompositionDevice::CreateTransform3DGroup method creates a 3D transform group object that holds an array of 3D transform objects.
     * @remarks
     * The array entries in a 3D transform group cannot be changed. However, each transform in the array can be modified through its own property setting methods. If a transform in the array is modified, the change is reflected in the computed matrix of the transform group.
     * @param {Pointer<IDCompositionTransform3D>} transforms3D Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform3d">IDCompositionTransform3D</a>**</b>
     * 
     * An array of 3D transform objects that make up this transform group.
     * @param {Integer} elements Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the <i>transforms</i> array.
     * @returns {IDCompositionTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform3d">IDCompositionTransform3D</a>**</b>
     * 
     * The new 3D transform group object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createtransform3dgroup
     */
    CreateTransform3DGroup(transforms3D, elements) {
        result := ComCall(22, this, "ptr*", transforms3D, "uint", elements, "ptr*", &transform3DGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionTransform3D(transform3DGroup)
    }

    /**
     * Creates an object that represents multiple effects to be applied to a visual subtree. (IDCompositionDevice.CreateEffectGroup)
     * @remarks
     * An effect group enables an application to apply multiple effects to a single visual subtree. 
     * 
     * A new effect group has a default opacity value of 1.0 and no 3D transformations.
     * @returns {IDCompositionEffectGroup} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioneffectgroup">IDCompositionEffectGroup</a>**</b>
     * 
     * The new effect group object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createeffectgroup
     */
    CreateEffectGroup() {
        result := ComCall(23, this, "ptr*", &effectGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionEffectGroup(effectGroup)
    }

    /**
     * Creates a clip object that can be used to restrict the rendering of a visual subtree to a rectangular area. (IDCompositionDevice.CreateRectangleClip)
     * @remarks
     * A newly created clip object has a static value of <a href="https://msdn.microsoft.com/library/6bs3y5ya(VS.71).aspx">–FLT_MAX</a> for the left and top properties, and a static value of –FLT_MAX for the right and bottom properties, effectively making it a no-op clip object.
     * @returns {IDCompositionRectangleClip} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionrectangleclip">IDCompositionRectangleClip</a>**</b>
     * 
     * The new clip object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createrectangleclip
     */
    CreateRectangleClip() {
        result := ComCall(24, this, "ptr*", &clip := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionRectangleClip(clip)
    }

    /**
     * Creates an animation object that is used to animate one or more scalar properties of one or more Microsoft DirectComposition objects. (IDCompositionDevice.CreateAnimation)
     * @remarks
     * A number of DirectComposition object properties can have an animation object as the value of the property. When a property has an animation object as its value, DirectComposition redraws the visual at the refresh rate to reflect the changing value of the property that is being animated.
     * 
     * A newly created animation object does not have any animation segments associated with it. An application must use the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a> interface to build an animation function before setting the animation object as the property of another DirectComposition object.
     * @returns {IDCompositionAnimation} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>**</b>
     * 
     * The new animation object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-createanimation
     */
    CreateAnimation() {
        result := ComCall(25, this, "ptr*", &animation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionAnimation(animation)
    }

    /**
     * Determines whether the DirectComposition device object is still valid.
     * @remarks
     * If the Microsoft DirectX Graphics Infrastructure (DXGI) device is lost, the DirectComposition device associated with the DXGI device is also lost. When it detects a lost device, DirectComposition sends the <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a>  message to all windows that are composing DirectComposition content using the lost device. An application should call <b>CheckDeviceState</b> in response to each  <b>WM_PAINT</b> message to ensure that the DirectComposition device object is still valid. The application must take steps to recover content if the device object becomes invalid. Steps include creating new DXGI and DirectComposition devices, and recreating all content. (It’s not possible to create just a new DXGI device and associate it with the existing DirectComposition device.)  The system ensures that the device object remains valid between <b>WM_PAINT</b> messages.
     * @returns {BOOL} TRUE if the  DirectComposition device object is still valid; otherwise FALSE.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevice-checkdevicestate
     */
    CheckDeviceState() {
        result := ComCall(26, this, "int*", &pfValid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfValid
    }
}
