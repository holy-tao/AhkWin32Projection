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
     * @returns {DCOMPOSITION_FRAME_STATISTICS} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-getframestatistics
     */
    GetFrameStatistics() {
        statistics := DCOMPOSITION_FRAME_STATISTICS()
        result := ComCall(5, this, "ptr", statistics, "HRESULT")
        return statistics
    }

    /**
     * 
     * @returns {IDCompositionVisual2} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createvisual
     */
    CreateVisual() {
        result := ComCall(6, this, "ptr*", &visual := 0, "HRESULT")
        return IDCompositionVisual2(visual)
    }

    /**
     * 
     * @param {IUnknown} renderingDevice 
     * @returns {IDCompositionSurfaceFactory} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createsurfacefactory
     */
    CreateSurfaceFactory(renderingDevice) {
        result := ComCall(7, this, "ptr", renderingDevice, "ptr*", &surfaceFactory := 0, "HRESULT")
        return IDCompositionSurfaceFactory(surfaceFactory)
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {IDCompositionSurface} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createsurface
     */
    CreateSurface(width, height, pixelFormat, alphaMode) {
        result := ComCall(8, this, "uint", width, "uint", height, "int", pixelFormat, "int", alphaMode, "ptr*", &surface := 0, "HRESULT")
        return IDCompositionSurface(surface)
    }

    /**
     * 
     * @param {Integer} initialWidth 
     * @param {Integer} initialHeight 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {IDCompositionVirtualSurface} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createvirtualsurface
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode) {
        result := ComCall(9, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr*", &virtualSurface := 0, "HRESULT")
        return IDCompositionVirtualSurface(virtualSurface)
    }

    /**
     * 
     * @returns {IDCompositionTranslateTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtranslatetransform
     */
    CreateTranslateTransform() {
        result := ComCall(10, this, "ptr*", &translateTransform := 0, "HRESULT")
        return IDCompositionTranslateTransform(translateTransform)
    }

    /**
     * 
     * @returns {IDCompositionScaleTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createscaletransform
     */
    CreateScaleTransform() {
        result := ComCall(11, this, "ptr*", &scaleTransform := 0, "HRESULT")
        return IDCompositionScaleTransform(scaleTransform)
    }

    /**
     * 
     * @returns {IDCompositionRotateTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createrotatetransform
     */
    CreateRotateTransform() {
        result := ComCall(12, this, "ptr*", &rotateTransform := 0, "HRESULT")
        return IDCompositionRotateTransform(rotateTransform)
    }

    /**
     * 
     * @returns {IDCompositionSkewTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createskewtransform
     */
    CreateSkewTransform() {
        result := ComCall(13, this, "ptr*", &skewTransform := 0, "HRESULT")
        return IDCompositionSkewTransform(skewTransform)
    }

    /**
     * 
     * @returns {IDCompositionMatrixTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-creatematrixtransform
     */
    CreateMatrixTransform() {
        result := ComCall(14, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IDCompositionMatrixTransform(matrixTransform)
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform>} transforms 
     * @param {Integer} elements 
     * @returns {IDCompositionTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtransformgroup
     */
    CreateTransformGroup(transforms, elements) {
        result := ComCall(15, this, "ptr*", transforms, "uint", elements, "ptr*", &transformGroup := 0, "HRESULT")
        return IDCompositionTransform(transformGroup)
    }

    /**
     * 
     * @returns {IDCompositionTranslateTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtranslatetransform3d
     */
    CreateTranslateTransform3D() {
        result := ComCall(16, this, "ptr*", &translateTransform3D := 0, "HRESULT")
        return IDCompositionTranslateTransform3D(translateTransform3D)
    }

    /**
     * 
     * @returns {IDCompositionScaleTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createscaletransform3d
     */
    CreateScaleTransform3D() {
        result := ComCall(17, this, "ptr*", &scaleTransform3D := 0, "HRESULT")
        return IDCompositionScaleTransform3D(scaleTransform3D)
    }

    /**
     * 
     * @returns {IDCompositionRotateTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createrotatetransform3d
     */
    CreateRotateTransform3D() {
        result := ComCall(18, this, "ptr*", &rotateTransform3D := 0, "HRESULT")
        return IDCompositionRotateTransform3D(rotateTransform3D)
    }

    /**
     * 
     * @returns {IDCompositionMatrixTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-creatematrixtransform3d
     */
    CreateMatrixTransform3D() {
        result := ComCall(19, this, "ptr*", &matrixTransform3D := 0, "HRESULT")
        return IDCompositionMatrixTransform3D(matrixTransform3D)
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform3D>} transforms3D 
     * @param {Integer} elements 
     * @returns {IDCompositionTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createtransform3dgroup
     */
    CreateTransform3DGroup(transforms3D, elements) {
        result := ComCall(20, this, "ptr*", transforms3D, "uint", elements, "ptr*", &transform3DGroup := 0, "HRESULT")
        return IDCompositionTransform3D(transform3DGroup)
    }

    /**
     * 
     * @returns {IDCompositionEffectGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createeffectgroup
     */
    CreateEffectGroup() {
        result := ComCall(21, this, "ptr*", &effectGroup := 0, "HRESULT")
        return IDCompositionEffectGroup(effectGroup)
    }

    /**
     * 
     * @returns {IDCompositionRectangleClip} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createrectangleclip
     */
    CreateRectangleClip() {
        result := ComCall(22, this, "ptr*", &clip := 0, "HRESULT")
        return IDCompositionRectangleClip(clip)
    }

    /**
     * 
     * @returns {IDCompositionAnimation} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice2-createanimation
     */
    CreateAnimation() {
        result := ComCall(23, this, "ptr*", &animation := 0, "HRESULT")
        return IDCompositionAnimation(animation)
    }
}
