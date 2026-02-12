#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ICompositionSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a placeholder for a composition surface that can be used like a real composition surface.
 * @remarks
 * The surface façade interface lets you create an object that can be assigned to the [Surface](compositionsurfacebrush_surface.md) property of a [CompositionSurfaceBrush](compositionsurfacebrush.md) object, or passed as the _`surface`_ argument to the [Compositor.CreateSurfaceBrush](/uwp/api/windows.ui.composition.compositor.createsurfacebrush) method. An application or framework object that implements this interface must also implement the [ICompositionSurface](icompositionsurface.md) interface, so that it can be assigned to the `Surface` property of a brush.
 * 
 * The `CompositionSurfaceBrush` [queries](/cpp/atl/queryinterface) for `ICompositionSurfaceFacade` and calls the [GetRealSurface](icompositionsurfacefacade_getrealsurface_234279832.md) method only once at property assignment time (which is at creation time, in the case of `CreateSurfaceBrush`) to retrieve the real `ICompositionSurface` object from the façade. The real object cannot in turn also be a façade; it must be a real object, or the assignment (or creation) method fails with `E_INVALIDARG`. The façade and the real surface are then referenced by the brush. In that way, the façade object is kept alive by the visual tree in the same way as a real surface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.icompositionsurfacefacade
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionSurfaceFacade extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionSurfaceFacade
     * @type {Guid}
     */
    static IID => Guid("{e01622c8-2332-55c7-8868-a7312c5c229d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRealSurface"]

    /**
     * Retrieves the `ICompositionSurface` object represented by this façade.
     * @remarks
     * The real object cannot in turn also be a façade; it must be a real object, or the assignment (or creation) method fails with `E_INVALIDARG`.
     * @returns {ICompositionSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.icompositionsurfacefacade.getrealsurface
     */
    GetRealSurface() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICompositionSurface(result_)
    }
}
