#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDeviceManager2.ahk

/**
 * The IWMDeviceManager3 interface extends the IWMDeviceManager2 interface by providing a method that sets the device enumeration preferences.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdevicemanager3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDeviceManager3 extends IWMDeviceManager2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDeviceManager3
     * @type {Guid}
     */
    static IID => Guid("{af185c41-100d-46ed-be2e-9ce8c44594ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDeviceEnumPreference"]

    /**
     * 
     * @param {Integer} dwEnumPref 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager3-setdeviceenumpreference
     */
    SetDeviceEnumPreference(dwEnumPref) {
        result := ComCall(9, this, "uint", dwEnumPref, "HRESULT")
        return result
    }
}
