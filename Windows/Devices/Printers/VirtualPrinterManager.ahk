#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVirtualPrinterManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class VirtualPrinterManager extends IInspectable {
;@region Static Methods
    /**
     * 
     * @param {VirtualPrinterInstallationParameters} parameters 
     * @returns {IAsyncOperation<VirtualPrinterInstallationResult>} 
     */
    static InstallVirtualPrinterAsync(parameters) {
        if (!VirtualPrinterManager.HasProp("__IVirtualPrinterManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualPrinterManagerStatics.IID)
            VirtualPrinterManager.__IVirtualPrinterManagerStatics := IVirtualPrinterManagerStatics(factoryPtr)
        }

        return VirtualPrinterManager.__IVirtualPrinterManagerStatics.InstallVirtualPrinterAsync(parameters)
    }

    /**
     * 
     * @param {VirtualPrinterInstallationParameters} parameters 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {IAsyncOperation<VirtualPrinterInstallationResult>} 
     */
    static InstallVirtualPrinterAsync2(parameters, appPackageFamilyName) {
        if (!VirtualPrinterManager.HasProp("__IVirtualPrinterManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualPrinterManagerStatics.IID)
            VirtualPrinterManager.__IVirtualPrinterManagerStatics := IVirtualPrinterManagerStatics(factoryPtr)
        }

        return VirtualPrinterManager.__IVirtualPrinterManagerStatics.InstallVirtualPrinterAsync2(parameters, appPackageFamilyName)
    }

    /**
     * 
     * @param {VirtualPrinterInstallationParameters} parameters 
     * @returns {IAsyncOperation<VirtualPrinterInstallationResult>} 
     */
    static InstallVirtualPrinterForAllUsersAsync(parameters) {
        if (!VirtualPrinterManager.HasProp("__IVirtualPrinterManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualPrinterManagerStatics.IID)
            VirtualPrinterManager.__IVirtualPrinterManagerStatics := IVirtualPrinterManagerStatics(factoryPtr)
        }

        return VirtualPrinterManager.__IVirtualPrinterManagerStatics.InstallVirtualPrinterForAllUsersAsync(parameters)
    }

    /**
     * 
     * @param {VirtualPrinterInstallationParameters} parameters 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {IAsyncOperation<VirtualPrinterInstallationResult>} 
     */
    static InstallVirtualPrinterForAllUsersAsync2(parameters, appPackageFamilyName) {
        if (!VirtualPrinterManager.HasProp("__IVirtualPrinterManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualPrinterManagerStatics.IID)
            VirtualPrinterManager.__IVirtualPrinterManagerStatics := IVirtualPrinterManagerStatics(factoryPtr)
        }

        return VirtualPrinterManager.__IVirtualPrinterManagerStatics.InstallVirtualPrinterForAllUsersAsync2(parameters, appPackageFamilyName)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static FindAllVirtualPrinters() {
        if (!VirtualPrinterManager.HasProp("__IVirtualPrinterManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualPrinterManagerStatics.IID)
            VirtualPrinterManager.__IVirtualPrinterManagerStatics := IVirtualPrinterManagerStatics(factoryPtr)
        }

        return VirtualPrinterManager.__IVirtualPrinterManagerStatics.FindAllVirtualPrinters()
    }

    /**
     * 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {IVectorView<HSTRING>} 
     */
    static FindAllVirtualPrinters2(appPackageFamilyName) {
        if (!VirtualPrinterManager.HasProp("__IVirtualPrinterManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualPrinterManagerStatics.IID)
            VirtualPrinterManager.__IVirtualPrinterManagerStatics := IVirtualPrinterManagerStatics(factoryPtr)
        }

        return VirtualPrinterManager.__IVirtualPrinterManagerStatics.FindAllVirtualPrinters2(appPackageFamilyName)
    }

    /**
     * 
     * @param {HSTRING} printerName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    static RemoveVirtualPrinterAsync(printerName) {
        if (!VirtualPrinterManager.HasProp("__IVirtualPrinterManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualPrinterManagerStatics.IID)
            VirtualPrinterManager.__IVirtualPrinterManagerStatics := IVirtualPrinterManagerStatics(factoryPtr)
        }

        return VirtualPrinterManager.__IVirtualPrinterManagerStatics.RemoveVirtualPrinterAsync(printerName)
    }

    /**
     * 
     * @param {HSTRING} printerName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    static RemoveVirtualPrinterForAllUsersAsync(printerName) {
        if (!VirtualPrinterManager.HasProp("__IVirtualPrinterManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualPrinterManagerStatics.IID)
            VirtualPrinterManager.__IVirtualPrinterManagerStatics := IVirtualPrinterManagerStatics(factoryPtr)
        }

        return VirtualPrinterManager.__IVirtualPrinterManagerStatics.RemoveVirtualPrinterForAllUsersAsync(printerName)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
