#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAppearanceSubcategoriesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Indicates the appearance subcategory code of the Bluetooth LE device. For more info on how sub categories map to categories, see the [Bluetooth Specification](https://www.bluetooth.com/specifications/gatt).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAppearanceSubcategories extends IInspectable {
;@region Static Properties
    /**
     * Gets the generic appearance subcategory code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.generic
     * @type {Integer} 
     */
    static Generic {
        get => BluetoothLEAppearanceSubcategories.get_Generic()
    }

    /**
     * Gets the sports watch appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.RunningWalking](bluetoothleappearancecategories_runningwalking.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.sportswatch
     * @type {Integer} 
     */
    static SportsWatch {
        get => BluetoothLEAppearanceSubcategories.get_SportsWatch()
    }

    /**
     * Gets the ear thermometer appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.RunningWalking](bluetoothleappearancecategories_runningwalking.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.thermometerear
     * @type {Integer} 
     */
    static ThermometerEar {
        get => BluetoothLEAppearanceSubcategories.get_ThermometerEar()
    }

    /**
     * Gets the heart rate belt appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.HeartRate](bluetoothleappearancecategories_heartrate.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.heartratebelt
     * @type {Integer} 
     */
    static HeartRateBelt {
        get => BluetoothLEAppearanceSubcategories.get_HeartRateBelt()
    }

    /**
     * Gets the blood pressure arm appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.BloodPressure](bluetoothleappearancecategories_bloodpressure.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.bloodpressurearm
     * @type {Integer} 
     */
    static BloodPressureArm {
        get => BluetoothLEAppearanceSubcategories.get_BloodPressureArm()
    }

    /**
     * Gets the blood pressure wrist appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.BloodPressure](bluetoothleappearancecategories_bloodpressure.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.bloodpressurewrist
     * @type {Integer} 
     */
    static BloodPressureWrist {
        get => BluetoothLEAppearanceSubcategories.get_BloodPressureWrist()
    }

    /**
     * Gets the keyboard appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.HumanInterfaceDevice](bluetoothleappearancecategories_humaninterfacedevice.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.keyboard
     * @type {Integer} 
     */
    static Keyboard {
        get => BluetoothLEAppearanceSubcategories.get_Keyboard()
    }

    /**
     * Gets the mouse appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.HumanInterfaceDevice](bluetoothleappearancecategories_humaninterfacedevice.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.mouse
     * @type {Integer} 
     */
    static Mouse {
        get => BluetoothLEAppearanceSubcategories.get_Mouse()
    }

    /**
     * Gets the joystick appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.HumanInterfaceDevice](bluetoothleappearancecategories_humaninterfacedevice.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.joystick
     * @type {Integer} 
     */
    static Joystick {
        get => BluetoothLEAppearanceSubcategories.get_Joystick()
    }

    /**
     * Gets the gamepad appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.HumanInterfaceDevice](bluetoothleappearancecategories_humaninterfacedevice.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.gamepad
     * @type {Integer} 
     */
    static Gamepad {
        get => BluetoothLEAppearanceSubcategories.get_Gamepad()
    }

    /**
     * Gets the digitizer tablet appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.HumanInterfaceDevice](bluetoothleappearancecategories_humaninterfacedevice.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.digitizertablet
     * @type {Integer} 
     */
    static DigitizerTablet {
        get => BluetoothLEAppearanceSubcategories.get_DigitizerTablet()
    }

    /**
     * Gets the card reader appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.HumanInterfaceDevice](bluetoothleappearancecategories_humaninterfacedevice.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.cardreader
     * @type {Integer} 
     */
    static CardReader {
        get => BluetoothLEAppearanceSubcategories.get_CardReader()
    }

    /**
     * Gets the digital pen appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.HumanInterfaceDevice](bluetoothleappearancecategories_humaninterfacedevice.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.digitalpen
     * @type {Integer} 
     */
    static DigitalPen {
        get => BluetoothLEAppearanceSubcategories.get_DigitalPen()
    }

    /**
     * Gets the pulse barcode scanner appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.HumanInterfaceDevice](bluetoothleappearancecategories_humaninterfacedevice.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.barcodescanner
     * @type {Integer} 
     */
    static BarcodeScanner {
        get => BluetoothLEAppearanceSubcategories.get_BarcodeScanner()
    }

    /**
     * Gets the running or walking in shoe appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.RunningWalking](bluetoothleappearancecategories_runningwalking.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.runningwalkinginshoe
     * @type {Integer} 
     */
    static RunningWalkingInShoe {
        get => BluetoothLEAppearanceSubcategories.get_RunningWalkingInShoe()
    }

    /**
     * Gets the running or walking on shoe appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.RunningWalking](bluetoothleappearancecategories_runningwalking.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.runningwalkingonshoe
     * @type {Integer} 
     */
    static RunningWalkingOnShoe {
        get => BluetoothLEAppearanceSubcategories.get_RunningWalkingOnShoe()
    }

    /**
     * Gets the running or walking on hip appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.RunningWalking](bluetoothleappearancecategories_runningwalking.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.runningwalkingonhip
     * @type {Integer} 
     */
    static RunningWalkingOnHip {
        get => BluetoothLEAppearanceSubcategories.get_RunningWalkingOnHip()
    }

    /**
     * Gets the cycling computer appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.Cycling](bluetoothleappearancecategories_cycling.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.cyclingcomputer
     * @type {Integer} 
     */
    static CyclingComputer {
        get => BluetoothLEAppearanceSubcategories.get_CyclingComputer()
    }

    /**
     * Gets the cycling speed sensor appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.Cycling](bluetoothleappearancecategories_cycling.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.cyclingspeedsensor
     * @type {Integer} 
     */
    static CyclingSpeedSensor {
        get => BluetoothLEAppearanceSubcategories.get_CyclingSpeedSensor()
    }

    /**
     * Gets the cycling cadence sensor appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.Cycling](bluetoothleappearancecategories_cycling.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.cyclingcadencesensor
     * @type {Integer} 
     */
    static CyclingCadenceSensor {
        get => BluetoothLEAppearanceSubcategories.get_CyclingCadenceSensor()
    }

    /**
     * Gets the cycling power sensor appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.Cycling](bluetoothleappearancecategories_cycling.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.cyclingpowersensor
     * @type {Integer} 
     */
    static CyclingPowerSensor {
        get => BluetoothLEAppearanceSubcategories.get_CyclingPowerSensor()
    }

    /**
     * Gets the cycling speed cadence sensor appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.Cycling](bluetoothleappearancecategories_cycling.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.cyclingspeedcadencesensor
     * @type {Integer} 
     */
    static CyclingSpeedCadenceSensor {
        get => BluetoothLEAppearanceSubcategories.get_CyclingSpeedCadenceSensor()
    }

    /**
     * Gets the oximeter fingertip appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.PulseOximeter](bluetoothleappearancecategories_pulseoximeter.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.oximeterfingertip
     * @type {Integer} 
     */
    static OximeterFingertip {
        get => BluetoothLEAppearanceSubcategories.get_OximeterFingertip()
    }

    /**
     * Gets the oximeter wrist worn appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.PulseOximeter](bluetoothleappearancecategories_pulseoximeter.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.oximeterwristworn
     * @type {Integer} 
     */
    static OximeterWristWorn {
        get => BluetoothLEAppearanceSubcategories.get_OximeterWristWorn()
    }

    /**
     * Gets the location display appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.OutdoorSportActivity](bluetoothleappearancecategories_outdoorsportactivity.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.locationdisplay
     * @type {Integer} 
     */
    static LocationDisplay {
        get => BluetoothLEAppearanceSubcategories.get_LocationDisplay()
    }

    /**
     * Gets the location navigation display appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.OutdoorSportActivity](bluetoothleappearancecategories_outdoorsportactivity.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.locationnavigationdisplay
     * @type {Integer} 
     */
    static LocationNavigationDisplay {
        get => BluetoothLEAppearanceSubcategories.get_LocationNavigationDisplay()
    }

    /**
     * Gets the location pod appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.OutdoorSportActivity](bluetoothleappearancecategories_outdoorsportactivity.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.locationpod
     * @type {Integer} 
     */
    static LocationPod {
        get => BluetoothLEAppearanceSubcategories.get_LocationPod()
    }

    /**
     * Gets the location navigation pod appearance subcategory code. This is only applicable for Bluetooth LE devices that are part of the [BluetoothLEAppearanceCategories.OutdoorSportActivity](bluetoothleappearancecategories_outdoorsportactivity.md) appearance category.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearancesubcategories.locationnavigationpod
     * @type {Integer} 
     */
    static LocationNavigationPod {
        get => BluetoothLEAppearanceSubcategories.get_LocationNavigationPod()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Generic() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_Generic()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SportsWatch() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_SportsWatch()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ThermometerEar() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_ThermometerEar()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_HeartRateBelt() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_HeartRateBelt()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BloodPressureArm() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_BloodPressureArm()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BloodPressureWrist() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_BloodPressureWrist()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Keyboard() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_Keyboard()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Mouse() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_Mouse()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Joystick() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_Joystick()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Gamepad() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_Gamepad()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_DigitizerTablet() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_DigitizerTablet()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CardReader() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_CardReader()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_DigitalPen() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_DigitalPen()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BarcodeScanner() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_BarcodeScanner()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RunningWalkingInShoe() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_RunningWalkingInShoe()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RunningWalkingOnShoe() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_RunningWalkingOnShoe()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RunningWalkingOnHip() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_RunningWalkingOnHip()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CyclingComputer() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_CyclingComputer()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CyclingSpeedSensor() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_CyclingSpeedSensor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CyclingCadenceSensor() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_CyclingCadenceSensor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CyclingPowerSensor() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_CyclingPowerSensor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CyclingSpeedCadenceSensor() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_CyclingSpeedCadenceSensor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_OximeterFingertip() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_OximeterFingertip()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_OximeterWristWorn() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_OximeterWristWorn()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_LocationDisplay() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_LocationDisplay()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_LocationNavigationDisplay() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_LocationNavigationDisplay()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_LocationPod() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_LocationPod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_LocationNavigationPod() {
        if (!BluetoothLEAppearanceSubcategories.HasProp("__IBluetoothLEAppearanceSubcategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceSubcategoriesStatics.IID)
            BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics := IBluetoothLEAppearanceSubcategoriesStatics(factoryPtr)
        }

        return BluetoothLEAppearanceSubcategories.__IBluetoothLEAppearanceSubcategoriesStatics.get_LocationNavigationPod()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
