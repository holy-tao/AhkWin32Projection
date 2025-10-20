#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDServiceProvider2.ahk

/**
 * The IMDServiceProvider3 interface extends the IMDServiceProvider2 interface by providing a method for setting the device enumeration preferences.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdserviceprovider3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDServiceProvider3 extends IMDServiceProvider2{
    /**
     * The interface identifier for IMDServiceProvider3
     * @type {Guid}
     */
    static IID => Guid("{4ed13ef3-a971-4d19-9f51-0e1826b2da57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Integer} dwEnumPref 
     * @returns {HRESULT} 
     */
    SetDeviceEnumPreference(dwEnumPref) {
        result := ComCall(6, this, "uint", dwEnumPref, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
