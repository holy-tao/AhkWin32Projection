#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides device-related notifications to an instance of an IWSDDeviceHost object.
 * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nn-wsdhost-iwsddevicehostnotify
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDDeviceHostNotify extends IUnknown{
    /**
     * The interface identifier for IWSDDeviceHostNotify
     * @type {Guid}
     */
    static IID => Guid("{b5bee9f9-eeda-41fe-96f7-f45e14990fb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszServiceId 
     * @param {Pointer<IUnknown>} ppService 
     * @returns {HRESULT} 
     */
    GetService(pszServiceId, ppService) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(3, this, "ptr", pszServiceId, "ptr", ppService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
