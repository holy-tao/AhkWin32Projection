#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayModeInfo.ahk
#Include .\IDisplayModeInfo2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes valid combinations of properties for a [DisplayPath](displaypath.md). The property values on this object can be set on a **DisplayPath** using the [ApplyPropertiesFromMode](displaypath_applypropertiesfrommode_2136205741.md) method. Note that this object refers to a range of valid wire formats, not just one specific wire format.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayModeInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayModeInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayModeInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets an optional value for the size of the pixel buffer used for scanout, before it is transformed to fit into the target resolution.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.sourceresolution
     * @type {SizeInt32} 
     */
    SourceResolution {
        get => this.get_SourceResolution()
    }

    /**
     * Gets a value indicating whether the [DisplayModeInfo](displaymodeinfo.md) is stereoscopic 3D.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.isstereo
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
    }

    /**
     * Gets or sets the pixel format of the surfaces that will be allowed to present to this [DisplayModeInfo](displaymodeinfo.md).
     * @remarks
     * This property can remain at its default value (**DirectXPixelFormat::Unknown**) in order to allow the system to fill it in during a call to [TryApply](displaystate_tryapply_634222246.md) or [TryFunctionalize](displaystate_tryfunctionalize_741039460.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.sourcepixelformat
     * @type {Integer} 
     */
    SourcePixelFormat {
        get => this.get_SourcePixelFormat()
    }

    /**
     * Gets or sets an optional value for the size of the frame provided to the target's monitor. This can differ from the size of the "source" frame buffer, in which case the display pipeline transforms the content using the [Rotation](displaypath_rotation.md) and [Scaling](displaypath_scaling.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.targetresolution
     * @type {SizeInt32} 
     */
    TargetResolution {
        get => this.get_TargetResolution()
    }

    /**
     * Gets the presentation rate of the [DisplayModeInfo](displaymodeinfo.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.presentationrate
     * @type {DisplayPresentationRate} 
     */
    PresentationRate {
        get => this.get_PresentationRate()
    }

    /**
     * Gets a value indicating whether the [DisplayModeInfo](displaymodeinfo.md) is interlaced.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.isinterlaced
     * @type {Boolean} 
     */
    IsInterlaced {
        get => this.get_IsInterlaced()
    }

    /**
     * Gets a collection containing the properties of the [DisplayModeInfo](displaymodeinfo.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.properties
     * @type {IMapView<Guid, IInspectable>} 
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.physicalpresentationrate
     * @type {DisplayPresentationRate} 
     */
    PhysicalPresentationRate {
        get => this.get_PhysicalPresentationRate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_SourceResolution() {
        if (!this.HasProp("__IDisplayModeInfo")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo := IDisplayModeInfo(outPtr)
        }

        return this.__IDisplayModeInfo.get_SourceResolution()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        if (!this.HasProp("__IDisplayModeInfo")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo := IDisplayModeInfo(outPtr)
        }

        return this.__IDisplayModeInfo.get_IsStereo()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourcePixelFormat() {
        if (!this.HasProp("__IDisplayModeInfo")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo := IDisplayModeInfo(outPtr)
        }

        return this.__IDisplayModeInfo.get_SourcePixelFormat()
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_TargetResolution() {
        if (!this.HasProp("__IDisplayModeInfo")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo := IDisplayModeInfo(outPtr)
        }

        return this.__IDisplayModeInfo.get_TargetResolution()
    }

    /**
     * 
     * @returns {DisplayPresentationRate} 
     */
    get_PresentationRate() {
        if (!this.HasProp("__IDisplayModeInfo")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo := IDisplayModeInfo(outPtr)
        }

        return this.__IDisplayModeInfo.get_PresentationRate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInterlaced() {
        if (!this.HasProp("__IDisplayModeInfo")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo := IDisplayModeInfo(outPtr)
        }

        return this.__IDisplayModeInfo.get_IsInterlaced()
    }

    /**
     * Retrieves a value containing zero or more display bits-per-channel flags (logically OR-ed together) that are valid for the [DisplayModeInfo](displaymodeinfo.md), for a supplied display wire format pixel encoding.
     * @param {Integer} encoding The desired [DisplayWireFormatPixelEncoding](displaywireformatpixelencoding.md) for determining which bits-per-channel settings are valid.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.getwireformatsupportedbitsperchannel
     */
    GetWireFormatSupportedBitsPerChannel(encoding) {
        if (!this.HasProp("__IDisplayModeInfo")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo := IDisplayModeInfo(outPtr)
        }

        return this.__IDisplayModeInfo.GetWireFormatSupportedBitsPerChannel(encoding)
    }

    /**
     * Retrieves a Boolean value indicating whether the [DisplayModeInfo](displaymodeinfo.md) supports the specified format.
     * @param {DisplayWireFormat} wireFormat A [DisplayWireFormat](displaywireformat.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodeinfo.iswireformatsupported
     */
    IsWireFormatSupported(wireFormat) {
        if (!this.HasProp("__IDisplayModeInfo")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo := IDisplayModeInfo(outPtr)
        }

        return this.__IDisplayModeInfo.IsWireFormatSupported(wireFormat)
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDisplayModeInfo")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo := IDisplayModeInfo(outPtr)
        }

        return this.__IDisplayModeInfo.get_Properties()
    }

    /**
     * 
     * @returns {DisplayPresentationRate} 
     */
    get_PhysicalPresentationRate() {
        if (!this.HasProp("__IDisplayModeInfo2")) {
            if ((queryResult := this.QueryInterface(IDisplayModeInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayModeInfo2 := IDisplayModeInfo2(outPtr)
        }

        return this.__IDisplayModeInfo2.get_PhysicalPresentationRate()
    }

;@endregion Instance Methods
}
