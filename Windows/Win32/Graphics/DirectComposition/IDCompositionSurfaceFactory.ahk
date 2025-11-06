#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionSurface.ahk
#Include .\IDCompositionVirtualSurface.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates surface and virtual surface objects associated with an application-provided rendering device.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionsurfacefactory
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionSurfaceFactory extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSurface", "CreateVirtualSurface"]

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {IDCompositionSurface} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurfacefactory-createsurface
     */
    CreateSurface(width, height, pixelFormat, alphaMode) {
        result := ComCall(3, this, "uint", width, "uint", height, "int", pixelFormat, "int", alphaMode, "ptr*", &surface := 0, "HRESULT")
        return IDCompositionSurface(surface)
    }

    /**
     * 
     * @param {Integer} initialWidth 
     * @param {Integer} initialHeight 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {IDCompositionVirtualSurface} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurfacefactory-createvirtualsurface
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode) {
        result := ComCall(4, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr*", &virtualSurface := 0, "HRESULT")
        return IDCompositionVirtualSurface(virtualSurface)
    }
}
