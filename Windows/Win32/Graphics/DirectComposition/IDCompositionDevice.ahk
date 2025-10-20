#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
     * @param {Pointer<DCOMPOSITION_FRAME_STATISTICS>} statistics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-getframestatistics
     */
    GetFrameStatistics(statistics) {
        result := ComCall(5, this, "ptr", statistics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {BOOL} topmost 
     * @param {Pointer<IDCompositionTarget>} target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtargetforhwnd
     */
    CreateTargetForHwnd(hwnd, topmost, target) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "int", topmost, "ptr*", target, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionVisual>} visual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createvisual
     */
    CreateVisual(visual) {
        result := ComCall(7, this, "ptr*", visual, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createsurface
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createvirtualsurface
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode, virtualSurface) {
        result := ComCall(9, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr*", virtualSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} handle 
     * @param {Pointer<IUnknown>} surface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhandle
     */
    CreateSurfaceFromHandle(handle, surface) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(10, this, "ptr", handle, "ptr*", surface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IUnknown>} surface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhwnd
     */
    CreateSurfaceFromHwnd(hwnd, surface) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(11, this, "ptr", hwnd, "ptr*", surface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTranslateTransform>} translateTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtranslatetransform
     */
    CreateTranslateTransform(translateTransform) {
        result := ComCall(12, this, "ptr*", translateTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionScaleTransform>} scaleTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createscaletransform
     */
    CreateScaleTransform(scaleTransform) {
        result := ComCall(13, this, "ptr*", scaleTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionRotateTransform>} rotateTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createrotatetransform
     */
    CreateRotateTransform(rotateTransform) {
        result := ComCall(14, this, "ptr*", rotateTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionSkewTransform>} skewTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createskewtransform
     */
    CreateSkewTransform(skewTransform) {
        result := ComCall(15, this, "ptr*", skewTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionMatrixTransform>} matrixTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-creatematrixtransform
     */
    CreateMatrixTransform(matrixTransform) {
        result := ComCall(16, this, "ptr*", matrixTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform>} transforms 
     * @param {Integer} elements 
     * @param {Pointer<IDCompositionTransform>} transformGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtransformgroup
     */
    CreateTransformGroup(transforms, elements, transformGroup) {
        result := ComCall(17, this, "ptr*", transforms, "uint", elements, "ptr*", transformGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTranslateTransform3D>} translateTransform3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtranslatetransform3d
     */
    CreateTranslateTransform3D(translateTransform3D) {
        result := ComCall(18, this, "ptr*", translateTransform3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionScaleTransform3D>} scaleTransform3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createscaletransform3d
     */
    CreateScaleTransform3D(scaleTransform3D) {
        result := ComCall(19, this, "ptr*", scaleTransform3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionRotateTransform3D>} rotateTransform3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createrotatetransform3d
     */
    CreateRotateTransform3D(rotateTransform3D) {
        result := ComCall(20, this, "ptr*", rotateTransform3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionMatrixTransform3D>} matrixTransform3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-creatematrixtransform3d
     */
    CreateMatrixTransform3D(matrixTransform3D) {
        result := ComCall(21, this, "ptr*", matrixTransform3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform3D>} transforms3D 
     * @param {Integer} elements 
     * @param {Pointer<IDCompositionTransform3D>} transform3DGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createtransform3dgroup
     */
    CreateTransform3DGroup(transforms3D, elements, transform3DGroup) {
        result := ComCall(22, this, "ptr*", transforms3D, "uint", elements, "ptr*", transform3DGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionEffectGroup>} effectGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createeffectgroup
     */
    CreateEffectGroup(effectGroup) {
        result := ComCall(23, this, "ptr*", effectGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionRectangleClip>} clip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createrectangleclip
     */
    CreateRectangleClip(clip) {
        result := ComCall(24, this, "ptr*", clip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-createanimation
     */
    CreateAnimation(animation) {
        result := ComCall(25, this, "ptr*", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfValid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice-checkdevicestate
     */
    CheckDeviceState(pfValid) {
        result := ComCall(26, this, "ptr", pfValid, "HRESULT")
        return result
    }
}
