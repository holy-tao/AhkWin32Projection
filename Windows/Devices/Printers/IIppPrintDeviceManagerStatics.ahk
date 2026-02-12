#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\IppPrintDeviceInstallationResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IIppPrintDeviceManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIppPrintDeviceManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{8f711a45-c1b9-51bb-80c8-38969c81f800}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanInstallIppPrintDevice", "InstallIppPrintDeviceAsync"]

    /**
     * 
     * @returns {Boolean} 
     */
    CanInstallIppPrintDevice() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Uri} printerUri 
     * @param {HSTRING} printerName 
     * @returns {IAsyncOperation<IppPrintDeviceInstallationResult>} 
     */
    InstallIppPrintDeviceAsync(printerUri, printerName) {
        if(printerName is String) {
            pin := HSTRING.Create(printerName)
            printerName := pin.Value
        }
        printerName := printerName is Win32Handle ? NumGet(printerName, "ptr") : printerName

        result := ComCall(7, this, "ptr", printerUri, "ptr", printerName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IppPrintDeviceInstallationResult, operation)
    }
}
