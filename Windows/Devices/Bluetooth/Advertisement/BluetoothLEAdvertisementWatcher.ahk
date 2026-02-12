#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementWatcher.ahk
#Include .\IBluetoothLEAdvertisementWatcher2.ahk
#Include .\IBluetoothLEAdvertisementWatcher3.ahk
#Include .\IBluetoothLEAdvertisementWatcherFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\BluetoothLEAdvertisementWatcher.ahk
#Include .\BluetoothLEAdvertisementReceivedEventArgs.ahk
#Include .\BluetoothLEAdvertisementWatcherStoppedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * An object to receive Bluetooth Low Energy (LE) advertisements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementWatcher.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) object with an advertisement filter to initialize the watcher.
     * @param {BluetoothLEAdvertisementFilter} advertisementFilter The advertisement filter to initialize the watcher.
     * @returns {BluetoothLEAdvertisementWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.#ctor
     */
    static Create(advertisementFilter) {
        if (!BluetoothLEAdvertisementWatcher.HasProp("__IBluetoothLEAdvertisementWatcherFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementWatcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementWatcherFactory.IID)
            BluetoothLEAdvertisementWatcher.__IBluetoothLEAdvertisementWatcherFactory := IBluetoothLEAdvertisementWatcherFactory(factoryPtr)
        }

        return BluetoothLEAdvertisementWatcher.__IBluetoothLEAdvertisementWatcherFactory.Create(advertisementFilter)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the minimum sampling interval.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.minsamplinginterval
     * @type {TimeSpan} 
     */
    MinSamplingInterval {
        get => this.get_MinSamplingInterval()
    }

    /**
     * Gets the maximum sampling interval.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.maxsamplinginterval
     * @type {TimeSpan} 
     */
    MaxSamplingInterval {
        get => this.get_MaxSamplingInterval()
    }

    /**
     * Gets the minimum out of range timeout.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.minoutofrangetimeout
     * @type {TimeSpan} 
     */
    MinOutOfRangeTimeout {
        get => this.get_MinOutOfRangeTimeout()
    }

    /**
     * Gets the maximum out of range timeout.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.maxoutofrangetimeout
     * @type {TimeSpan} 
     */
    MaxOutOfRangeTimeout {
        get => this.get_MaxOutOfRangeTimeout()
    }

    /**
     * Gets the current status of the [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets or sets the Bluetooth LE scanning mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.scanningmode
     * @type {Integer} 
     */
    ScanningMode {
        get => this.get_ScanningMode()
        set => this.put_ScanningMode(value)
    }

    /**
     * Gets or sets a [BluetoothSignalStrengthFilter](../windows.devices.bluetooth/bluetoothsignalstrengthfilter.md) object used for configuration of Bluetooth LE advertisement filtering that uses signal strength-based filtering.
     * @remarks
     * The SignalStrengthFilter has additional limitations on its properties when used by the [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) class. An exception will be thrown when the watcher is started with parameters outside of the valid range. If the properties are left as **NULL**, a default value is selected.
     * 
     * The additional restrictions and default values are as follows:
     * 
     * 
     * + [InRangeThresholdInDBm](../windows.devices.bluetooth/bluetoothsignalstrengthfilter_inrangethresholdindbm.md) - The maximum value for RSSI for Bluetooth LE is +20. The minimum value for RSSI for BR/EDR is -127 (default when **NULL** is -127.
     * + [OutOfRangeThresholdInDBm](../windows.devices.bluetooth/bluetoothsignalstrengthfilter_outofrangethresholdindbm.md) - The maximum value for RSSI for Bluetooth LE is +20. The minimum value for RSSI for BR/EDR is -127 (default when **NULL** is -127).
     * + [OutOfRangeTimeout](../windows.devices.bluetooth/bluetoothsignalstrengthfilter_outofrangetimeout.md) - Equal or greater than 1 second and less than or equal to 60 seconds (default when **NULL** is 60 seconds).
     * + [SamplingInterval](../windows.devices.bluetooth/bluetoothsignalstrengthfilter_samplinginterval.md) - Equal or greater than 0. Any sampling interval greater or equal to 25.5 seconds will disable sampling entirely. In that special case, the filtering is trigger-based. For more information about the behavior of the RSSI filtering, refer to the [BluetoothSignalStrengthFilter](../windows.devices.bluetooth/bluetoothsignalstrengthfilter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.signalstrengthfilter
     * @type {BluetoothSignalStrengthFilter} 
     */
    SignalStrengthFilter {
        get => this.get_SignalStrengthFilter()
        set => this.put_SignalStrengthFilter(value)
    }

    /**
     * Gets or sets a [BluetoothLEAdvertisementFilter](bluetoothleadvertisementfilter.md) object used for configuration of Bluetooth LE advertisement filtering that uses payload section-based filtering.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.advertisementfilter
     * @type {BluetoothLEAdvertisementFilter} 
     */
    AdvertisementFilter {
        get => this.get_AdvertisementFilter()
        set => this.put_AdvertisementFilter(value)
    }

    /**
     * Enables reception of advertisements using the Extended Advertising format. Defaults to False.
     * @remarks
     * The Extended Advertisement format allows for further customization of the advertising header. See the related APIs for more information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.allowextendedadvertisements
     * @type {Boolean} 
     */
    AllowExtendedAdvertisements {
        get => this.get_AllowExtendedAdvertisements()
        set => this.put_AllowExtendedAdvertisements(value)
    }

    /**
     * @type {Boolean} 
     */
    UseUncoded1MPhy {
        get => this.get_UseUncoded1MPhy()
        set => this.put_UseUncoded1MPhy(value)
    }

    /**
     * @type {Boolean} 
     */
    UseCodedPhy {
        get => this.get_UseCodedPhy()
        set => this.put_UseCodedPhy(value)
    }

    /**
     * @type {BluetoothLEAdvertisementScanParameters} 
     */
    ScanParameters {
        get => this.get_ScanParameters()
        set => this.put_ScanParameters(value)
    }

    /**
     * @type {Boolean} 
     */
    UseHardwareFilter {
        get => this.get_UseHardwareFilter()
        set => this.put_UseHardwareFilter(value)
    }

    /**
     * Notification for new Bluetooth LE advertisement events received.
     * @type {TypedEventHandler<BluetoothLEAdvertisementWatcher, BluetoothLEAdvertisementReceivedEventArgs>}
    */
    OnReceived {
        get {
            if(!this.HasProp("__OnReceived")){
                this.__OnReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{90eb4eca-d465-5ea0-a61c-033c8c5ecef2}"),
                    BluetoothLEAdvertisementWatcher,
                    BluetoothLEAdvertisementReceivedEventArgs
                )
                this.__OnReceivedToken := this.add_Received(this.__OnReceived.iface)
            }
            return this.__OnReceived
        }
    }

    /**
     * Notification to the app that the Bluetooth LE scanning for advertisements has been cancelled or aborted either by the app or due to an error.
     * @type {TypedEventHandler<BluetoothLEAdvertisementWatcher, BluetoothLEAdvertisementWatcherStoppedEventArgs>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9936a4db-dc99-55c3-9e9b-bf4854bd9eab}"),
                    BluetoothLEAdvertisementWatcher,
                    BluetoothLEAdvertisementWatcherStoppedEventArgs
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementWatcher")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnReceivedToken")) {
            this.remove_Received(this.__OnReceivedToken)
            this.__OnReceived.iface.Dispose()
        }

        if(this.HasProp("__OnStoppedToken")) {
            this.remove_Stopped(this.__OnStoppedToken)
            this.__OnStopped.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinSamplingInterval() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.get_MinSamplingInterval()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxSamplingInterval() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.get_MaxSamplingInterval()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinOutOfRangeTimeout() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.get_MinOutOfRangeTimeout()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxOutOfRangeTimeout() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.get_MaxOutOfRangeTimeout()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScanningMode() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.get_ScanningMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ScanningMode(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.put_ScanningMode(value)
    }

    /**
     * 
     * @returns {BluetoothSignalStrengthFilter} 
     */
    get_SignalStrengthFilter() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.get_SignalStrengthFilter()
    }

    /**
     * 
     * @param {BluetoothSignalStrengthFilter} value 
     * @returns {HRESULT} 
     */
    put_SignalStrengthFilter(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.put_SignalStrengthFilter(value)
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisementFilter} 
     */
    get_AdvertisementFilter() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.get_AdvertisementFilter()
    }

    /**
     * 
     * @param {BluetoothLEAdvertisementFilter} value 
     * @returns {HRESULT} 
     */
    put_AdvertisementFilter(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.put_AdvertisementFilter(value)
    }

    /**
     * Start the [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) to scan for Bluetooth LE advertisements.
     * @remarks
     * When the system enters any of the supported sleep states (such as S3 or S4), the Bluetooth controller is reset. That reset cycle causes any existing Bluetooth advertisements to be removed from the queue. But if your app still has a watcher in the on state when the system wakes up, then scanning will resume automatically; and your app will receive new advertisements.
     * 
     * For Modern Standby, the system might continue scanning, but your app might not receive advertisements. That depends on various factors such as whether your app is running in an AppContainer, whether it’s a session 0 service, and other factors. We don’t recommend that you scan during a Modern Standby session; instead, your app will need to stop actively scanning, and then resume scanning after the system itself resumes. Applications that don't stop scanning while in Modern Standby might have their execution paused while in Modern Standby, leading to a queue of stale advertisements being returned to the application when the system resumes normal operation.
     * 
     * [GUID_MONITOR_POWER_ON]( /windows/win32/power/power-setting-guids) indicates that the primary system monitor has been powered on or off&mdash;so that *can* imply Modern Standby on some system configurations. But be aware that a system with its primary system monitor powered off might not always go into Modern Standby. For example, when the monitor is configured to power off when idle, but the system itself isn’t configured to go to sleep.
     * 
     * Applications running outside an AppContainer (such as session 0 services or Win32 applications) can register to get notifications for power events (see [Registering for power events](/windows/win32/power/registering-for-power-events)) to receive **WM_POWERBROADCAST** messages. The system sends a **PBT_APMSUSPEND** message shortly before it suspends. Once it resumes operation, it sends a **PBT_APMRESUMEAUTOMATIC** message. Also, it sends another **PBT_APMRESUMESUSPEND** message if the resume is triggered by user input.
     * 
     * This method will transition the [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) to the **Started** state immediately with a pending scan request or to the **Aborted** state if the request failed immediately due to error.
     * 
     * If this method is called in the **Stopping** state, the request will be pended and the state will remain in the **Stopping** state until the request completes, at which time a new request will be sent and the state will transition to the **Started** state.
     * 
     * The [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) will be automatically stopped when an app is suspended.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.start
     */
    Start() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.Start()
    }

    /**
     * Stop the [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) and disable the scanning for Bluetooth LE advertisements.
     * @remarks
     * This method will transition the [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) to the **Stopping** state until the scan is cancelled in which the state will transition to the **Stopped** state. Calling this method in the **Stopped** or **Aborted** state has no effect. Calling this method in the **Stopping** state will overwrite any advertisements received in the last [Start](bluetoothleadvertisementwatcher_start_1587696324.md) method call during that state.
     * 
     * The [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) will be automatically stopped when an app is suspended.
     * 
     * > [!NOTE]
     * > Stopping the scan for the [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) will not actually stop the Bluetooth radio from scanning if another app or the system still requires the radio to remain in a scanning state.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEAdvertisementWatcher, BluetoothLEAdvertisementReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Received(handler) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.add_Received(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Received(token) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.remove_Received(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEAdvertisementWatcher, BluetoothLEAdvertisementWatcherStoppedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher := IBluetoothLEAdvertisementWatcher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowExtendedAdvertisements() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher2 := IBluetoothLEAdvertisementWatcher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher2.get_AllowExtendedAdvertisements()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowExtendedAdvertisements(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher2 := IBluetoothLEAdvertisementWatcher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher2.put_AllowExtendedAdvertisements(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseUncoded1MPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher3 := IBluetoothLEAdvertisementWatcher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher3.get_UseUncoded1MPhy()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseUncoded1MPhy(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher3 := IBluetoothLEAdvertisementWatcher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher3.put_UseUncoded1MPhy(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseCodedPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher3 := IBluetoothLEAdvertisementWatcher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher3.get_UseCodedPhy()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseCodedPhy(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher3 := IBluetoothLEAdvertisementWatcher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher3.put_UseCodedPhy(value)
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisementScanParameters} 
     */
    get_ScanParameters() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher3 := IBluetoothLEAdvertisementWatcher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher3.get_ScanParameters()
    }

    /**
     * 
     * @param {BluetoothLEAdvertisementScanParameters} value 
     * @returns {HRESULT} 
     */
    put_ScanParameters(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher3 := IBluetoothLEAdvertisementWatcher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher3.put_ScanParameters(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseHardwareFilter() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher3 := IBluetoothLEAdvertisementWatcher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher3.get_UseHardwareFilter()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseHardwareFilter(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcher3 := IBluetoothLEAdvertisementWatcher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcher3.put_UseHardwareFilter(value)
    }

;@endregion Instance Methods
}
