#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementScanParameters.ahk
#Include .\IBluetoothLEAdvertisementScanParametersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementScanParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementScanParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementScanParameters.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {BluetoothLEAdvertisementScanParameters} 
     */
    static CoexistenceOptimized() {
        if (!BluetoothLEAdvertisementScanParameters.HasProp("__IBluetoothLEAdvertisementScanParametersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementScanParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementScanParametersStatics.IID)
            BluetoothLEAdvertisementScanParameters.__IBluetoothLEAdvertisementScanParametersStatics := IBluetoothLEAdvertisementScanParametersStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementScanParameters.__IBluetoothLEAdvertisementScanParametersStatics.CoexistenceOptimized()
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisementScanParameters} 
     */
    static LowLatency() {
        if (!BluetoothLEAdvertisementScanParameters.HasProp("__IBluetoothLEAdvertisementScanParametersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementScanParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementScanParametersStatics.IID)
            BluetoothLEAdvertisementScanParameters.__IBluetoothLEAdvertisementScanParametersStatics := IBluetoothLEAdvertisementScanParametersStatics(factoryPtr)
        }

        return BluetoothLEAdvertisementScanParameters.__IBluetoothLEAdvertisementScanParametersStatics.LowLatency()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    ScanWindow {
        get => this.get_ScanWindow()
    }

    /**
     * @type {Integer} 
     */
    ScanInterval {
        get => this.get_ScanInterval()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScanWindow() {
        if (!this.HasProp("__IBluetoothLEAdvertisementScanParameters")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementScanParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementScanParameters := IBluetoothLEAdvertisementScanParameters(outPtr)
        }

        return this.__IBluetoothLEAdvertisementScanParameters.get_ScanWindow()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScanInterval() {
        if (!this.HasProp("__IBluetoothLEAdvertisementScanParameters")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementScanParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementScanParameters := IBluetoothLEAdvertisementScanParameters(outPtr)
        }

        return this.__IBluetoothLEAdvertisementScanParameters.get_ScanInterval()
    }

;@endregion Instance Methods
}
