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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGlobalLocationPermission", "CheckLocationCapability"]

    /**
     * Gets the status of the system setting that allows users to change location settings.
     * @returns {BOOL} <b>TRUE</b> if system settings allow users to enable or disable the location platform; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-ilocationpermissions-getgloballocationpermission
     */
    GetGlobalLocationPermission() {
        result := ComCall(3, this, "int*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * Gets the location capability of the Windows Store app of the given thread.
     * @param {Integer} dwClientThreadId Thread Id of the app to check the location capability of
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded and the app is location enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The app has not declared location capability or the user has declined or revoked location access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ILLEGAL_METHOD_CALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid client thread was provided.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-ilocationpermissions-checklocationcapability
     */
    CheckLocationCapability(dwClientThreadId) {
        result := ComCall(4, this, "uint", dwClientThreadId, "HRESULT")
        return result
    }
}
