#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayPath.ahk
#Include .\IDisplayPath2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a display pipeline path from a logical "source" to a [DisplayTarget](displaytarget.md). A logical source provides a frame buffer, in a format described by the source properties. The display pipeline composes the source content and transforms it into the format described by the target properties.
  * 
  * DisplayPath objects also implement the COM interface [IDisplayPathInterop](/windows/win32/api/windows.devices.display.core.interop/nn-windows-devices-display-core-interop-idisplaypathinterop).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayPath extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayPath

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayPath.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the logical view that this path is connected from. All paths residing in the same [DisplayView](displayview.md) are logically cloned together.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.view
     * @type {DisplayView} 
     */
    View {
        get => this.get_View()
    }

    /**
     * The [DisplayTarget](displaytarget.md) that this path connects to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.target
     * @type {DisplayTarget} 
     */
    Target {
        get => this.get_Target()
    }

    /**
     * Gets the last status of the path in the system, captured when the [DisplayState](displaystate.md) was last created or applied.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets or sets an optional value for the size of the pixel buffer used for scanout, before it is transformed to fit into the target resolution.
     * @remarks
     * This property can remain unset (null) in order to allow the system to fill it in during a call to [TryApply](displaystate_tryapply_634222246.md) or [TryFunctionalize](displaystate_tryfunctionalize_741039460.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.sourceresolution
     * @type {IReference<SizeInt32>} 
     */
    SourceResolution {
        get => this.get_SourceResolution()
        set => this.put_SourceResolution(value)
    }

    /**
     * Gets or sets the pixel format of the surfaces that will be allowed to present to this [DisplayPath](displaypath.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.sourcepixelformat
     * @type {Integer} 
     */
    SourcePixelFormat {
        get => this.get_SourcePixelFormat()
        set => this.put_SourcePixelFormat(value)
    }

    /**
     * Gets or sets whether the target mode for this path is in 3D stereoscopic mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.isstereo
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
        set => this.put_IsStereo(value)
    }

    /**
     * Gets or sets an optional value for the size of the frame provided to the target's monitor. This can differ from the size of the "source" frame buffer, in which case the display pipeline transforms the content using the [Rotation](displaypath_rotation.md) and [Scaling](displaypath_scaling.md) properties.
     * @remarks
     * This property can remain unset (null) in order to allow the system to fill it in during a call to [TryApply](displaystate_tryapply_634222246.md) or [TryFunctionalize](displaystate_tryfunctionalize_741039460.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.targetresolution
     * @type {IReference<SizeInt32>} 
     */
    TargetResolution {
        get => this.get_TargetResolution()
        set => this.put_TargetResolution(value)
    }

    /**
     * Gets or sets an optional value for the refresh rate, also known as the vertical sync rate, of this path's target mode.
     * @remarks
     * This property can remain unset (null) in order to allow the system to fill it in during a call to [TryApply](displaystate_tryapply_634222246.md) or [TryFunctionalize](displaystate_tryfunctionalize_741039460.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.presentationrate
     * @type {IReference<DisplayPresentationRate>} 
     */
    PresentationRate {
        get => this.get_PresentationRate()
        set => this.put_PresentationRate(value)
    }

    /**
     * Gets or sets an optional value for whether the target mode for this path is interlaced.
     * @remarks
     * This property can remain unset (null) in order to allow the system to fill it in during a call to [TryApply](displaystate_tryapply_634222246.md) or [TryFunctionalize](displaystate_tryfunctionalize_741039460.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.isinterlaced
     * @type {IReference<Boolean>} 
     */
    IsInterlaced {
        get => this.get_IsInterlaced()
        set => this.put_IsInterlaced(value)
    }

    /**
     * Gets or sets an optional value for the exact hardware representation used to scan out; such as the pixel encoding, bits per channel, color space, and HDR metadata format.
     * @remarks
     * This property can remain unset (null) in order to allow the system to fill it in during a call to [TryApply](displaystate_tryapply_634222246.md) or [TryFunctionalize](displaystate_tryfunctionalize_741039460.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.wireformat
     * @type {DisplayWireFormat} 
     */
    WireFormat {
        get => this.get_WireFormat()
        set => this.put_WireFormat(value)
    }

    /**
     * Gets or sets how the display pipeline rotates the source frame buffer before scanning out to the target.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.rotation
     * @type {Integer} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * Gets or sets how the display pipeline scales the source frame buffer before scanning out to the target.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.scaling
     * @type {Integer} 
     */
    Scaling {
        get => this.get_Scaling()
        set => this.put_Scaling(value)
    }

    /**
     * Reserved for future use.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.properties
     * @type {IMap<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets or sets the actual physical rate at which the display is scanning out pixels (when refresh rates are being virtualized).
     * @remarks
     * Starting with Windows 11, [DisplayPresentationRate](displaypresentationrate.md) is virtualized *if the physical display is capable of virtualizing refresh rates*, and doesn't necessarily represent the actual pixel rate on the wire.
     * 
     * To determine the actual physical rate at which the display is scanning out pixels, use the flag [DisplayManagerOptions::VirtualRefreshRateAware](displaymanageroptions.md) while creating your [DisplayManager](displaymanager.md) and [DisplayPath](displaypath.md) objects.
     * 
     * If your application's **DisplayManager** isn't virtual refresh rate aware, then it won't be able to access **PhysicalPresentationRate**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.physicalpresentationrate
     * @type {IReference<DisplayPresentationRate>} 
     */
    PhysicalPresentationRate {
        get => this.get_PhysicalPresentationRate()
        set => this.put_PhysicalPresentationRate(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DisplayView} 
     */
    get_View() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_View()
    }

    /**
     * 
     * @returns {DisplayTarget} 
     */
    get_Target() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_Target()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_Status()
    }

    /**
     * 
     * @returns {IReference<SizeInt32>} 
     */
    get_SourceResolution() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_SourceResolution()
    }

    /**
     * 
     * @param {IReference<SizeInt32>} value 
     * @returns {HRESULT} 
     */
    put_SourceResolution(value) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.put_SourceResolution(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourcePixelFormat() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_SourcePixelFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SourcePixelFormat(value) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.put_SourcePixelFormat(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_IsStereo()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStereo(value) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.put_IsStereo(value)
    }

    /**
     * 
     * @returns {IReference<SizeInt32>} 
     */
    get_TargetResolution() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_TargetResolution()
    }

    /**
     * 
     * @param {IReference<SizeInt32>} value 
     * @returns {HRESULT} 
     */
    put_TargetResolution(value) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.put_TargetResolution(value)
    }

    /**
     * 
     * @returns {IReference<DisplayPresentationRate>} 
     */
    get_PresentationRate() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_PresentationRate()
    }

    /**
     * 
     * @param {IReference<DisplayPresentationRate>} value 
     * @returns {HRESULT} 
     */
    put_PresentationRate(value) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.put_PresentationRate(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsInterlaced() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_IsInterlaced()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_IsInterlaced(value) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.put_IsInterlaced(value)
    }

    /**
     * 
     * @returns {DisplayWireFormat} 
     */
    get_WireFormat() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_WireFormat()
    }

    /**
     * 
     * @param {DisplayWireFormat} value 
     * @returns {HRESULT} 
     */
    put_WireFormat(value) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.put_WireFormat(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rotation() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_Rotation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Rotation(value) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.put_Rotation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Scaling() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_Scaling()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Scaling(value) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.put_Scaling(value)
    }

    /**
     * Queries the driver to determine the valid mode combinations that can be applied to this [DisplayPath](displaypath.md). Any properties that have already been set on this path are used as constraints to limit the set of modes returned.
     * @remarks
     * Filtering the returned modes using *flags*, or by setting some properties to constrain the mode enumeration, can provide a significant performance improvement. This method is very expensive if unconstrained, as the driver will be queried directly and may perform complex calculations to determine the union of supported modes.
     * @param {Integer} flags A [DisplayModeQueryOptions](displaymodequeryoptions.md) value containing extended options for filtering the resulting modes.
     * @returns {IVectorView<DisplayModeInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.findmodes
     */
    FindModes(flags) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.FindModes(flags)
    }

    /**
     * Sets on this [DisplayPath](displaypath.md) object all properties reflected in a supplied [DisplayModeInfo](displaymodeinfo.md). Note that the wire format is not set by this method, since a **DisplayModeInfo** object refers to a range of valid wire formats.
     * @param {DisplayModeInfo} modeResult A [DisplayModeInfo](displaymodeinfo.md) reflecting the properties to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypath.applypropertiesfrommode
     */
    ApplyPropertiesFromMode(modeResult) {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.ApplyPropertiesFromMode(modeResult)
    }

    /**
     * 
     * @returns {IMap<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDisplayPath")) {
            if ((queryResult := this.QueryInterface(IDisplayPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath := IDisplayPath(outPtr)
        }

        return this.__IDisplayPath.get_Properties()
    }

    /**
     * 
     * @returns {IReference<DisplayPresentationRate>} 
     */
    get_PhysicalPresentationRate() {
        if (!this.HasProp("__IDisplayPath2")) {
            if ((queryResult := this.QueryInterface(IDisplayPath2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath2 := IDisplayPath2(outPtr)
        }

        return this.__IDisplayPath2.get_PhysicalPresentationRate()
    }

    /**
     * 
     * @param {IReference<DisplayPresentationRate>} value 
     * @returns {HRESULT} 
     */
    put_PhysicalPresentationRate(value) {
        if (!this.HasProp("__IDisplayPath2")) {
            if ((queryResult := this.QueryInterface(IDisplayPath2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPath2 := IDisplayPath2(outPtr)
        }

        return this.__IDisplayPath2.put_PhysicalPresentationRate(value)
    }

;@endregion Instance Methods
}
