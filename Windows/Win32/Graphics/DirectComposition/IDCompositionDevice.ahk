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
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WaitForCommitCompletion() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DCOMPOSITION_FRAME_STATISTICS>} statistics 
     * @returns {HRESULT} 
     */
    GetFrameStatistics(statistics) {
        result := ComCall(5, this, "ptr", statistics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {BOOL} topmost 
     * @param {Pointer<IDCompositionTarget>} target 
     * @returns {HRESULT} 
     */
    CreateTargetForHwnd(hwnd, topmost, target) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "int", topmost, "ptr", target, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionVisual>} visual 
     * @returns {HRESULT} 
     */
    CreateVisual(visual) {
        result := ComCall(7, this, "ptr", visual, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateSurface(width, height, pixelFormat, alphaMode, surface) {
        result := ComCall(8, this, "uint", width, "uint", height, "int", pixelFormat, "int", alphaMode, "ptr", surface, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode, virtualSurface) {
        result := ComCall(9, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr", virtualSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} handle 
     * @param {Pointer<IUnknown>} surface 
     * @returns {HRESULT} 
     */
    CreateSurfaceFromHandle(handle, surface) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(10, this, "ptr", handle, "ptr", surface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IUnknown>} surface 
     * @returns {HRESULT} 
     */
    CreateSurfaceFromHwnd(hwnd, surface) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(11, this, "ptr", hwnd, "ptr", surface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTranslateTransform>} translateTransform 
     * @returns {HRESULT} 
     */
    CreateTranslateTransform(translateTransform) {
        result := ComCall(12, this, "ptr", translateTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionScaleTransform>} scaleTransform 
     * @returns {HRESULT} 
     */
    CreateScaleTransform(scaleTransform) {
        result := ComCall(13, this, "ptr", scaleTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionRotateTransform>} rotateTransform 
     * @returns {HRESULT} 
     */
    CreateRotateTransform(rotateTransform) {
        result := ComCall(14, this, "ptr", rotateTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionSkewTransform>} skewTransform 
     * @returns {HRESULT} 
     */
    CreateSkewTransform(skewTransform) {
        result := ComCall(15, this, "ptr", skewTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionMatrixTransform>} matrixTransform 
     * @returns {HRESULT} 
     */
    CreateMatrixTransform(matrixTransform) {
        result := ComCall(16, this, "ptr", matrixTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform>} transforms 
     * @param {Integer} elements 
     * @param {Pointer<IDCompositionTransform>} transformGroup 
     * @returns {HRESULT} 
     */
    CreateTransformGroup(transforms, elements, transformGroup) {
        result := ComCall(17, this, "ptr", transforms, "uint", elements, "ptr", transformGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTranslateTransform3D>} translateTransform3D 
     * @returns {HRESULT} 
     */
    CreateTranslateTransform3D(translateTransform3D) {
        result := ComCall(18, this, "ptr", translateTransform3D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionScaleTransform3D>} scaleTransform3D 
     * @returns {HRESULT} 
     */
    CreateScaleTransform3D(scaleTransform3D) {
        result := ComCall(19, this, "ptr", scaleTransform3D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionRotateTransform3D>} rotateTransform3D 
     * @returns {HRESULT} 
     */
    CreateRotateTransform3D(rotateTransform3D) {
        result := ComCall(20, this, "ptr", rotateTransform3D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionMatrixTransform3D>} matrixTransform3D 
     * @returns {HRESULT} 
     */
    CreateMatrixTransform3D(matrixTransform3D) {
        result := ComCall(21, this, "ptr", matrixTransform3D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform3D>} transforms3D 
     * @param {Integer} elements 
     * @param {Pointer<IDCompositionTransform3D>} transform3DGroup 
     * @returns {HRESULT} 
     */
    CreateTransform3DGroup(transforms3D, elements, transform3DGroup) {
        result := ComCall(22, this, "ptr", transforms3D, "uint", elements, "ptr", transform3DGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionEffectGroup>} effectGroup 
     * @returns {HRESULT} 
     */
    CreateEffectGroup(effectGroup) {
        result := ComCall(23, this, "ptr", effectGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionRectangleClip>} clip 
     * @returns {HRESULT} 
     */
    CreateRectangleClip(clip) {
        result := ComCall(24, this, "ptr", clip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    CreateAnimation(animation) {
        result := ComCall(25, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfValid 
     * @returns {HRESULT} 
     */
    CheckDeviceState(pfValid) {
        result := ComCall(26, this, "ptr", pfValid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
