#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DCOMPOSITION_FRAME_STATISTICS.ahk
#Include .\IDCompositionVisual2.ahk
#Include .\IDCompositionSurfaceFactory.ahk
#Include .\IDCompositionSurface.ahk
#Include .\IDCompositionVirtualSurface.ahk
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
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Serves as a factory for all other Microsoft DirectComposition objects and provides methods to control transactional composition. (IDCompositionDevice2)
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiondevice2
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionDevice2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionDevice2
     * @type {Guid}
     */
    static IID => Guid("{75f6468d-1b8e-447c-9bc6-75fea80b5b25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit", "WaitForCommitCompletion", "GetFrameStatistics", "CreateVisual", "CreateSurfaceFactory", "CreateSurface", "CreateVirtualSurface", "CreateTranslateTransform", "CreateScaleTransform", "CreateRotateTransform", "CreateSkewTransform", "CreateMatrixTransform", "CreateTransformGroup", "CreateTranslateTransform3D", "CreateScaleTransform3D", "CreateRotateTransform3D", "CreateMatrixTransform3D", "CreateTransform3DGroup", "CreateEffectGroup", "CreateRectangleClip", "CreateAnimation"]

    /**
     * Commits all DirectComposition commands that are pending on this device. (IDCompositionDevice2.Commit)
     * @remarks
     * Calls to DirectComposition methods are always batched and executed atomically as 
     *     a single transaction. Calls take effect only when 
     *     <b>IDCompositionDevice2::Commit</b> is 
     *     called, at which time all pending method calls for a device are executed at once.
     * 
     * An application that uses multiple devices must call 
     *     <b>Commit</b> for each device separately. 
     *     However, because the composition engine processes the calls individually, the batch of commands might not take 
     *     effect at the same time.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> 
     *        error code. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a> for a 
     *        list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-commit
     */
    Commit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Waits for the composition engine to finish processing the previous call to the IDCompositionDevice2::Commit method.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-waitforcommitcompletion
     */
    WaitForCommitCompletion() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Retrieves information from the composition engine about composition times and the frame rate.
     * @remarks
     * This method retrieves timing information about the composition engine that an application can use to synchronize the rasterization of bitmaps with independent animations.
     * @returns {DCOMPOSITION_FRAME_STATISTICS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ns-dcomptypes-dcomposition_frame_statistics">DCOMPOSITION_FRAME_STATISTICS</a>*</b>
     * 
     * A structure that receives composition times and frame rate information.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-getframestatistics
     */
    GetFrameStatistics() {
        statistics := DCOMPOSITION_FRAME_STATISTICS()
        result := ComCall(5, this, "ptr", statistics, "HRESULT")
        return statistics
    }

    /**
     * Creates a new visual object.
     * @remarks
     * A new visual object has a static value of zero for the OffsetX and OffsetY properties, and NULL for the Transform, Clip, and Content properties. Initially, the visual  does not cause the contents of a window to change. The visual must be added as a child of another visual, or as the root of a composition target, before it can affect the appearance of a window.
     * @returns {IDCompositionVisual2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual2">IDCompositionVisual2</a>**</b>
     * 
     * The new visual object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createvisual
     */
    CreateVisual() {
        result := ComCall(6, this, "ptr*", &visual := 0, "HRESULT")
        return IDCompositionVisual2(visual)
    }

    /**
     * Creates a Microsoft DirectComposition surface factory object, which can be used to create other DirectComposition surface or virtual surface objects.
     * @remarks
     * A surface factory allows an application to simultaneously use more than one single DXGI or Direct2D device with DirectComposition. Each surface factory has a permanent association with one DXGI or Direct2D device, but a DirectComposition device may have any number of surface factories.
     * 
     * 
     * 
     * Each surface factory manages resources independently from the others. In particular, DirectComposition pools surface allocations to mitigate surface allocation and deallocation costs. This pool is done on a per-surface factory basis.
     * 
     * 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-dcompositioncreatedevice2">DCompositionCreateDevice2</a> function is called with a non-NULL <i>renderingDevice</i> parameter, the returned DirectComposition device object has an implicit surface factory under the covers associated with the given rendering device. This implicit surface factory is used to service the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-createsurface">IDCompositionDevice::CreateSurface</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-createvirtualsurface">IDCompositionDevice::CreateVirtualSurface</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice2-createsurface">IDCompositionDevice2::CreateSurface</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice2-createvirtualsurface">IDCompositionDevice2::CreateVirtualSurface</a> methods.
     * 
     * 
     * 
     * A surface object remains alive as long as any of the surfaces or virtual surfaces that it created remain alive, either directly because the application holds a direct reference, or indirectly because one or more such surfaces are associated with one or more visual objects.
     * @param {IUnknown} renderingDevice A pointer to a DirectX device to be used to create DirectComposition surface objects. Must be a pointer to an object implementing the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> interfaces. This parameter must not be NULL.
     * @returns {IDCompositionSurfaceFactory} The newly created surface factory object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createsurfacefactory
     */
    CreateSurfaceFactory(renderingDevice) {
        result := ComCall(7, this, "ptr", renderingDevice, "ptr*", &surfaceFactory := 0, "HRESULT")
        return IDCompositionSurfaceFactory(surfaceFactory)
    }

    /**
     * Creates an updateable surface object that can be associated with one or more visuals for composition.
     * @remarks
     * A Microsoft DirectComposition surface is a rectangular array of pixels that can be associated with a visual for composition. 
     * 
     * A newly created surface object is in an uninitialized state. While it is uninitialized, the surface has no effect on the composition of the visual tree. It behaves exactly like a surface that has  100% transparent pixels.
     * 
     * 
     * 
     * To initialize the surface with pixel data, use the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-enddraw">IDCompositionSurface::EndDraw</a> methods. The first call to this method must cover the entire surface area to provide an initial value for every pixel. Subsequent calls may specify smaller sub-rectangles of the surface to update.
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
     * The width of the surface, in pixels. Constrained by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> of the rendering device that was passed in at the time the DirectComposition device was created.
     * @param {Integer} height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The height of the surface, in pixels. Constrained by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> of the rendering device that was passed in at the time the DirectComposition device was created.
     * @param {Integer} pixelFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The pixel format of the surface.
     * @param {Integer} alphaMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode">DXGI_ALPHA_MODE</a></b>
     * @returns {IDCompositionSurface} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsurface">IDCompositionSurface</a>**</b>
     * 
     * The newly created surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createsurface
     */
    CreateSurface(width, height, pixelFormat, alphaMode) {
        result := ComCall(8, this, "uint", width, "uint", height, "int", pixelFormat, "int", alphaMode, "ptr*", &surface := 0, "HRESULT")
        return IDCompositionSurface(surface)
    }

    /**
     * Creates a sparsely populated surface that can be associated with one or more visuals for composition. (IDCompositionDevice2.CreateVirtualSurface)
     * @remarks
     * A Microsoft DirectComposition sparse surface is a logical object that behaves like a rectangular array of pixels that can be associated with a visual for composition. The surface is not necessarily backed by any physical video or system memory for every one of its pixels. The application can realize or virtualize parts of the logical surface at different times.
     * 
     * 
     * 
     * A newly created surface object is in an uninitialized state. While it is uninitialized, the surface has no effect on the composition of the visual tree. It behaves exactly like a surface that is initialized with 100% transparent pixels. 
     * 
     * To initialize the surface with pixel data, use the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-enddraw">IDCompositionSurface::EndDraw</a> methods. This method not only provides pixels for the surface, but it also allocates actual storage space for those pixels. The memory allocation persists until the application returns some of the memory to the system. The application can free part or all of the allocated memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvirtualsurface-trim">IDCompositionVirtualSurface::Trim</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createvirtualsurface
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode) {
        result := ComCall(9, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr*", &virtualSurface := 0, "HRESULT")
        return IDCompositionVirtualSurface(virtualSurface)
    }

    /**
     * Creates a 2D translation transform object.
     * @remarks
     * A new 2D translation transform object has a static value of zero for the OffsetX and OffsetY properties.
     * @returns {IDCompositionTranslateTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontranslatetransform">IDCompositionTranslateTransform</a>**</b>
     * 
     * The new 2D translation transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtranslatetransform
     */
    CreateTranslateTransform() {
        result := ComCall(10, this, "ptr*", &translateTransform := 0, "HRESULT")
        return IDCompositionTranslateTransform(translateTransform)
    }

    /**
     * Creates a 2D scale transform object.
     * @remarks
     * A new 2D scale transform object has a static value of zero for the ScaleX, ScaleY, CenterX, and CenterY properties.
     * @returns {IDCompositionScaleTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionscaletransform">IDCompositionScaleTransform</a>**</b>
     * 
     * The new 2D scale transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createscaletransform
     */
    CreateScaleTransform() {
        result := ComCall(11, this, "ptr*", &scaleTransform := 0, "HRESULT")
        return IDCompositionScaleTransform(scaleTransform)
    }

    /**
     * Creates a 2D rotation transform object. (IDCompositionDevice2.CreateRotateTransform)
     * @remarks
     * A new 2D rotation transform object has a static value of zero for the Angle, CenterX, and CenterY properties.
     * @returns {IDCompositionRotateTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionrotatetransform">IDCompositionRotateTransform</a>**</b>
     * 
     * The new rotation transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createrotatetransform
     */
    CreateRotateTransform() {
        result := ComCall(12, this, "ptr*", &rotateTransform := 0, "HRESULT")
        return IDCompositionRotateTransform(rotateTransform)
    }

    /**
     * Creates a 2D skew transform object.
     * @remarks
     * A new 2D skew transform object has a static value of zero for the AngleX, AngleY, CenterX, and CenterY properties.
     * @returns {IDCompositionSkewTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionskewtransform">IDCompositionSkewTransform</a>**</b>
     * 
     * The new 2D skew transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createskewtransform
     */
    CreateSkewTransform() {
        result := ComCall(13, this, "ptr*", &skewTransform := 0, "HRESULT")
        return IDCompositionSkewTransform(skewTransform)
    }

    /**
     * Creates a 2D 3-by-2 matrix transform object. (IDCompositionDevice2.CreateMatrixTransform)
     * @remarks
     * A new matrix transform object has the identity matrix as its initial value. The identity matrix is the 3x2 matrix with ones on the main diagonal and zeros elsewhere, as shown in the following illustration. 
     * 
     * <img alt="Three-by-two identity matrix" src="./images/identity_3x2matrix.png"/>
     * 
     * When an identity transform is applied to an object, it does not change the position, shape, or size of the object. It is similar to the way that multiplying a number by one does not change the number. Any transform other than the identity transform will modify the position, shape, and/or size of objects.
     * @returns {IDCompositionMatrixTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionmatrixtransform">IDCompositionMatrixTransform</a>**</b>
     * 
     * The new matrix transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-creatematrixtransform
     */
    CreateMatrixTransform() {
        result := ComCall(14, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IDCompositionMatrixTransform(matrixTransform)
    }

    /**
     * Creates a 2D transform group object that holds an array of 2D transform objects.
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtransformgroup
     */
    CreateTransformGroup(transforms, elements) {
        result := ComCall(15, this, "ptr*", transforms, "uint", elements, "ptr*", &transformGroup := 0, "HRESULT")
        return IDCompositionTransform(transformGroup)
    }

    /**
     * Creates a 3D translation transform object.
     * @remarks
     * A newly created 3D translation transform has a static value of 0 for the OffsetX, OffsetY, and OffsetZ properties.
     * @returns {IDCompositionTranslateTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontranslatetransform3d">IDCompositionTranslateTransform3D</a>**</b>
     * 
     * The new 3D translation transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtranslatetransform3d
     */
    CreateTranslateTransform3D() {
        result := ComCall(16, this, "ptr*", &translateTransform3D := 0, "HRESULT")
        return IDCompositionTranslateTransform3D(translateTransform3D)
    }

    /**
     * Creates a 3D scale transform object.
     * @remarks
     * A new 3D scale transform object has a static value of 1.0 for the ScaleX, ScaleY, and ScaleZ properties.
     * @returns {IDCompositionScaleTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionscaletransform3d">IDCompositionScaleTransform3D</a>**</b>
     * 
     * The new 3D scale transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createscaletransform3d
     */
    CreateScaleTransform3D() {
        result := ComCall(17, this, "ptr*", &scaleTransform3D := 0, "HRESULT")
        return IDCompositionScaleTransform3D(scaleTransform3D)
    }

    /**
     * Creates a 3D rotation transform object.
     * @remarks
     * A new 3D rotation transform object has a default static value of zero for the Angle, CenterX, CenterY, CenterZ, AxisX, and AxisY properties, and a default static value of 1.0 for the AxisZ property.
     * @returns {IDCompositionRotateTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionrotatetransform3d">IDCompositionRotateTransform3D</a>**</b>
     * 
     * The new 3D rotation transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createrotatetransform3d
     */
    CreateRotateTransform3D() {
        result := ComCall(18, this, "ptr*", &rotateTransform3D := 0, "HRESULT")
        return IDCompositionRotateTransform3D(rotateTransform3D)
    }

    /**
     * Creates a 3D 4-by-4 matrix transform object. (IDCompositionDevice2.CreateMatrixTransform3D)
     * @remarks
     * The new 3D matrix transform has the identity matrix as its value. The identity matrix is the 4-by-4 matrix with ones on the main diagonal and zeros elsewhere, as shown in the following illustration. 
     * 
     * <img alt="Four-by-four identity matrix" src="./images/identity_4x4matrix.png"/>
     * 
     * When an identity transform is applied to an object, it does not change the position, shape, or size of the object. It is similar to the way that multiplying a number by one does not change the number. Any transform other than the identity transform will modify the position, shape, and/or size of objects.
     * @returns {IDCompositionMatrixTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionmatrixtransform3d">IDCompositionMatrixTransform3D</a>**</b>
     * 
     * The new 3D matrix transform object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-creatematrixtransform3d
     */
    CreateMatrixTransform3D() {
        result := ComCall(19, this, "ptr*", &matrixTransform3D := 0, "HRESULT")
        return IDCompositionMatrixTransform3D(matrixTransform3D)
    }

    /**
     * Creates a 3D transform group object that holds an array of 3D transform objects.
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtransform3dgroup
     */
    CreateTransform3DGroup(transforms3D, elements) {
        result := ComCall(20, this, "ptr*", transforms3D, "uint", elements, "ptr*", &transform3DGroup := 0, "HRESULT")
        return IDCompositionTransform3D(transform3DGroup)
    }

    /**
     * Creates an object that represents multiple effects to be applied to a visual subtree. (IDCompositionDevice2.CreateEffectGroup)
     * @remarks
     * An effect group enables an application to apply multiple effects to a single visual subtree. 
     * 
     * A new effect group has a default opacity value of 1.0 and no 3D transformations.
     * 
     * To set the opacity and transform values, use the corresponding methods on the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioneffectgroup">IDCompositionEffectGroup</a> that was created.
     * @returns {IDCompositionEffectGroup} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioneffectgroup">IDCompositionEffectGroup</a>**</b>
     * 
     * The new effect group object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createeffectgroup
     */
    CreateEffectGroup() {
        result := ComCall(21, this, "ptr*", &effectGroup := 0, "HRESULT")
        return IDCompositionEffectGroup(effectGroup)
    }

    /**
     * Creates a clip object that can be used to restrict the rendering of a visual subtree to a rectangular area. (IDCompositionDevice2.CreateRectangleClip)
     * @remarks
     * A newly created clip object has a static value of <a href="https://msdn.microsoft.com/library/6bs3y5ya(VS.71).aspx">FLT_MAX</a> for the left and top properties, and a static value of –FLT_MAX for the right and bottom properties, effectively making it a no-op clip object.
     * @returns {IDCompositionRectangleClip} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionrectangleclip">IDCompositionRectangleClip</a>**</b>
     * 
     * The new clip object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createrectangleclip
     */
    CreateRectangleClip() {
        result := ComCall(22, this, "ptr*", &clip := 0, "HRESULT")
        return IDCompositionRectangleClip(clip)
    }

    /**
     * Creates an animation object that is used to animate one or more scalar properties of one or more Microsoft DirectComposition objects. (IDCompositionDevice2.CreateAnimation)
     * @remarks
     * A number of DirectComposition object properties can have an animation object as the value of the property. When a property has an animation object as its value, DirectComposition redraws the visual at the refresh rate to reflect the changing value of the property that is being animated.
     * 
     * A newly created animation object does not have any animation segments associated with it. An application must use the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a> interface to build an animation function before setting the animation object as the property of another DirectComposition object.
     * @returns {IDCompositionAnimation} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>**</b>
     * 
     * The new animation object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createanimation
     */
    CreateAnimation() {
        result := ComCall(23, this, "ptr*", &animation := 0, "HRESULT")
        return IDCompositionAnimation(animation)
    }
}
