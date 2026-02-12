#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\WiFiWpsConfigurationResult.ahk
#Include .\WiFiConnectionResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiAdapter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiAdapter2
     * @type {Guid}
     */
    static IID => Guid("{5bc4501d-81e4-453d-9430-1fcafbadd6b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWpsConfigurationAsync", "ConnectWithPasswordCredentialAndSsidAndConnectionMethodAsync"]

    /**
     * 
     * @param {WiFiAvailableNetwork} availableNetwork 
     * @returns {IAsyncOperation<WiFiWpsConfigurationResult>} 
     */
    GetWpsConfigurationAsync(availableNetwork) {
        result := ComCall(6, this, "ptr", availableNetwork, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiWpsConfigurationResult, operation)
    }

    /**
     * 
     * @param {WiFiAvailableNetwork} availableNetwork 
     * @param {Integer} reconnectionKind 
     * @param {PasswordCredential} passwordCredential_ 
     * @param {HSTRING} ssid 
     * @param {Integer} connectionMethod 
     * @returns {IAsyncOperation<WiFiConnectionResult>} 
     */
    ConnectWithPasswordCredentialAndSsidAndConnectionMethodAsync(availableNetwork, reconnectionKind, passwordCredential_, ssid, connectionMethod) {
        if(ssid is String) {
            pin := HSTRING.Create(ssid)
            ssid := pin.Value
        }
        ssid := ssid is Win32Handle ? NumGet(ssid, "ptr") : ssid

        result := ComCall(7, this, "ptr", availableNetwork, "int", reconnectionKind, "ptr", passwordCredential_, "ptr", ssid, "int", connectionMethod, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiConnectionResult, operation)
    }
}
