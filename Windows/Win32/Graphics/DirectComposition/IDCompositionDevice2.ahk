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
 * Serves as a factory for all other Microsoft DirectComposition objects and provides methods to control transactional composition.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiondevice2
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
     * Commits all DirectComposition commands that are pending on this device.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> 
     *        error code. See 
     *        <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a> for a 
     *        list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-commit
     */
    Commit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Waits for the composition engine to finish processing the previous call to the IDCompositionDevice2::Commit method.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-waitforcommitcompletion
     */
    WaitForCommitCompletion() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Retrieves information from the composition engine about composition times and the frame rate.
     * @returns {DCOMPOSITION_FRAME_STATISTICS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ns-dcomptypes-dcomposition_frame_statistics">DCOMPOSITION_FRAME_STATISTICS</a>*</b>
     * 
     * A structure that receives composition times and frame rate information.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-getframestatistics
     */
    GetFrameStatistics() {
        statistics := DCOMPOSITION_FRAME_STATISTICS()
        result := ComCall(5, this, "ptr", statistics, "HRESULT")
        return statistics
    }

    /**
     * Creates a new visual object.
     * @returns {IDCompositionVisual2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual2">IDCompositionVisual2</a>**</b>
     * 
     * The new visual object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createvisual
     */
    CreateVisual() {
        result := ComCall(6, this, "ptr*", &visual := 0, "HRESULT")
        return IDCompositionVisual2(visual)
    }

    /**
     * Creates a Microsoft DirectComposition surface factory object, which can be used to create other DirectComposition surface or virtual surface objects.
     * @param {IUnknown} renderingDevice A pointer to a DirectX device to be used to create DirectComposition surface objects. Must be a pointer to an object implementing the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> interfaces. This parameter must not be NULL.
     * @returns {IDCompositionSurfaceFactory} The newly created surface factory object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createsurfacefactory
     */
    CreateSurfaceFactory(renderingDevice) {
        result := ComCall(7, this, "ptr", renderingDevice, "ptr*", &surfaceFactory := 0, "HRESULT")
        return IDCompositionSurfaceFactory(surfaceFactory)
    }

    /**
     * Creates an updateable surface object that can be associated with one or more visuals for composition.
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
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createsurface
     */
    CreateSurface(width, height, pixelFormat, alphaMode) {
        result := ComCall(8, this, "uint", width, "uint", height, "int", pixelFormat, "int", alphaMode, "ptr*", &surface := 0, "HRESULT")
        return IDCompositionSurface(surface)
    }

    /**
     * Creates a sparsely populated surface that can be associated with one or more visuals for composition.
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
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createvirtualsurface
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode) {
        result := ComCall(9, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr*", &virtualSurface := 0, "HRESULT")
        return IDCompositionVirtualSurface(virtualSurface)
    }

    /**
     * Creates a 2D translation transform object.
     * @returns {IDCompositionTranslateTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontranslatetransform">IDCompositionTranslateTransform</a>**</b>
     * 
     * The new 2D translation transform object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createtranslatetransform
     */
    CreateTranslateTransform() {
        result := ComCall(10, this, "ptr*", &translateTransform := 0, "HRESULT")
        return IDCompositionTranslateTransform(translateTransform)
    }

    /**
     * Creates a 2D scale transform object.
     * @returns {IDCompositionScaleTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionscaletransform">IDCompositionScaleTransform</a>**</b>
     * 
     * The new 2D scale transform object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createscaletransform
     */
    CreateScaleTransform() {
        result := ComCall(11, this, "ptr*", &scaleTransform := 0, "HRESULT")
        return IDCompositionScaleTransform(scaleTransform)
    }

    /**
     * Creates a 2D rotation transform object.
     * @returns {IDCompositionRotateTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionrotatetransform">IDCompositionRotateTransform</a>**</b>
     * 
     * The new rotation transform object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createrotatetransform
     */
    CreateRotateTransform() {
        result := ComCall(12, this, "ptr*", &rotateTransform := 0, "HRESULT")
        return IDCompositionRotateTransform(rotateTransform)
    }

    /**
     * Creates a 2D skew transform object.
     * @returns {IDCompositionSkewTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionskewtransform">IDCompositionSkewTransform</a>**</b>
     * 
     * The new 2D skew transform object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createskewtransform
     */
    CreateSkewTransform() {
        result := ComCall(13, this, "ptr*", &skewTransform := 0, "HRESULT")
        return IDCompositionSkewTransform(skewTransform)
    }

    /**
     * Creates a 2D 3-by-2 matrix transform object.
     * @returns {IDCompositionMatrixTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionmatrixtransform">IDCompositionMatrixTransform</a>**</b>
     * 
     * The new matrix transform object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-creatematrixtransform
     */
    CreateMatrixTransform() {
        result := ComCall(14, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IDCompositionMatrixTransform(matrixTransform)
    }

    /**
     * Creates a 2D transform group object that holds an array of 2D transform objects.
     * @param {Pointer<IDCompositionTransform>} transforms Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform">IDCompositionTransform</a>**</b>
     * 
     * An array of 2D transform objects that make up this transform group.
     * @param {Integer} elements Type: <b>UINT</b>
     * 
     * The number of elements in the <i>transforms</i> array.
     * @returns {IDCompositionTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform">IDCompositionTransform</a>**</b>
     * 
     * The new transform group object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createtransformgroup
     */
    CreateTransformGroup(transforms, elements) {
        result := ComCall(15, this, "ptr*", transforms, "uint", elements, "ptr*", &transformGroup := 0, "HRESULT")
        return IDCompositionTransform(transformGroup)
    }

    /**
     * Creates a 3D translation transform object.
     * @returns {IDCompositionTranslateTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontranslatetransform3d">IDCompositionTranslateTransform3D</a>**</b>
     * 
     * The new 3D translation transform object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createtranslatetransform3d
     */
    CreateTranslateTransform3D() {
        result := ComCall(16, this, "ptr*", &translateTransform3D := 0, "HRESULT")
        return IDCompositionTranslateTransform3D(translateTransform3D)
    }

    /**
     * Creates a 3D scale transform object.
     * @returns {IDCompositionScaleTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionscaletransform3d">IDCompositionScaleTransform3D</a>**</b>
     * 
     * The new 3D scale transform object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createscaletransform3d
     */
    CreateScaleTransform3D() {
        result := ComCall(17, this, "ptr*", &scaleTransform3D := 0, "HRESULT")
        return IDCompositionScaleTransform3D(scaleTransform3D)
    }

    /**
     * Creates a 3D rotation transform object.
     * @returns {IDCompositionRotateTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionrotatetransform3d">IDCompositionRotateTransform3D</a>**</b>
     * 
     * The new 3D rotation transform object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createrotatetransform3d
     */
    CreateRotateTransform3D() {
        result := ComCall(18, this, "ptr*", &rotateTransform3D := 0, "HRESULT")
        return IDCompositionRotateTransform3D(rotateTransform3D)
    }

    /**
     * Creates a 3D 4-by-4 matrix transform object.
     * @returns {IDCompositionMatrixTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionmatrixtransform3d">IDCompositionMatrixTransform3D</a>**</b>
     * 
     * The new 3D matrix transform object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-creatematrixtransform3d
     */
    CreateMatrixTransform3D() {
        result := ComCall(19, this, "ptr*", &matrixTransform3D := 0, "HRESULT")
        return IDCompositionMatrixTransform3D(matrixTransform3D)
    }

    /**
     * Creates a 3D transform group object that holds an array of 3D transform objects.
     * @param {Pointer<IDCompositionTransform3D>} transforms3D Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform3d">IDCompositionTransform3D</a>**</b>
     * 
     * An array of 3D transform objects that make up this transform group.
     * @param {Integer} elements Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the <i>transforms</i> array.
     * @returns {IDCompositionTransform3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform3d">IDCompositionTransform3D</a>**</b>
     * 
     * The new 3D transform group object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createtransform3dgroup
     */
    CreateTransform3DGroup(transforms3D, elements) {
        result := ComCall(20, this, "ptr*", transforms3D, "uint", elements, "ptr*", &transform3DGroup := 0, "HRESULT")
        return IDCompositionTransform3D(transform3DGroup)
    }

    /**
     * Creates an object that represents multiple effects to be applied to a visual subtree.
     * @returns {IDCompositionEffectGroup} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioneffectgroup">IDCompositionEffectGroup</a>**</b>
     * 
     * The new effect group object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createeffectgroup
     */
    CreateEffectGroup() {
        result := ComCall(21, this, "ptr*", &effectGroup := 0, "HRESULT")
        return IDCompositionEffectGroup(effectGroup)
    }

    /**
     * Creates a clip object that can be used to restrict the rendering of a visual subtree to a rectangular area.
     * @returns {IDCompositionRectangleClip} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionrectangleclip">IDCompositionRectangleClip</a>**</b>
     * 
     * The new clip object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createrectangleclip
     */
    CreateRectangleClip() {
        result := ComCall(22, this, "ptr*", &clip := 0, "HRESULT")
        return IDCompositionRectangleClip(clip)
    }

    /**
     * Creates an animation object that is used to animate one or more scalar properties of one or more Microsoft DirectComposition objects.
     * @returns {IDCompositionAnimation} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>**</b>
     * 
     * The new animation object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice2-createanimation
     */
    CreateAnimation() {
        result := ComCall(23, this, "ptr*", &animation := 0, "HRESULT")
        return IDCompositionAnimation(animation)
    }
}
