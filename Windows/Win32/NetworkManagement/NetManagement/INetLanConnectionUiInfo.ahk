#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetLanConnectionUiInfo extends IUnknown{
    /**
     * The interface identifier for INetLanConnectionUiInfo
     * @type {Guid}
     */
    static IID => Guid("{c08956a6-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    GetDeviceGuid(pguid) {
        result := ComCall(3, this, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
