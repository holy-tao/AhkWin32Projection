#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICompositionDrawingSurfaceInterop.ahk

/**
 * Reads back the contents of a composition drawing surface (or a composition virtual drawing surface).
 * @remarks
 * To create a Direct2D or a Direct3D surface for use with [Windows.UI.Composition](/uwp/api/windows.ui.composition), you use the [composition drawing surface interoperation](./index.md) interfaces. You can use the **CopySurface** method to read back the contents of a composition drawing surface (or a composition virtual drawing surface). **CopySurface** is a synchronous and instantaneous copy from one part of video memory to another; you don't need to call **Commit**.
 * 
 * For any given composition drawing surface (or composition virtual drawing surface), your application can query for [ICompositionDrawingSurfaceInterop2](./nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop2.md), and call **CopySurface** on that interface.
 * 
 * You can call **CopySurface** only when there are no pending updates to any surfaces belonging to the same [CompositionGraphicsDevice](/uwp/api/windows.ui.composition.compositiongraphicsdevice) as the source surface ([ICompositionDrawingSurfaceInterop::BeginDraw](./nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-begindraw.md) has the same requirement). It's also illegal to call **CopySurface** on a non-virtual composition drawing surface that has never been updated, as its pixel contents are undefined. For virtual surfaces, since they are sparsely allocated, it's possible to specify a source rectangle that intersects uninitialized regions of the surface. In that case, the call is legal, but the result of the copy for those uninitialized regions is undefined.
 * 
 * > [!NOTE]
 * > This interface is available on Windows 10, version 1903 (10.0; Build 18362), but it is not defined in the `windows.ui.composition.interop.h` header file for that version of the Windows Software Development Kit (SDK). If you first obtain a pointer to an [ICompositionDrawingSurfaceInterop](./nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop.md) interface, you can then query that (via [QueryInterface](../unknwn/nf-unknwn-iunknown-queryinterface(refiid_void).md)) for a pointer to an [ICompositionDrawingSurfaceInterop2](./nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop2.md) interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop2-copysurface
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositionDrawingSurfaceInterop2 extends ICompositionDrawingSurfaceInterop{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionDrawingSurfaceInterop2
     * @type {Guid}
     */
    static IID => Guid("{41e64aae-98c0-4239-8e95-a330dd6aa18b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopySurface"]

    /**
     * Reads back the contents of a composition drawing surface (or a composition virtual drawing surface).
     * @remarks
     * To create a Direct2D or a Direct3D surface for use with [Windows.UI.Composition](/uwp/api/windows.ui.composition), you use the [composition drawing surface interoperation](./index.md) interfaces. You can use the **CopySurface** method to read back the contents of a composition drawing surface (or a composition virtual drawing surface). **CopySurface** is a synchronous and instantaneous copy from one part of video memory to another; you don't need to call **Commit**.
     * 
     * For any given composition drawing surface (or composition virtual drawing surface), your application can query for [ICompositionDrawingSurfaceInterop2](./nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop2.md), and call **CopySurface** on that interface.
     * 
     * You can call **CopySurface** only when there are no pending updates to any surfaces belonging to the same [CompositionGraphicsDevice](/uwp/api/windows.ui.composition.compositiongraphicsdevice) as the source surface ([ICompositionDrawingSurfaceInterop::BeginDraw](./nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-begindraw.md) has the same requirement). It's also illegal to call **CopySurface** on a non-virtual composition drawing surface that has never been updated, as its pixel contents are undefined. For virtual surfaces, since they are sparsely allocated, it's possible to specify a source rectangle that intersects uninitialized regions of the surface. In that case, the call is legal, but the result of the copy for those uninitialized regions is undefined.
     * 
     * > [!NOTE]
     * > This interface is available on Windows 10, version 1903 (10.0; Build 18362), but it is not defined in the `windows.ui.composition.interop.h` header file for that version of the Windows Software Development Kit (SDK). If you first obtain a pointer to an [ICompositionDrawingSurfaceInterop](./nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop.md) interface, you can then query that (via [QueryInterface](../unknwn/nf-unknwn-iunknown-queryinterface(refiid_void).md)) for a pointer to an [ICompositionDrawingSurfaceInterop2](./nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop2.md) interface.
     * @param {IUnknown} destinationResource Type: **[IUnknown](../unknwn/nn-unknwn-iunknown.md)\***
     * 
     * Represents the Direct3D texture that will receive the copy. You must have created this resource on the same Direct3D device as the one associated with the [CompositionGraphicsDevice](/uwp/api/Windows.UI.Composition.CompositionGraphicsDevice) that was used to create the source composition drawing surface (or composition virtual drawing surface).
     * @param {Integer} destinationOffsetX Type: **int**
     * 
     * The x-coordinate of an offset (into *destinationResource*) where the copy will be performed. No pixels above or to the left of this offset are changed by the copy operation. The argument can't be negative.
     * @param {Integer} destinationOffsetY Type: **int**
     * 
     * The y-coordinate of an offset (into *destinationResource*) where the copy will be performed. No pixels above or to the left of this offset are changed by the copy operation. The argument can't be negative.
     * @param {Pointer<RECT>} sourceRectangle Type: **const [RECT](../windef/ns-windef-rect.md)\***
     * 
     * An optional pointer to a constant **RECT** representing the rectangle on the source surface to copy out. The rectangle can't exceed the bounds of the source surface. In order to have enough room to receive the requested pixels, the destination resource must have at least as many pixels as the *destinationOffsetX* and *Y* parameters plus the width/height of this rectangle.
     * 
     * If this parameter is null, then the entire source surface is copied (and the source surface size is used to validate the size of the destination resource).
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop2-copysurface
     */
    CopySurface(destinationResource, destinationOffsetX, destinationOffsetY, sourceRectangle) {
        result := ComCall(9, this, "ptr", destinationResource, "int", destinationOffsetX, "int", destinationOffsetY, "ptr", sourceRectangle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
