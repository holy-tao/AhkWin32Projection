#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampArray.ahk
#Include .\ILampArray2.ahk
#Include .\ILampArrayStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\LampArray.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a LampArray device attached the system.  Currently, only [HID LampArrays](https://www.usb.org/sites/default/files/hutrr84_-_lighting_and_illumination_page.pdf) are supported.
 * @remarks
 * LampArray devices have one or more lamp indexes (for example, lights/LEDs/bulbs, etc…) whose color state can be directly manipulated.  Static information (retrieved from the device) describe supported colors, geometric positions and intended purposes for each lamp index.
 * 
 * These devices can be found as part of composite devices (for example, keyboard with RGB lighting) or as standalone.
 * 
 * An application can set lamp state at any time, but state will only be applied by the system while application is in focus.
 * 
 * LampArrays are enumerated by [DeviceWatcher](../windows.devices.enumeration/devicewatcher.md), and retrieved via [FromIdAsync](lamparray_fromidasync_1322863552.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray
 * @namespace Windows.Devices.Lights
 * @version WindowsRuntime 1.4
 */
class LampArray extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampArray

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampArray.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves an Advanced Query Syntax (AQS) string encompassing all LampArray devices on the system.
     * @remarks
     * You can use this string with the [DeviceInformation.FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync) method or [DeviceWatcher](../windows.devices.enumeration/devicewatcher.md) to get [DeviceInformation](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) objects for those LampArrays
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!LampArray.HasProp("__ILampArrayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.LampArray")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArrayStatics.IID)
            LampArray.__ILampArrayStatics := ILampArrayStatics(factoryPtr)
        }

        return LampArray.__ILampArrayStatics.GetDeviceSelector()
    }

    /**
     * Retrieves a LampArray object asynchronously for the LampArray device that has the specified plug and play (PnP) device identifier/device instance path.
     * @param {HSTRING} deviceId The device identifier/device instance path of the device. To obtain the value, get the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) property value retrieved from [DeviceWatcher](../windows.devices.enumeration/devicewatcher.md)
     * @returns {IAsyncOperation<LampArray>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!LampArray.HasProp("__ILampArrayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.LampArray")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArrayStatics.IID)
            LampArray.__ILampArrayStatics := ILampArrayStatics(factoryPtr)
        }

        return LampArray.__ILampArrayStatics.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the plug and play (PnP) device identifier of the underlying LampArray device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * The hardware vendor Id of the underlying device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.hardwarevendorid
     * @type {Integer} 
     */
    HardwareVendorId {
        get => this.get_HardwareVendorId()
    }

    /**
     * The hardware product Id of the underlying device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.hardwareproductid
     * @type {Integer} 
     */
    HardwareProductId {
        get => this.get_HardwareProductId()
    }

    /**
     * The hardware version of the underlying device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.hardwareversion
     * @type {Integer} 
     */
    HardwareVersion {
        get => this.get_HardwareVersion()
    }

    /**
     * Gets the type of lamp array device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.lamparraykind
     * @type {Integer} 
     */
    LampArrayKind {
        get => this.get_LampArrayKind()
    }

    /**
     * The number of lamps part of this LampArray.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.lampcount
     * @type {Integer} 
     */
    LampCount {
        get => this.get_LampCount()
    }

    /**
     * Minimal interval (required by the device) between the system sending two updates for any one lamp.  This is comparable to the effective device refresh rate.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.minupdateinterval
     * @type {TimeSpan} 
     */
    MinUpdateInterval {
        get => this.get_MinUpdateInterval()
    }

    /**
     * Gets the logical bounding box encompassing the LampArray.
     * @remarks
     * - X corresponds to Width.
     * - Y corresponds to Height.
     * - Z corresponds to Depth.
     * 
     * Values are measured in meters.
     * 
     * Origin of [Positions](lampinfo_position.md) is the upmost, top, left corner of the box.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.boundingbox
     * @type {Vector3} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
    }

    /**
     * Gets or sets the enabled state.
     * @remarks
     * When disabled, state for a lamp index can be set internally, but will not be sent to the device. When set back to enabled, modified state is flushed to the device.
     * 
     * By default, LampArray is always enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets the overall brightness of the LampArray, where 0.0 is completely off and 1.0 is maximum brightness.
     * 
     * Every lamp is scaled equally by the brightness.
     * @remarks
     * Values must be between 0.0 and 1.0 (inclusive).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.brightnesslevel
     * @type {Float} 
     */
    BrightnessLevel {
        get => this.get_BrightnessLevel()
        set => this.put_BrightnessLevel(value)
    }

    /**
     * Gets a value indicating whether the LampArray device is connected to the system.
     * @remarks
     * Once disconnected, further calls to the object are null-ops and the object should be thrown away.  [DeviceWatcher](../windows.devices.enumeration/devicewatcher.md) should be used to determine if the device is reconnected, and then a new LampArray instance should be created [FromIdAsync](lamparray_fromidasync_1322863552.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.isconnected
     * @type {Boolean} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

    /**
     * Boolean indicating whether any lamp is mapped to a virtual key.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.supportsvirtualkeys
     * @type {Boolean} 
     */
    SupportsVirtualKeys {
        get => this.get_SupportsVirtualKeys()
    }

    /**
     * Gets whether the lamp array is available or unavailable for control by this process.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.isavailable
     * @type {Boolean} 
     */
    IsAvailable {
        get => this.get_IsAvailable()
    }

    /**
     * Is raised when the value of [IsAvailable](lamparray_isavailable.md) changes; which can happen when the user changes system access to the device through the device settings.
     * 
     * The event handler's parameters are the sender [LampArray](./lamparray.md) whose property has changed, and an **Object** (which is always null).
     * @remarks
     * Both foreground and background ("ambient") apps can receive and handle this event.
     * 
     * To use this event, you must declare the "com.microsoft.windows.lighting" AppExtension in the app manifest. For details about how to do that, see [Create and host an app extension](/windows/uwp/launch-resume/how-to-create-an-extension).
     * 
     * ```xml
     * <Extensions>
     *     <uap3:Extension Category="windows.appExtension">
     *         <uap3:AppExtension Name="com.microsoft.windows.lighting" Id="Id" DisplayName="Id">
     *         </uap3:AppExtension> 
     *     </uap3:Extension>
     * </Extensions>
     * ```
     * @type {TypedEventHandler<LampArray, IInspectable>}
    */
    OnAvailabilityChanged {
        get {
            if(!this.HasProp("__OnAvailabilityChanged")){
                this.__OnAvailabilityChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1229c9f2-783e-5bc8-9a1e-772e45e66401}"),
                    LampArray,
                    IInspectable
                )
                this.__OnAvailabilityChangedToken := this.add_AvailabilityChanged(this.__OnAvailabilityChanged.iface)
            }
            return this.__OnAvailabilityChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAvailabilityChangedToken")) {
            this.remove_AvailabilityChanged(this.__OnAvailabilityChangedToken)
            this.__OnAvailabilityChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareVendorId() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_HardwareVendorId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareProductId() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_HardwareProductId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareVersion() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_HardwareVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LampArrayKind() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_LampArrayKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LampCount() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_LampCount()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinUpdateInterval() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_MinUpdateInterval()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_BoundingBox() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_BoundingBox()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BrightnessLevel() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_BrightnessLevel()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BrightnessLevel(value) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.put_BrightnessLevel(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnected() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_IsConnected()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsVirtualKeys() {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.get_SupportsVirtualKeys()
    }

    /**
     * Fetches the [LampInfo](lampinfo.md) corresponding to the lamp index.
     * @remarks
     * The [LampInfo](lampinfo.md) contains properties about a lamp of a given index.
     * @param {Integer} lampIndex The index. Must be between 0 and [LampCount](lamparray_lampcount.md) - 1.
     * @returns {LampInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.getlampinfo
     */
    GetLampInfo(lampIndex) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.GetLampInfo(lampIndex)
    }

    /**
     * Searches for all lamp indices that are bound to the specific [VirtualKey](../windows.system/virtualkey.md)
     * @remarks
     * Lamp indices can be (optionally) bound by the device to only a single key.  A [VirtualKey](../windows.system/virtualkey.md) may have 1 or more indices bound to it.
     * @param {Integer} key The [VirtualKey](../windows.system/virtualkey.md).
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Array of all lamp indices that are bound to the specific [VirtualKey](../windows.system/virtualkey.md).  Array is empty if no lamp indices are found bound to the [VirtualKey](../windows.system/virtualkey.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.getindicesforkey
     */
    GetIndicesForKey(key, result_) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.GetIndicesForKey(key, result_)
    }

    /**
     * Searches for all lamp indices that are bound to the specified [LampPurposes](lamppurposes.md).
     * @remarks
     * Lamp indices can be (optionally) bound by the device to multiple [LampPurposes](lamppurposes.md).
     * @param {Integer} purposes The [LampPurposes](lamppurposes.md).
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Array of all lamp indices that are bound to the specific [LampPurposes](lamppurposes.md).  Array is empty if no lamp indices are found bound to the [LampPurposes](lamppurposes.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.getindicesforpurposes
     */
    GetIndicesForPurposes(purposes, result_) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.GetIndicesForPurposes(purposes, result_)
    }

    /**
     * Sets every lamp belonging to the LampArray to the desired color.
     * @remarks
     * If a lamp doesn't support the desired color, it is set to the [NearestSupportedColor](lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Color} desiredColor Desired color to set every lamp to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.setcolor
     */
    SetColor(desiredColor) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.SetColor(desiredColor)
    }

    /**
     * Sets the lamp corresponding to the index to the desired color.
     * @remarks
     * If the lamp at the index doesn't support the desired color, it is set to the [NearestSupportedColor](lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * If the index does not exist on the device, the call fails silently.
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Integer} lampIndex The lamp index.
     * @param {Color} desiredColor The desired color.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.setcolorforindex
     */
    SetColorForIndex(lampIndex, desiredColor) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.SetColorForIndex(lampIndex, desiredColor)
    }

    /**
     * Sets all lamps specified to the same color.
     * @remarks
     * If the lamp doesn't support the desired color, it is set to the [NearestSupportedColor](lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * If an index does not exist on the device, it is ignored and the remaining are still applied.
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Color} desiredColor The desired color.
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes Array of lamp indexes to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.setsinglecolorforindices
     */
    SetSingleColorForIndices(desiredColor, lampIndexes_length, lampIndexes) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.SetSingleColorForIndices(desiredColor, lampIndexes_length, lampIndexes)
    }

    /**
     * Sets the color for multiple lamps. Position within each array maps lamp index to desired color.
     * @remarks
     * Size of desiredColors and lampIndexes arrays must be identical or call will fail.
     * 
     * If the lamp doesn't support the desired color, it is set to the [NearestSupportedColor](lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * If an index does not exist on the device, it is ignored and the remaining are still applied.
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Integer} desiredColors_length 
     * @param {Pointer<Color>} desiredColors Array of desired colors.
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes Array of corresponding lamp indexes to modify.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.setcolorsforindices
     */
    SetColorsForIndices(desiredColors_length, desiredColors, lampIndexes_length, lampIndexes) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.SetColorsForIndices(desiredColors_length, desiredColors, lampIndexes_length, lampIndexes)
    }

    /**
     * Sets the color for all lamps that map to the [key](../windows.system/virtualkey.md). Multiple lamps can map to the same [key](../windows.system/virtualkey.md).
     * @remarks
     * If the lamp doesn't support the desired color, it is set to the [NearestSupportedColor](lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * If the key is not bound to any lamp, the call fails silently.
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Color} desiredColor The desired color.
     * @param {Integer} key The [VirtualKey](../windows.system/virtualkey.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.setcolorsforkey
     */
    SetColorsForKey(desiredColor, key) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.SetColorsForKey(desiredColor, key)
    }

    /**
     * Sets the color of multiple lamps, corresponding to mapped [keys](../windows.system/virtualkey.md).  Position within each array maps [keys](../windows.system/virtualkey.md) to desired color.
     * @remarks
     * If the lamp index doesn't support the desired color, it is set to the [NearestSupportedColor](lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * If a [VirtualKey](../windows.system/virtualkey.md) is not bound to any lamp on the device, it is ignored and the remaining are still applied.
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Integer} desiredColors_length 
     * @param {Pointer<Color>} desiredColors Array of desired colors.
     * @param {Integer} keys_length 
     * @param {Pointer<Integer>} keys Array of corresponding [VirtualKeys](../windows.system/virtualkey.md) to modify.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.setcolorsforkeys
     */
    SetColorsForKeys(desiredColors_length, desiredColors, keys_length, keys) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.SetColorsForKeys(desiredColors_length, desiredColors, keys_length, keys)
    }

    /**
     * Sets the color of multiple lamps, corresponding to [LampPurposes](lamppurposes.md).
     * @remarks
     * If the lamp doesn't support the desired color, it is set to the [NearestSupportedColor](lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Color} desiredColor Array of desired colors.
     * @param {Integer} purposes Array of corresponding [LampPurposes](lamppurposes.md) to modify.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.setcolorsforpurposes
     */
    SetColorsForPurposes(desiredColor, purposes) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.SetColorsForPurposes(desiredColor, purposes)
    }

    /**
     * Asynchronously sends a message identified by the message identifer argument.
     * @param {Integer} messageId The identifer of a message.
     * @param {IBuffer} message An [IBuffer](/uwp/api/windows.storage.streams.ibuffer) representing the message.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.sendmessageasync
     */
    SendMessageAsync(messageId, message) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.SendMessageAsync(messageId, message)
    }

    /**
     * Asynchronously retrieves an [IBuffer](/uwp/api/windows.storage.streams.ibuffer) representing the message identified by the message identifer argument.
     * @param {Integer} messageId The identifer of a message.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparray.requestmessageasync
     */
    RequestMessageAsync(messageId) {
        if (!this.HasProp("__ILampArray")) {
            if ((queryResult := this.QueryInterface(ILampArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray := ILampArray(outPtr)
        }

        return this.__ILampArray.RequestMessageAsync(messageId)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAvailable() {
        if (!this.HasProp("__ILampArray2")) {
            if ((queryResult := this.QueryInterface(ILampArray2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray2 := ILampArray2(outPtr)
        }

        return this.__ILampArray2.get_IsAvailable()
    }

    /**
     * 
     * @param {TypedEventHandler<LampArray, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AvailabilityChanged(handler) {
        if (!this.HasProp("__ILampArray2")) {
            if ((queryResult := this.QueryInterface(ILampArray2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray2 := ILampArray2(outPtr)
        }

        return this.__ILampArray2.add_AvailabilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AvailabilityChanged(token) {
        if (!this.HasProp("__ILampArray2")) {
            if ((queryResult := this.QueryInterface(ILampArray2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArray2 := ILampArray2(outPtr)
        }

        return this.__ILampArray2.remove_AvailabilityChanged(token)
    }

;@endregion Instance Methods
}
