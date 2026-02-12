#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAppearanceCategoriesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Indicates the appearance category code of the Bluetooth LE device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAppearanceCategories extends IInspectable {
;@region Static Properties
    /**
     * Gets the uncategorized appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.uncategorized
     * @type {Integer} 
     */
    static Uncategorized {
        get => BluetoothLEAppearanceCategories.get_Uncategorized()
    }

    /**
     * Gets the phone appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.phone
     * @type {Integer} 
     */
    static Phone {
        get => BluetoothLEAppearanceCategories.get_Phone()
    }

    /**
     * Gets the computer appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.computer
     * @type {Integer} 
     */
    static Computer {
        get => BluetoothLEAppearanceCategories.get_Computer()
    }

    /**
     * Gets the watch appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.watch
     * @type {Integer} 
     */
    static Watch {
        get => BluetoothLEAppearanceCategories.get_Watch()
    }

    /**
     * Gets the clock appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.clock
     * @type {Integer} 
     */
    static Clock {
        get => BluetoothLEAppearanceCategories.get_Clock()
    }

    /**
     * Gets the display appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.display
     * @type {Integer} 
     */
    static Display {
        get => BluetoothLEAppearanceCategories.get_Display()
    }

    /**
     * Gets the remote control appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.remotecontrol
     * @type {Integer} 
     */
    static RemoteControl {
        get => BluetoothLEAppearanceCategories.get_RemoteControl()
    }

    /**
     * Gets the eye glasses appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.eyeglasses
     * @type {Integer} 
     */
    static EyeGlasses {
        get => BluetoothLEAppearanceCategories.get_EyeGlasses()
    }

    /**
     * Gets the tag appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.tag
     * @type {Integer} 
     */
    static Tag {
        get => BluetoothLEAppearanceCategories.get_Tag()
    }

    /**
     * Gets the key ring appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.keyring
     * @type {Integer} 
     */
    static Keyring {
        get => BluetoothLEAppearanceCategories.get_Keyring()
    }

    /**
     * Gets the media player appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.mediaplayer
     * @type {Integer} 
     */
    static MediaPlayer {
        get => BluetoothLEAppearanceCategories.get_MediaPlayer()
    }

    /**
     * Gets the barcode scanner appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.barcodescanner
     * @type {Integer} 
     */
    static BarcodeScanner {
        get => BluetoothLEAppearanceCategories.get_BarcodeScanner()
    }

    /**
     * Gets the thermometer appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.thermometer
     * @type {Integer} 
     */
    static Thermometer {
        get => BluetoothLEAppearanceCategories.get_Thermometer()
    }

    /**
     * Gets the heart rate appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.heartrate
     * @type {Integer} 
     */
    static HeartRate {
        get => BluetoothLEAppearanceCategories.get_HeartRate()
    }

    /**
     * Gets the blood pressure appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.bloodpressure
     * @type {Integer} 
     */
    static BloodPressure {
        get => BluetoothLEAppearanceCategories.get_BloodPressure()
    }

    /**
     * Gets the human interface device appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.humaninterfacedevice
     * @type {Integer} 
     */
    static HumanInterfaceDevice {
        get => BluetoothLEAppearanceCategories.get_HumanInterfaceDevice()
    }

    /**
     * Gets the glucose meter appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.glucosemeter
     * @type {Integer} 
     */
    static GlucoseMeter {
        get => BluetoothLEAppearanceCategories.get_GlucoseMeter()
    }

    /**
     * Gets the running or walking appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.runningwalking
     * @type {Integer} 
     */
    static RunningWalking {
        get => BluetoothLEAppearanceCategories.get_RunningWalking()
    }

    /**
     * Gets the cycling appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.cycling
     * @type {Integer} 
     */
    static Cycling {
        get => BluetoothLEAppearanceCategories.get_Cycling()
    }

    /**
     * Gets the pulse oximeter appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.pulseoximeter
     * @type {Integer} 
     */
    static PulseOximeter {
        get => BluetoothLEAppearanceCategories.get_PulseOximeter()
    }

    /**
     * Gets the weight scale appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.weightscale
     * @type {Integer} 
     */
    static WeightScale {
        get => BluetoothLEAppearanceCategories.get_WeightScale()
    }

    /**
     * Gets the outdoor sport activity appearance category code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancecategories.outdoorsportactivity
     * @type {Integer} 
     */
    static OutdoorSportActivity {
        get => BluetoothLEAppearanceCategories.get_OutdoorSportActivity()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Uncategorized() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Uncategorized()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Phone() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Phone()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Computer() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Computer()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Watch() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Watch()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Clock() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Clock()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Display() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Display()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RemoteControl() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_RemoteControl()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_EyeGlasses() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_EyeGlasses()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Tag() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Tag()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Keyring() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Keyring()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MediaPlayer() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_MediaPlayer()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BarcodeScanner() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_BarcodeScanner()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Thermometer() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Thermometer()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_HeartRate() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_HeartRate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BloodPressure() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_BloodPressure()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_HumanInterfaceDevice() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_HumanInterfaceDevice()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_GlucoseMeter() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_GlucoseMeter()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RunningWalking() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_RunningWalking()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Cycling() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_Cycling()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PulseOximeter() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_PulseOximeter()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_WeightScale() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_WeightScale()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_OutdoorSportActivity() {
        if (!BluetoothLEAppearanceCategories.HasProp("__IBluetoothLEAppearanceCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceCategoriesStatics.IID)
            BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics := IBluetoothLEAppearanceCategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceCategories.__IBluetoothLEAppearanceCategoriesStatics.get_OutdoorSportActivity()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
