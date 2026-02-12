#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\VirtualPrinterInstallationResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IVirtualPrinterManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualPrinterManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{141084b6-6702-5b5f-83da-c75891657554}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallVirtualPrinterAsync", "InstallVirtualPrinterAsync2", "InstallVirtualPrinterForAllUsersAsync", "InstallVirtualPrinterForAllUsersAsync2", "FindAllVirtualPrinters", "FindAllVirtualPrinters2", "RemoveVirtualPrinterAsync", "RemoveVirtualPrinterForAllUsersAsync"]

    /**
     * 
     * @param {VirtualPrinterInstallationParameters} parameters 
     * @returns {IAsyncOperation<VirtualPrinterInstallationResult>} 
     */
    InstallVirtualPrinterAsync(parameters) {
        result := ComCall(6, this, "ptr", parameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VirtualPrinterInstallationResult, operation)
    }

    /**
     * 
     * @param {VirtualPrinterInstallationParameters} parameters 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {IAsyncOperation<VirtualPrinterInstallationResult>} 
     */
    InstallVirtualPrinterAsync2(parameters, appPackageFamilyName) {
        if(appPackageFamilyName is String) {
            pin := HSTRING.Create(appPackageFamilyName)
            appPackageFamilyName := pin.Value
        }
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(7, this, "ptr", parameters, "ptr", appPackageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VirtualPrinterInstallationResult, operation)
    }

    /**
     * 
     * @param {VirtualPrinterInstallationParameters} parameters 
     * @returns {IAsyncOperation<VirtualPrinterInstallationResult>} 
     */
    InstallVirtualPrinterForAllUsersAsync(parameters) {
        result := ComCall(8, this, "ptr", parameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VirtualPrinterInstallationResult, operation)
    }

    /**
     * 
     * @param {VirtualPrinterInstallationParameters} parameters 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {IAsyncOperation<VirtualPrinterInstallationResult>} 
     */
    InstallVirtualPrinterForAllUsersAsync2(parameters, appPackageFamilyName) {
        if(appPackageFamilyName is String) {
            pin := HSTRING.Create(appPackageFamilyName)
            appPackageFamilyName := pin.Value
        }
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(9, this, "ptr", parameters, "ptr", appPackageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VirtualPrinterInstallationResult, operation)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    FindAllVirtualPrinters() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {IVectorView<HSTRING>} 
     */
    FindAllVirtualPrinters2(appPackageFamilyName) {
        if(appPackageFamilyName is String) {
            pin := HSTRING.Create(appPackageFamilyName)
            appPackageFamilyName := pin.Value
        }
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(11, this, "ptr", appPackageFamilyName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {HSTRING} printerName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RemoveVirtualPrinterAsync(printerName) {
        if(printerName is String) {
            pin := HSTRING.Create(printerName)
            printerName := pin.Value
        }
        printerName := printerName is Win32Handle ? NumGet(printerName, "ptr") : printerName

        result := ComCall(12, this, "ptr", printerName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} printerName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RemoveVirtualPrinterForAllUsersAsync(printerName) {
        if(printerName is String) {
            pin := HSTRING.Create(printerName)
            printerName := pin.Value
        }
        printerName := printerName is Win32Handle ? NumGet(printerName, "ptr") : printerName

        result := ComCall(13, this, "ptr", printerName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
