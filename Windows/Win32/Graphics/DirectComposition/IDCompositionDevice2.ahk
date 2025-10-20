#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-commit
     */
    Commit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-waitforcommitcompletion
     */
    WaitForCommitCompletion() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DCOMPOSITION_FRAME_STATISTICS>} statistics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-getframestatistics
     */
    GetFrameStatistics(statistics) {
        result := ComCall(5, this, "ptr", statistics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionVisual2>} visual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createvisual
     */
    CreateVisual(visual) {
        result := ComCall(6, this, "ptr*", visual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} renderingDevice 
     * @param {Pointer<IDCompositionSurfaceFactory>} surfaceFactory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createsurfacefactory
     */
    CreateSurfaceFactory(renderingDevice, surfaceFactory) {
        result := ComCall(7, this, "ptr", renderingDevice, "ptr*", surfaceFactory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {Pointer<IDCompositionSurface>} surface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createsurface
     */
    CreateSurface(width, height, pixelFormat, alphaMode, surface) {
        result := ComCall(8, this, "uint", width, "uint", height, "int", pixelFormat, "int", alphaMode, "ptr*", surface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} initialWidth 
     * @param {Integer} initialHeight 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {Pointer<IDCompositionVirtualSurface>} virtualSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createvirtualsurface
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode, virtualSurface) {
        result := ComCall(9, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr*", virtualSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTranslateTransform>} translateTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtranslatetransform
     */
    CreateTranslateTransform(translateTransform) {
        result := ComCall(10, this, "ptr*", translateTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionScaleTransform>} scaleTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createscaletransform
     */
    CreateScaleTransform(scaleTransform) {
        result := ComCall(11, this, "ptr*", scaleTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionRotateTransform>} rotateTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createrotatetransform
     */
    CreateRotateTransform(rotateTransform) {
        result := ComCall(12, this, "ptr*", rotateTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionSkewTransform>} skewTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createskewtransform
     */
    CreateSkewTransform(skewTransform) {
        result := ComCall(13, this, "ptr*", skewTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionMatrixTransform>} matrixTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-creatematrixtransform
     */
    CreateMatrixTransform(matrixTransform) {
        result := ComCall(14, this, "ptr*", matrixTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform>} transforms 
     * @param {Integer} elements 
     * @param {Pointer<IDCompositionTransform>} transformGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtransformgroup
     */
    CreateTransformGroup(transforms, elements, transformGroup) {
        result := ComCall(15, this, "ptr*", transforms, "uint", elements, "ptr*", transformGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTranslateTransform3D>} translateTransform3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtranslatetransform3d
     */
    CreateTranslateTransform3D(translateTransform3D) {
        result := ComCall(16, this, "ptr*", translateTransform3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionScaleTransform3D>} scaleTransform3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createscaletransform3d
     */
    CreateScaleTransform3D(scaleTransform3D) {
        result := ComCall(17, this, "ptr*", scaleTransform3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionRotateTransform3D>} rotateTransform3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createrotatetransform3d
     */
    CreateRotateTransform3D(rotateTransform3D) {
        result := ComCall(18, this, "ptr*", rotateTransform3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionMatrixTransform3D>} matrixTransform3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-creatematrixtransform3d
     */
    CreateMatrixTransform3D(matrixTransform3D) {
        result := ComCall(19, this, "ptr*", matrixTransform3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform3D>} transforms3D 
     * @param {Integer} elements 
     * @param {Pointer<IDCompositionTransform3D>} transform3DGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtransform3dgroup
     */
    CreateTransform3DGroup(transforms3D, elements, transform3DGroup) {
        result := ComCall(20, this, "ptr*", transforms3D, "uint", elements, "ptr*", transform3DGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionEffectGroup>} effectGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createeffectgroup
     */
    CreateEffectGroup(effectGroup) {
        result := ComCall(21, this, "ptr*", effectGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionRectangleClip>} clip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createrectangleclip
     */
    CreateRectangleClip(clip) {
        result := ComCall(22, this, "ptr*", clip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createanimation
     */
    CreateAnimation(animation) {
        result := ComCall(23, this, "ptr*", animation, "HRESULT")
        return result
    }
}
