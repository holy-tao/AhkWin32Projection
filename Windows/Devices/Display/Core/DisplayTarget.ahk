#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayTarget.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a slice in time of a logical "target" for the display pipeline. This is typically analogous to a physical connector on a GPU, such as an HDMI port, but it can be a virtual target representing daisy-chained DisplayPort targets.
 * @remarks
 * A **DisplayTarget** object is immutable, except for the [IsStale](displaytarget_isstale.md) property. If **IsStale** is `true`, then you can re-enumerate the latest state for all **DisplayTarget** objects by calling [DisplayManager.GetCurrentTargets](displaymanager_getcurrenttargets_1359061908.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayTarget extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayTarget

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayTarget.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the adapter that enumerates this [DisplayTarget](displaytarget.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.adapter
     * @type {DisplayAdapter} 
     */
    Adapter {
        get => this.get_Adapter()
    }

    /**
     * Gets the PnP device interface of any monitor connected to the target when the object was created, or `null` if no monitor was connected.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.deviceinterfacepath
     * @type {HSTRING} 
     */
    DeviceInterfacePath {
        get => this.get_DeviceInterfacePath()
    }

    /**
     * Gets a driver-defined identifier for this target that uniquely identifies the connector across device starts and reboots. Note that this identifier is only unique within its adapter, and does not refer to the connected monitor at all.
     * @remarks
     * This is also referred to as the "target ID" in the legacy Display Config APIs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.adapterrelativeid
     * @type {Integer} 
     */
    AdapterRelativeId {
        get => this.get_AdapterRelativeId()
    }

    /**
     * Gets a Boolean value indicating whether a monitor was connected to this [DisplayTarget](displaytarget.md) when it was created.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.isconnected
     * @type {Boolean} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

    /**
     * Returns a Boolean value indicating whether this target supports virtual modes.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.isvirtualmodeenabled
     * @type {Boolean} 
     */
    IsVirtualModeEnabled {
        get => this.get_IsVirtualModeEnabled()
    }

    /**
     * Returns a Boolean value indicating whether this target supports virtual/software clone.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.isvirtualtopologyenabled
     * @type {Boolean} 
     */
    IsVirtualTopologyEnabled {
        get => this.get_IsVirtualTopologyEnabled()
    }

    /**
     * Gets a value representing the usage kind.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.usagekind
     * @type {Integer} 
     */
    UsageKind {
        get => this.get_UsageKind()
    }

    /**
     * Gets a value representing how a monitor connected to the target is virtually persisted when the hardware no longer reports any connected monitor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.monitorpersistence
     * @type {Integer} 
     */
    MonitorPersistence {
        get => this.get_MonitorPersistence()
    }

    /**
     * Gets a value representing a stable monitor identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.stablemonitorid
     * @type {HSTRING} 
     */
    StableMonitorId {
        get => this.get_StableMonitorId()
    }

    /**
     * Reserved for future use.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.properties
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets a value indicating whether the system display state has changed since this [DisplayTarget](displaytarget.md) was created.
     * @remarks
     * A value of `true` means that the other properties of this object can no longer be relied upon to reflect actual hardware state.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.isstale
     * @type {Boolean} 
     */
    IsStale {
        get => this.get_IsStale()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DisplayAdapter} 
     */
    get_Adapter() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_Adapter()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceInterfacePath() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_DeviceInterfacePath()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdapterRelativeId() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_AdapterRelativeId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnected() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_IsConnected()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVirtualModeEnabled() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_IsVirtualModeEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVirtualTopologyEnabled() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_IsVirtualTopologyEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageKind() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_UsageKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MonitorPersistence() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_MonitorPersistence()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StableMonitorId() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_StableMonitorId()
    }

    /**
     * Tries to retrieve an object describing the monitor currently connected to this [DisplayTarget](displaytarget.md). This method can fail or return a different monitor than the properties on the **DisplayTarget** describe if monitors have been plugged or unplugged from the **DisplayTarget** since the **DisplayTarget** object was created. **IsStale** returns true if the monitor *might* have changed since the **DisplayTarget** was created.
     * @remarks
     * Since this method has **Try** in its name, it returns **null** instead of throwing an exception or returning a failure HRESULT.
     * @returns {DisplayMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.trygetmonitor
     */
    TryGetMonitor() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.TryGetMonitor()
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_Properties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStale() {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.get_IsStale()
    }

    /**
     * Determines whether this target object refers to the same underlying hardware target as another target object, by comparing the **Adapter** and the **AdapterRelativeId** properties. Since new [DisplayTarget](displaytarget.md) objects are created on each call to [GetCurrentTargets](displaymanager_getcurrenttargets_1359061908.md), this method can be used to match previously discovered targets to newly created targets.
     * @param {DisplayTarget} otherTarget 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.issame
     */
    IsSame(otherTarget) {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.IsSame(otherTarget)
    }

    /**
     * Determines whether all properties of the target are equivalent to another target, indicating that there has been no change to the target.
     * @param {DisplayTarget} otherTarget 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytarget.isequal
     */
    IsEqual(otherTarget) {
        if (!this.HasProp("__IDisplayTarget")) {
            if ((queryResult := this.QueryInterface(IDisplayTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTarget := IDisplayTarget(outPtr)
        }

        return this.__IDisplayTarget.IsEqual(otherTarget)
    }

;@endregion Instance Methods
}
