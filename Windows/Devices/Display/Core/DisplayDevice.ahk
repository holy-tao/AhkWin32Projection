#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayDevice.ahk
#Include .\IDisplayDevice2.ahk
#Include .\IDisplayDeviceRenderAdapter.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a context for creating and presenting content directly to the display driver. A **DisplayDevice** is analogous to a Direct3D device in the [Direct3D](/windows/win32/direct3d) API.
  * 
  * DisplayDevice objects also implement the COM interface [IDisplayDeviceInterop](/windows/win32/api/windows.devices.display.core.interop/nn-windows-devices-display-core-interop-idisplaydeviceinterop).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevice
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayDevice.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {DisplayAdapterId} 
     */
    RenderAdapterId {
        get => this.get_RenderAdapterId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates a [DisplaySource](displaysource.md) object, which provides the ability to directly scan out/present to the [DisplayTarget](displaytarget.md) object or objects currently connected to this source.
     * @remarks
     * Creating a [DisplaySource](displaysource.md) object implicitly takes ownership of the source, and prevents others from presenting content to the screen.
     * @param {DisplayTarget} target An active [DisplayTarget](displaytarget.md) for which to create a display source.
     * @returns {DisplaySource} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevice.createscanoutsource
     */
    CreateScanoutSource(target) {
        if (!this.HasProp("__IDisplayDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayDevice := IDisplayDevice(outPtr)
        }

        return this.__IDisplayDevice.CreateScanoutSource(target)
    }

    /**
     * Creates a primary surface (or just "primary") for use with the display controller. The resulting primary surface is compatible with a [DisplayScanout](displayscanout.md), which is used for presenting content directly to the screen.
     * @remarks
     * A primary surface is usually optimized by display hardware for scanout on only a single [DisplaySource](displaysource.md), so the [DisplayTarget](displaytarget.md) used to create the primary should also be the one used to create the DisplaySource and [DisplayScanout](displayscanout.md) objects. Otherwise, presentation of the surface or creation of the [DisplayScanout](displayscanout.md) may fail.
     * @param {DisplayTarget} target An active [DisplayTarget](displaytarget.md), which is used to determine which source the primary will be optimized for.
     * @param {DisplayPrimaryDescription} desc A description of the primary surface to create, such as width, height, and pixel format.
     * @returns {DisplaySurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevice.createprimary
     */
    CreatePrimary(target, desc) {
        if (!this.HasProp("__IDisplayDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayDevice := IDisplayDevice(outPtr)
        }

        return this.__IDisplayDevice.CreatePrimary(target, desc)
    }

    /**
     * Creates a [DisplayTaskPool](displaytaskpool.md), which can create and execute [DisplayTask](displaytask.md) objects on this DisplayDevice.
     * @returns {DisplayTaskPool} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevice.createtaskpool
     */
    CreateTaskPool() {
        if (!this.HasProp("__IDisplayDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayDevice := IDisplayDevice(outPtr)
        }

        return this.__IDisplayDevice.CreateTaskPool()
    }

    /**
     * Creates a [DisplayFence](displayfence.md) object that is automatically signaled by the system with an incrementing value at a certain time every vertical refresh cycle.
     * @param {DisplayTarget} target The [DisplayTarget](displaytarget.md) (which must be currently active) whose vertical refresh cycle will be used by the periodic fence.
     * @param {TimeSpan} offsetFromVBlank A time offset from the display controller's V-blank interrupt to signal the fence *before* every vertical refresh cycle.
     * @returns {DisplayFence} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevice.createperiodicfence
     */
    CreatePeriodicFence(target, offsetFromVBlank) {
        if (!this.HasProp("__IDisplayDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayDevice := IDisplayDevice(outPtr)
        }

        return this.__IDisplayDevice.CreatePeriodicFence(target, offsetFromVBlank)
    }

    /**
     * Synchronously waits for the next V-blank interrupt to be fired by the primary [DisplayTarget](displaytarget.md) for a given [DisplaySource](displaysource.md).
     * @remarks
     * In hardware clone scenarios, a display source may be connected to multiple display targets. In these situations, this method waits for the next V-blank on the display target connected via the primary path of the [DisplayView](displayview.md).
     * @param {DisplaySource} source The [DisplaySource](displaysource.md) whose primary display target's V-blank interrupt to wait for.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevice.waitforvblank
     */
    WaitForVBlank(source) {
        if (!this.HasProp("__IDisplayDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayDevice := IDisplayDevice(outPtr)
        }

        return this.__IDisplayDevice.WaitForVBlank(source)
    }

    /**
     * Creates a [DisplayScanout](displayscanout.md) object that can be used to present a full-screen surface directly to the screen.
     * @param {DisplaySource} pSource A [DisplaySource](displaysource.md) to present full-screen content to.
     * @param {DisplaySurface} pSurface A full-screen primary surface.
     * @param {Integer} SubResourceIndex Related to Direct3D's concept of [subresources](/windows/win32/direct3d11/overviews-direct3d-11-resources-subresources). Using this index, you can specify which subresource within the [DisplaySurface](displaysurface.md) should be used for scanout, in the event that there are multiple subresources.
     * 
     * The only way to have a **DisplaySurface** that has multiple subresources is either to create the **DisplaySurface** with the *isStereo* flag (see [CreateWithProperties](/uwp/api/windows.devices.display.core.displayprimarydescription.createwithproperties)), or to open an [ID3D11Texture2D](/windows/win32/api/d3d11/nn-d3d11-id3d11texture2d) using APIs in [IDisplayDeviceInterop](/windows/win32/api/windows.devices.display.core.interop/nn-windows-devices-display-core-interop-idisplaydeviceinterop).
     * 
     * The most common value for *subresourceindex* will be 0, which indicates that no subresource is needed or available.
     * @param {Integer} SyncInterval An integer that specifies how to synchronize presentation of a frame with the vertical blank of the display.
     * 
     * *SyncInterval* == 0. Presentation happens on the next vertical blank from the display. If there are other presents in the queue with value = 0, then those presents are discarded.
     * *SyncInterval* == 0, with [DisplayScanoutOptions::AllowTearing](displayscanoutoptions.md). The presentation occurs immediately; there is no synchronization with the previous frame. This can cause visible tearing.
     * *SyncInterval* == 1 through 4. Synchronize presentation for at least *n* vertical blanks of the display.
     * @returns {DisplayScanout} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevice.createsimplescanout
     */
    CreateSimpleScanout(pSource, pSurface, SubResourceIndex, SyncInterval) {
        if (!this.HasProp("__IDisplayDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayDevice := IDisplayDevice(outPtr)
        }

        return this.__IDisplayDevice.CreateSimpleScanout(pSource, pSurface, SubResourceIndex, SyncInterval)
    }

    /**
     * Retrieves a Boolean value indicating whether or not a given capability is supported by this [DisplayDevice](displaydevice.md).
     * @param {Integer} capability The [DisplayDeviceCapability](displaydevicecapability.md) to query about.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevice.iscapabilitysupported
     */
    IsCapabilitySupported(capability) {
        if (!this.HasProp("__IDisplayDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayDevice := IDisplayDevice(outPtr)
        }

        return this.__IDisplayDevice.IsCapabilitySupported(capability)
    }

    /**
     * Creates a [DisplayScanout](displayscanout.md) object that provides an immutable encapsulation of parameters required for presenting a frame to a [DisplaySource](displaysource.md).
     * @param {DisplaySource} source A [DisplaySource](displaysource.md) to present content to.
     * @param {DisplaySurface} surface A primary surface.
     * @param {Integer} subresourceIndex Related to Direct3D's concept of [subresources](/windows/win32/direct3d11/overviews-direct3d-11-resources-subresources). Using this index, you can specify which subresource within the [DisplaySurface](displaysurface.md) should be used for scanout, in the event that there are multiple subresources.
     * 
     * The only way to have a **DisplaySurface** that has multiple subresources is either to create the **DisplaySurface** with the *isStereo* flag (see [CreateWithProperties](/uwp/api/windows.devices.display.core.displayprimarydescription.createwithproperties)), or to open an [ID3D11Texture2D](/windows/win32/api/d3d11/nn-d3d11-id3d11texture2d) using APIs in [IDisplayDeviceInterop](/windows/win32/api/windows.devices.display.core.interop/nn-windows-devices-display-core-interop-idisplaydeviceinterop).
     * 
     * The most common value for *subresourceindex* will be 0, which indicates that no subresource is needed or available.
     * @param {Integer} syncInterval An integer that specifies how to synchronize presentation of a frame with the vertical blank of the display.
     * 
     * *SyncInterval* == 0. Presentation happens on the next vertical blank from the display. If there are other presents in the queue with value = 0, then those presents are discarded.
     * *SyncInterval* == 0, with [DisplayScanoutOptions::AllowTearing](displayscanoutoptions.md). The presentation occurs immediately; there is no synchronization with the previous frame. This can cause visible tearing.
     * *SyncInterval* == 1 through 4. Synchronize presentation for at least *n* vertical blanks of the display.
     * @param {IIterable<RectInt32>} dirtyRects Dirty rectangles that provide a hint to the graphics driver indicating which regions of the primary are changing. This might be used by the driver to reduce the amount of bandwidth on the underlying display transport, so you must pass valid rectangles that fully encompass all changed pixels in a frame.
     * 
     * This is an optimization, and if your DirectDisplay client doesn't track dirty rectangles, then you can pass `null` for *dirtyRects*, and the operating system will consider that as a full-frame dirty (meaning that all the pixels in the primary buffer are modified). If you pass an empty list for *dirtyRects* then that means that no pixels have been changed in the primary buffer, and the graphics driver might choose to optimize the scanout of this primary buffer.
     * @param {Integer} options Flags that can specify various options for the [DisplayScanout](displayscanout.md) being created. [DisplayScanoutOptions.AllowTearing](displayscanoutoptions.md) is valid only if *syncInterval* is 0.
     * @returns {DisplayScanout} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevice.createsimplescanoutwithdirtyrectsandoptions
     */
    CreateSimpleScanoutWithDirtyRectsAndOptions(source, surface, subresourceIndex, syncInterval, dirtyRects, options) {
        if (!this.HasProp("__IDisplayDevice2")) {
            if ((queryResult := this.QueryInterface(IDisplayDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayDevice2 := IDisplayDevice2(outPtr)
        }

        return this.__IDisplayDevice2.CreateSimpleScanoutWithDirtyRectsAndOptions(source, surface, subresourceIndex, syncInterval, dirtyRects, options)
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_RenderAdapterId() {
        if (!this.HasProp("__IDisplayDeviceRenderAdapter")) {
            if ((queryResult := this.QueryInterface(IDisplayDeviceRenderAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayDeviceRenderAdapter := IDisplayDeviceRenderAdapter(outPtr)
        }

        return this.__IDisplayDeviceRenderAdapter.get_RenderAdapterId()
    }

;@endregion Instance Methods
}
