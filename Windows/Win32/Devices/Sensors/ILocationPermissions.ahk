#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the status of the system setting that allows users to change location settings.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  <b>ILocationPermissions</b> is available in Windows 8.</div>
  * <div> </div>
  * For more information on location settings in Windows 8 see <a href="https://docs.microsoft.com/previous-versions/windows">Location settings</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nn-sensorsapi-ilocationpermissions
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ILocationPermissions extends IUnknown{
    /**
     * The interface identifier for ILocationPermissions
     * @type {Guid}
     */
    static IID => Guid("{d5fb0a7f-e74e-44f5-8e02-4806863a274f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    GetGlobalLocationPermission(pfEnabled) {
        result := ComCall(3, this, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwClientThreadId 
     * @returns {HRESULT} 
     */
    CheckLocationCapability(dwClientThreadId) {
        result := ComCall(4, this, "uint", dwClientThreadId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
