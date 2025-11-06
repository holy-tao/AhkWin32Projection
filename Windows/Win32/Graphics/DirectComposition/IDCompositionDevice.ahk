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
 * Serves as a factory for all other Microsoft DirectComposition objects and provides methods to control transactional composition.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiondevice
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-commit
     */
    Commit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-waitforcommitcompletion
     */
    WaitForCommitCompletion() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DCOMPOSITION_FRAME_STATISTICS} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-getframestatistics
     */
    GetFrameStatistics() {
        statistics := DCOMPOSITION_FRAME_STATISTICS()
        result := ComCall(5, this, "ptr", statistics, "HRESULT")
        return statistics
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {BOOL} topmost 
     * @returns {IDCompositionTarget} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtargetforhwnd
     */
    CreateTargetForHwnd(hwnd, topmost) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "int", topmost, "ptr*", &target := 0, "HRESULT")
        return IDCompositionTarget(target)
    }

    /**
     * 
     * @returns {IDCompositionVisual} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createvisual
     */
    CreateVisual() {
        result := ComCall(7, this, "ptr*", &visual := 0, "HRESULT")
        return IDCompositionVisual(visual)
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {IDCompositionSurface} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createsurface
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createvirtualsurface
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode) {
        result := ComCall(9, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr*", &virtualSurface := 0, "HRESULT")
        return IDCompositionVirtualSurface(virtualSurface)
    }

    /**
     * 
     * @param {HANDLE} handle 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhandle
     */
    CreateSurfaceFromHandle(handle) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(10, this, "ptr", handle, "ptr*", &surface := 0, "HRESULT")
        return IUnknown(surface)
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhwnd
     */
    CreateSurfaceFromHwnd(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(11, this, "ptr", hwnd, "ptr*", &surface := 0, "HRESULT")
        return IUnknown(surface)
    }

    /**
     * 
     * @returns {IDCompositionTranslateTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtranslatetransform
     */
    CreateTranslateTransform() {
        result := ComCall(12, this, "ptr*", &translateTransform := 0, "HRESULT")
        return IDCompositionTranslateTransform(translateTransform)
    }

    /**
     * 
     * @returns {IDCompositionScaleTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createscaletransform
     */
    CreateScaleTransform() {
        result := ComCall(13, this, "ptr*", &scaleTransform := 0, "HRESULT")
        return IDCompositionScaleTransform(scaleTransform)
    }

    /**
     * 
     * @returns {IDCompositionRotateTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createrotatetransform
     */
    CreateRotateTransform() {
        result := ComCall(14, this, "ptr*", &rotateTransform := 0, "HRESULT")
        return IDCompositionRotateTransform(rotateTransform)
    }

    /**
     * 
     * @returns {IDCompositionSkewTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createskewtransform
     */
    CreateSkewTransform() {
        result := ComCall(15, this, "ptr*", &skewTransform := 0, "HRESULT")
        return IDCompositionSkewTransform(skewTransform)
    }

    /**
     * 
     * @returns {IDCompositionMatrixTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-creatematrixtransform
     */
    CreateMatrixTransform() {
        result := ComCall(16, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IDCompositionMatrixTransform(matrixTransform)
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform>} transforms 
     * @param {Integer} elements 
     * @returns {IDCompositionTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtransformgroup
     */
    CreateTransformGroup(transforms, elements) {
        result := ComCall(17, this, "ptr*", transforms, "uint", elements, "ptr*", &transformGroup := 0, "HRESULT")
        return IDCompositionTransform(transformGroup)
    }

    /**
     * 
     * @returns {IDCompositionTranslateTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtranslatetransform3d
     */
    CreateTranslateTransform3D() {
        result := ComCall(18, this, "ptr*", &translateTransform3D := 0, "HRESULT")
        return IDCompositionTranslateTransform3D(translateTransform3D)
    }

    /**
     * 
     * @returns {IDCompositionScaleTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createscaletransform3d
     */
    CreateScaleTransform3D() {
        result := ComCall(19, this, "ptr*", &scaleTransform3D := 0, "HRESULT")
        return IDCompositionScaleTransform3D(scaleTransform3D)
    }

    /**
     * 
     * @returns {IDCompositionRotateTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createrotatetransform3d
     */
    CreateRotateTransform3D() {
        result := ComCall(20, this, "ptr*", &rotateTransform3D := 0, "HRESULT")
        return IDCompositionRotateTransform3D(rotateTransform3D)
    }

    /**
     * 
     * @returns {IDCompositionMatrixTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-creatematrixtransform3d
     */
    CreateMatrixTransform3D() {
        result := ComCall(21, this, "ptr*", &matrixTransform3D := 0, "HRESULT")
        return IDCompositionMatrixTransform3D(matrixTransform3D)
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform3D>} transforms3D 
     * @param {Integer} elements 
     * @returns {IDCompositionTransform3D} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtransform3dgroup
     */
    CreateTransform3DGroup(transforms3D, elements) {
        result := ComCall(22, this, "ptr*", transforms3D, "uint", elements, "ptr*", &transform3DGroup := 0, "HRESULT")
        return IDCompositionTransform3D(transform3DGroup)
    }

    /**
     * 
     * @returns {IDCompositionEffectGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createeffectgroup
     */
    CreateEffectGroup() {
        result := ComCall(23, this, "ptr*", &effectGroup := 0, "HRESULT")
        return IDCompositionEffectGroup(effectGroup)
    }

    /**
     * 
     * @returns {IDCompositionRectangleClip} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createrectangleclip
     */
    CreateRectangleClip() {
        result := ComCall(24, this, "ptr*", &clip := 0, "HRESULT")
        return IDCompositionRectangleClip(clip)
    }

    /**
     * 
     * @returns {IDCompositionAnimation} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createanimation
     */
    CreateAnimation() {
        result := ComCall(25, this, "ptr*", &animation := 0, "HRESULT")
        return IDCompositionAnimation(animation)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-checkdevicestate
     */
    CheckDeviceState() {
        result := ComCall(26, this, "int*", &pfValid := 0, "HRESULT")
        return pfValid
    }
}
