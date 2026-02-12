#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionSurface.ahk
#Include .\IDCompositionVirtualSurface.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates surface and virtual surface objects associated with an application-provided rendering device.
 * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nn-dcomp-idcompositionsurfacefactory
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
     * Creates a surface object that can be associated with one or more visuals for composition.
     * @remarks
     * A Microsoft DirectComposition surface is a rectangular array of pixels that can be associated with a visual for composition. 
     * 
     * A newly created surface object is in an uninitialized state. While it is uninitialized, the surface has no effect on the composition of the visual tree. It behaves exactly like a surface that has 100% transparent pixels. 
     * 
     * 
     * 
     * To initialize the surface with pixel data, use the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> method. The first call to this method must cover the entire surface area to provide an initial value for every pixel. Subsequent calls may specify smaller sub-rectangles of the surface to update.
     * 
     * 
     * 
     * This method will fail if either the width or height exceed the max texture size. If your scenario requires dimensions beyond the max texture size, use <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurfacefactory-createvirtualsurface">CreateVirtualSurface</a> method.
     * 
     * DirectComposition surfaces support the following pixel formats:
     * 
     * 
     * <ul>
     * <li>DXGI_FORMAT_B8G8R8A8_UNORM
     * </li>
     * <li>DXGI_FORMAT_R8G8B8A8_UNORM
     * 	</li>
     * <li>DXGI_FORMAT_R16G16B16A16_FLOAT</li>
     * </ul>
     * @param {Integer} width The width of the surface, in pixels.
     * @param {Integer} height The height of the surface, in pixels.
     * @param {Integer} pixelFormat The pixel format of the surface.
     * @param {Integer} alphaMode The format of the alpha channel, if an alpha channel is included in the pixel format. This can be one of DXGI_ALPHA_MODE_PREMULTIPLIED or DXGI_ALPHA_MODE_IGNORE. It can also be DXGI_ALPHA_MODE_UNSPECIFIED, which is interpreted as DXGI_ALPHA_MODE_IGNORE.
     * @returns {IDCompositionSurface} The newly created surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionsurfacefactory-createsurface
     */
    CreateSurface(width, height, pixelFormat, alphaMode) {
        result := ComCall(3, this, "uint", width, "uint", height, "int", pixelFormat, "int", alphaMode, "ptr*", &surface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionSurface(surface)
    }

    /**
     * Creates a sparsely populated surface that can be associated with one or more visuals for composition. (IDCompositionSurfaceFactory.CreateVirtualSurface)
     * @remarks
     * A newly created virtual surface object is in an uninitialized state. While it is uninitialized, the surface has no effect on the composition of the visual tree. It behaves exactly like a surface that is initialized with 100% transparent pixels. 
     * 
     * 
     * 
     * To initialize the surface with pixel data, use the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> method. This method not only provides pixels for the surface, but it also allocates actual storage space for those pixels. The memory allocation persists until the application returns some of the memory to the system. The application can free part or all of the allocated memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvirtualsurface-trim">IDCompositionVirtualSurface::Trim</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvirtualsurface-resize">IDCompositionVirtualSurface::Resize</a> method.
     * 
     * Microsoft DirectComposition surfaces support the following pixel formats:
     * 
     * 
     * <ul>
     * <li>DXGI_FORMAT_B8G8R8A8_UNORM
     * </li>
     * <li>DXGI_FORMAT_R8G8B8A8_UNORM
     * 	</li>
     * <li>DXGI_FORMAT_R16G16B16A16_FLOAT</li>
     * </ul>
     * @param {Integer} initialWidth The width of the surface, in pixels. The maximum width is 16,777,216 pixels.
     * @param {Integer} initialHeight The height of the surface, in pixels.
     * The maximum height is 16,777,216 pixels.
     * @param {Integer} pixelFormat The pixel format of the surface.
     * @param {Integer} alphaMode The format of the alpha channel, if an alpha channel is included in the pixel format. This can be one of DXGI_ALPHA_MODE_PREMULTIPLIED or DXGI_ALPHA_MODE_IGNORE. It can also be DXGI_ALPHA_MODE_UNSPECIFIED, which is interpreted as DXGI_ALPHA_MODE_IGNORE.
     * @returns {IDCompositionVirtualSurface} The newly created virtual surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionsurfacefactory-createvirtualsurface
     */
    CreateVirtualSurface(initialWidth, initialHeight, pixelFormat, alphaMode) {
        result := ComCall(4, this, "uint", initialWidth, "uint", initialHeight, "int", pixelFormat, "int", alphaMode, "ptr*", &virtualSurface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDCompositionVirtualSurface(virtualSurface)
    }
}
