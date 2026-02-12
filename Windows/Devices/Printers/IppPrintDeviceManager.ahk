#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIppPrintDeviceManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppPrintDeviceManager extends IInspectable {
;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static CanInstallIppPrintDevice() {
        if (!IppPrintDeviceManager.HasProp("__IIppPrintDeviceManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppPrintDeviceManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppPrintDeviceManagerStatics.IID)
            IppPrintDeviceManager.__IIppPrintDeviceManagerStatics := IIppPrintDeviceManagerStatics(factoryPtr)
        }

        return IppPrintDeviceManager.__IIppPrintDeviceManagerStatics.CanInstallIppPrintDevice()
    }

    /**
     * 
     * @param {Uri} printerUri 
     * @param {HSTRING} printerName 
     * @returns {IAsyncOperation<IppPrintDeviceInstallationResult>} 
     */
    static InstallIppPrintDeviceAsync(printerUri, printerName) {
        if (!IppPrintDeviceManager.HasProp("__IIppPrintDeviceManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppPrintDeviceManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppPrintDeviceManagerStatics.IID)
            IppPrintDeviceManager.__IIppPrintDeviceManagerStatics := IIppPrintDeviceManagerStatics(factoryPtr)
        }

        return IppPrintDeviceManager.__IIppPrintDeviceManagerStatics.InstallIppPrintDeviceAsync(printerUri, printerName)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
