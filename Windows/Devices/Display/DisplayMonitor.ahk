#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayMonitor.ahk
#Include .\IDisplayMonitor2.ahk
#Include .\IDisplayMonitorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about a display monitor device connected to the system.
  * 
  * These data include commonly used information from the monitor's Extended Display Identification Data (EDID, which is an industry-standard display descriptor block that nearly all monitors use to provide descriptions of supported modes and general device information) and DisplayID (which is a newer industry standard that provides a superset of EDID).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor
 * @namespace Windows.Devices.Display
 * @version WindowsRuntime 1.4
 */
class DisplayMonitor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayMonitor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayMonitor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns an Advanced Query Syntax (AQS) device interface selector string for the purpose of retrieving device *interfaces* (rather than devices).
     * 
     * The selector can be used by [DeviceInformation.CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) to watch and enumerate monitor devices on the system. Or it can be used with [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) to retrieve a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects that describe monitor interfaces (rather than monitor devices). Accessing the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) property on one of those objects retrieves a monitor interface identifier, which you can pass to **DisplayMonitor.FromInterfaceIdAsync** (for details, see the code example for [DisplayMonitor.FromInterfaceIdAsync](displaymonitor_frominterfaceidasync_1923441009.md)). If you request the System.Devices.DeviceInstanceId additional property from [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md), then you can call **DisplayMonitor.FromIdAsync** (for details, see the code example for [DisplayMonitor.FromIdAsync](displaymonitor_fromidasync_1322863552.md)).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!DisplayMonitor.HasProp("__IDisplayMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.DisplayMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayMonitorStatics.IID)
            DisplayMonitor.__IDisplayMonitorStatics := IDisplayMonitorStatics(factoryPtr)
        }

        return DisplayMonitor.__IDisplayMonitorStatics.GetDeviceSelector()
    }

    /**
     * Asynchronously creates a [DisplayMonitor](displaymonitor.md) object for the specified device identifier (a string containing a PnP device instance path). See the code example below.
     * 
     * > [!NOTE]
     * > The argument must be a device identifier, and not a device interface identifier. If you have a device interface identifier (which is likely), then call [FromInterfaceIdAsync](displaymonitor_frominterfaceidasync_1923441009.md) instead. For more details, see [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md).
     * @param {HSTRING} deviceId The monitor device identifier. See [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md).
     * @returns {IAsyncOperation<DisplayMonitor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!DisplayMonitor.HasProp("__IDisplayMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.DisplayMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayMonitorStatics.IID)
            DisplayMonitor.__IDisplayMonitorStatics := IDisplayMonitorStatics(factoryPtr)
        }

        return DisplayMonitor.__IDisplayMonitorStatics.FromIdAsync(deviceId)
    }

    /**
     * Asynchronously creates a [DisplayMonitor](displaymonitor.md) object for the specified monitor interface identifier (a string containing a PnP device interface path). See the code example below.
     * 
     * > [!NOTE]
     * > If you call [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md), passing the Advanced Query Syntax (AQS) device interface selector string returned by [DisplayMonitor.GetDeviceSelector](displaymonitor_getdeviceselector_838466080.md), then you will retrieve a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects that describe monitor interfaces (rather than monitor devices). Accessing the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) property on one of those objects retrieves a monitor interface identifier, which you can pass to **DisplayMonitor.FromInterfaceIdAsync**. See the code example below.
     * >
     * > Most Win32 APIs that provide a monitor identifier actually provide the monitor interface identifier (and not the device identifier).
     * @param {HSTRING} deviceInterfaceId The monitor interface identifier
     * @returns {IAsyncOperation<DisplayMonitor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.frominterfaceidasync
     */
    static FromInterfaceIdAsync(deviceInterfaceId) {
        if (!DisplayMonitor.HasProp("__IDisplayMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.DisplayMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayMonitorStatics.IID)
            DisplayMonitor.__IDisplayMonitorStatics := IDisplayMonitorStatics(factoryPtr)
        }

        return DisplayMonitor.__IDisplayMonitorStatics.FromInterfaceIdAsync(deviceInterfaceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets a friendly name for the device suitable for display to a user.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets a value representing the abstract method in which the display is connected (not specific to a physical protocol).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.connectionkind
     * @type {Integer} 
     */
    ConnectionKind {
        get => this.get_ConnectionKind()
    }

    /**
     * Gets a value representing the physical connector standard used to connect the display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.physicalconnector
     * @type {Integer} 
     */
    PhysicalConnector {
        get => this.get_PhysicalConnector()
    }

    /**
     * Gets the device identifier of the display adapter to which the monitor is connected. Note that the display adapter may not be the most suitable device for rendering.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.displayadapterdeviceid
     * @type {HSTRING} 
     */
    DisplayAdapterDeviceId {
        get => this.get_DisplayAdapterDeviceId()
    }

    /**
     * Gets the locally unique identifier (LUID) of the display adapter to which the monitor is connected. Note that the display adapter to which the monitor is connected may not be the most suitable one for rendering.
     * 
     * An LUID is a 64-bit value guaranteed to be unique only on the system on which it was generated. The uniqueness of an LUID is guaranteed only until the system is restarted. This LUID is compatible with [Direct3D](/windows/desktop/direct3d), [DisplayConfig](/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info), and [HolographicSpace](../windows.graphics.holographic/holographicspace.md) APIs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.displayadapterid
     * @type {DisplayAdapterId} 
     */
    DisplayAdapterId {
        get => this.get_DisplayAdapterId()
    }

    /**
     * Gets an opaque ID used by the display adapter to identify which connector the monitor is attached to. This target ID can be used with [DisplayConfig](/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info) APIs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.displayadaptertargetid
     * @type {Integer} 
     */
    DisplayAdapterTargetId {
        get => this.get_DisplayAdapterTargetId()
    }

    /**
     * Gets a value representing the use to which the display is being put.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.usagekind
     * @type {Integer} 
     */
    UsageKind {
        get => this.get_UsageKind()
    }

    /**
     * Gets the monitor's native resolution in raw pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.nativeresolutioninrawpixels
     * @type {SizeInt32} 
     */
    NativeResolutionInRawPixels {
        get => this.get_NativeResolutionInRawPixels()
    }

    /**
     * Gets the monitor's physical diagonal size in inches.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.physicalsizeininches
     * @type {IReference<SIZE>} 
     */
    PhysicalSizeInInches {
        get => this.get_PhysicalSizeInInches()
    }

    /**
     * Gets the physical horizontal DPI of the monitor (based on the monitor’s native resolution and physical size).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.rawdpix
     * @type {Float} 
     */
    RawDpiX {
        get => this.get_RawDpiX()
    }

    /**
     * Gets the physical vertical DPI of the monitor (based on the monitor’s native resolution and physical size).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.rawdpiy
     * @type {Float} 
     */
    RawDpiY {
        get => this.get_RawDpiY()
    }

    /**
     * Gets the chromaticity red primary point (calculated from the monitor's Extended Display Identification Data, or EDID, and any driver overrides).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.redprimary
     * @type {POINT} 
     */
    RedPrimary {
        get => this.get_RedPrimary()
    }

    /**
     * Gets the chromaticity green primary point (calculated from the monitor's Extended Display Identification Data, or EDID, and any driver overrides).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.greenprimary
     * @type {POINT} 
     */
    GreenPrimary {
        get => this.get_GreenPrimary()
    }

    /**
     * Gets the chromaticity blue primary point (calculated from the monitor's Extended Display Identification Data, or EDID, and any driver overrides).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.blueprimary
     * @type {POINT} 
     */
    BluePrimary {
        get => this.get_BluePrimary()
    }

    /**
     * Gets the chromaticity white point (calculated from the monitor's Extended Display Identification Data, or EDID, and any driver overrides).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.whitepoint
     * @type {POINT} 
     */
    WhitePoint {
        get => this.get_WhitePoint()
    }

    /**
     * Gets the monitor's maximum luminance in nits.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.maxluminanceinnits
     * @type {Float} 
     */
    MaxLuminanceInNits {
        get => this.get_MaxLuminanceInNits()
    }

    /**
     * Gets the monitor's minimum luminance in nits.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.minluminanceinnits
     * @type {Float} 
     */
    MinLuminanceInNits {
        get => this.get_MinLuminanceInNits()
    }

    /**
     * Gets the monitor's maximum average full-frame luminance in nits.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.maxaveragefullframeluminanceinnits
     * @type {Float} 
     */
    MaxAverageFullFrameLuminanceInNits {
        get => this.get_MaxAverageFullFrameLuminanceInNits()
    }

    /**
     * Gets a value that indicates whether the monitor's metadata has specified that it treats high dynamic range (HDR) as a special *Dolby Vision* mode. This API is intended to be used by the DolbyVision video decoder running within media to play specially certified content.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.isdolbyvisionsupportedinhdrmode
     * @type {Boolean} 
     */
    IsDolbyVisionSupportedInHdrMode {
        get => this.get_IsDolbyVisionSupportedInHdrMode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_DeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_DisplayName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionKind() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_ConnectionKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhysicalConnector() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_PhysicalConnector()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayAdapterDeviceId() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_DisplayAdapterDeviceId()
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_DisplayAdapterId() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_DisplayAdapterId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayAdapterTargetId() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_DisplayAdapterTargetId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageKind() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_UsageKind()
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_NativeResolutionInRawPixels() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_NativeResolutionInRawPixels()
    }

    /**
     * 
     * @returns {IReference<SIZE>} 
     */
    get_PhysicalSizeInInches() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_PhysicalSizeInInches()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawDpiX() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_RawDpiX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawDpiY() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_RawDpiY()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_RedPrimary() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_RedPrimary()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_GreenPrimary() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_GreenPrimary()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_BluePrimary() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_BluePrimary()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_WhitePoint() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_WhitePoint()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxLuminanceInNits() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_MaxLuminanceInNits()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinLuminanceInNits() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_MinLuminanceInNits()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxAverageFullFrameLuminanceInNits() {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.get_MaxAverageFullFrameLuminanceInNits()
    }

    /**
     * Retrieves a hardware descriptor of the kind specified.
     * @param {Integer} descriptorKind The kind of descriptor to retrieve.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} A byte array containing a hardware descriptor of the kind specified.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitor.getdescriptor
     */
    GetDescriptor(descriptorKind, result_) {
        if (!this.HasProp("__IDisplayMonitor")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor := IDisplayMonitor(outPtr)
        }

        return this.__IDisplayMonitor.GetDescriptor(descriptorKind, result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDolbyVisionSupportedInHdrMode() {
        if (!this.HasProp("__IDisplayMonitor2")) {
            if ((queryResult := this.QueryInterface(IDisplayMonitor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMonitor2 := IDisplayMonitor2(outPtr)
        }

        return this.__IDisplayMonitor2.get_IsDolbyVisionSupportedInHdrMode()
    }

;@endregion Instance Methods
}
