#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by Windows Store app browsers in Windows 8 to notify the location platform that an app has been suspended (disconnect) and restored (connect). (ILocationPower)
 * @see https://learn.microsoft.com/windows/win32/api//content/locationapi/nn-locationapi-ilocationpower
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILocationPower extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocationPower
     * @type {Guid}
     */
    static IID => Guid("{193e7729-ab6b-4b12-8617-7596e1bb191c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect"]

    /**
     * Used by Windows Store app browsers in Windows 8 to notify the location platform that an app has been suspended (disconnect) and restored (connect). (ILocationPower.Connect)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/locationapi/nf-locationapi-ilocationpower-connect
     */
    Connect() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Used by Windows Store app browsers in Windows 8 to notify the location platform that an app has been suspended (disconnect) and restored (connect). (ILocationPower.Disconnect)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/locationapi/nf-locationapi-ilocationpower-disconnect
     */
    Disconnect() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
