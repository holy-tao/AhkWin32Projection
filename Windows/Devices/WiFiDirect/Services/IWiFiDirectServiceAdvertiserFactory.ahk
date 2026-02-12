#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WiFiDirectServiceAdvertiser.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectServiceAdvertiserFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectServiceAdvertiserFactory
     * @type {Guid}
     */
    static IID => Guid("{3106ac0d-b446-4f13-9f9a-8ae925feba2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWiFiDirectServiceAdvertiser"]

    /**
     * 
     * @param {HSTRING} serviceName 
     * @returns {WiFiDirectServiceAdvertiser} 
     */
    CreateWiFiDirectServiceAdvertiser(serviceName) {
        if(serviceName is String) {
            pin := HSTRING.Create(serviceName)
            serviceName := pin.Value
        }
        serviceName := serviceName is Win32Handle ? NumGet(serviceName, "ptr") : serviceName

        result := ComCall(6, this, "ptr", serviceName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiDirectServiceAdvertiser(result_)
    }
}
