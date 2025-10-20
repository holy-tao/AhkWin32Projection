#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates surface and virtual surface objects associated with an application-provided rendering device.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionsurfacefactory
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionSurfaceFactory extends IUnknown{
    /**
     * The interface identifier for IDCompositionSurfaceFactory
     * @type {Guid}
     */
    static IID => Guid("{e334bc12-3937-4e02-85eb-fcf4eb30d2c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

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
        result := ComCall(3, this, "uint", width, "uint", height, "int", pixelFormat, "int", alphaMode, "ptr", surface, "int")
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
        result := ComCall(4, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr", virtualSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
