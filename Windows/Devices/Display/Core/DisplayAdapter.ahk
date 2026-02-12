#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayAdapter.ahk
#Include .\IDisplayAdapter2.ahk
#Include .\IDisplayAdapterStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a hardware display controller. This is typically a GPU (graphics processing unit).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayAdapter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayAdapter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayAdapter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a [DisplayAdapter](displayadapter.md) for the given display adapter ID, if the adapter still exists on the system. This method throws an exception if the specified adapter cannot be found, or if it is no longer present on the system.
     * @param {DisplayAdapterId} id The [DisplayAdapterId](../windows.graphics/displayadapterid.md) identifying the display adapter to retrieve. The identifier is a locally unique numeric ID (LUID) value.
     * @returns {DisplayAdapter} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter.fromid
     */
    static FromId(id) {
        if (!DisplayAdapter.HasProp("__IDisplayAdapterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.Core.DisplayAdapter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayAdapterStatics.IID)
            DisplayAdapter.__IDisplayAdapterStatics := IDisplayAdapterStatics(factoryPtr)
        }

        return DisplayAdapter.__IDisplayAdapterStatics.FromId(id)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a numeric locally unique ID (LUID) that refers to the runtime instance of the display adapter. This ID changes if the adapter's PnP device is stopped/started, or if the system reboots.
     * 
     * An LUID is a 64-bit value guaranteed to be unique only on the system on which it was generated. The uniqueness of an LUID is guaranteed only until the adapter's PnP device is stopped/started, or if the system is restarted. This LUID is compatible with [Direct3D](/windows/desktop/direct3d), [DisplayConfig](/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info), and [HolographicSpace](../windows.graphics.holographic/holographicspace.md) APIs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter.id
     * @type {DisplayAdapterId} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the PnP device interface path for this adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter.deviceinterfacepath
     * @type {HSTRING} 
     */
    DeviceInterfacePath {
        get => this.get_DeviceInterfacePath()
    }

    /**
     * Gets the number (the count) of hardware sources exposed by the display driver. This is typically the maximum number of simultaneous paths allowed by the adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter.sourcecount
     * @type {Integer} 
     */
    SourceCount {
        get => this.get_SourceCount()
    }

    /**
     * Gets the PCI vendor ID of the adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter.pcivendorid
     * @type {Integer} 
     */
    PciVendorId {
        get => this.get_PciVendorId()
    }

    /**
     * Gets the PCI device ID of the adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter.pcideviceid
     * @type {Integer} 
     */
    PciDeviceId {
        get => this.get_PciDeviceId()
    }

    /**
     * Gets the PCI subsystem ID of the adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter.pcisubsystemid
     * @type {Integer} 
     */
    PciSubSystemId {
        get => this.get_PciSubSystemId()
    }

    /**
     * Gets the PCI revision number of the adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter.pcirevision
     * @type {Integer} 
     */
    PciRevision {
        get => this.get_PciRevision()
    }

    /**
     * Gets a collection containing the properties of the display adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayadapter.properties
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {Boolean} 
     */
    IsIndirectDisplayDevice {
        get => this.get_IsIndirectDisplayDevice()
    }

    /**
     * @type {DisplayAdapter} 
     */
    PreferredRenderAdapter {
        get => this.get_PreferredRenderAdapter()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_Id() {
        if (!this.HasProp("__IDisplayAdapter")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter := IDisplayAdapter(outPtr)
        }

        return this.__IDisplayAdapter.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceInterfacePath() {
        if (!this.HasProp("__IDisplayAdapter")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter := IDisplayAdapter(outPtr)
        }

        return this.__IDisplayAdapter.get_DeviceInterfacePath()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceCount() {
        if (!this.HasProp("__IDisplayAdapter")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter := IDisplayAdapter(outPtr)
        }

        return this.__IDisplayAdapter.get_SourceCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PciVendorId() {
        if (!this.HasProp("__IDisplayAdapter")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter := IDisplayAdapter(outPtr)
        }

        return this.__IDisplayAdapter.get_PciVendorId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PciDeviceId() {
        if (!this.HasProp("__IDisplayAdapter")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter := IDisplayAdapter(outPtr)
        }

        return this.__IDisplayAdapter.get_PciDeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PciSubSystemId() {
        if (!this.HasProp("__IDisplayAdapter")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter := IDisplayAdapter(outPtr)
        }

        return this.__IDisplayAdapter.get_PciSubSystemId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PciRevision() {
        if (!this.HasProp("__IDisplayAdapter")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter := IDisplayAdapter(outPtr)
        }

        return this.__IDisplayAdapter.get_PciRevision()
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDisplayAdapter")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter := IDisplayAdapter(outPtr)
        }

        return this.__IDisplayAdapter.get_Properties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIndirectDisplayDevice() {
        if (!this.HasProp("__IDisplayAdapter2")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter2 := IDisplayAdapter2(outPtr)
        }

        return this.__IDisplayAdapter2.get_IsIndirectDisplayDevice()
    }

    /**
     * 
     * @returns {DisplayAdapter} 
     */
    get_PreferredRenderAdapter() {
        if (!this.HasProp("__IDisplayAdapter2")) {
            if ((queryResult := this.QueryInterface(IDisplayAdapter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayAdapter2 := IDisplayAdapter2(outPtr)
        }

        return this.__IDisplayAdapter2.get_PreferredRenderAdapter()
    }

;@endregion Instance Methods
}
