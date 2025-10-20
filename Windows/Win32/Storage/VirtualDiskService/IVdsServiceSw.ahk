#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsServiceSw extends IUnknown{
    /**
     * The interface identifier for IVdsServiceSw
     * @type {Guid}
     */
    static IID => Guid("{15fc031c-0652-4306-b2c3-f558b8f837e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszDeviceID 
     * @param {Pointer<IUnknown>} ppDiskUnk 
     * @returns {HRESULT} 
     */
    GetDiskObject(pwszDeviceID, ppDiskUnk) {
        pwszDeviceID := pwszDeviceID is String ? StrPtr(pwszDeviceID) : pwszDeviceID

        result := ComCall(3, this, "ptr", pwszDeviceID, "ptr", ppDiskUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
