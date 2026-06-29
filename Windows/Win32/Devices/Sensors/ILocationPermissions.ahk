#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the status of the system setting that allows users to change location settings.
 * @remarks
 * <div class="alert"><b>Note</b>  <b>ILocationPermissions</b> is available in Windows 8.</div>
 * <div> </div>
 * For more information on location settings in Windows 8 see <a href="https://docs.microsoft.com/previous-versions/windows">Location settings</a>.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nn-sensorsapi-ilocationpermissions
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct ILocationPermissions extends IUnknown {
    /**
     * The interface identifier for ILocationPermissions
     * @type {Guid}
     */
    static IID := Guid("{d5fb0a7f-e74e-44f5-8e02-4806863a274f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILocationPermissions interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGlobalLocationPermission : IntPtr
        CheckLocationCapability     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILocationPermissions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the status of the system setting that allows users to change location settings.
     * @remarks
     * <div class="alert"><b>Note</b>  <b>GetGlobalLocationPermission</b> is available in Windows 8.</div>
     * <div> </div>
     * For more information on location settings in Windows 8 see <a href="https://docs.microsoft.com/previous-versions/windows">Location settings</a>.
     * @returns {BOOL} <b>TRUE</b> if system settings allow users to enable or disable the location platform; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-ilocationpermissions-getgloballocationpermission
     */
    GetGlobalLocationPermission() {
        result := ComCall(3, this, BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * Gets the location capability of the Windows Store app of the given thread.
     * @remarks
     * <div class="alert"><b>Note</b>  <b>CheckLocationCapability</b> is available in Windows 8.</div>
     * <div> </div>
     * For more information on location settings in Windows 8 see <a href="https://docs.microsoft.com/previous-versions/windows">Location settings</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-ilocationpermissions-checklocationcapability
     */
    CheckLocationCapability(dwClientThreadId) {
        result := ComCall(4, this, "uint", dwClientThreadId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILocationPermissions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGlobalLocationPermission := CallbackCreate(GetMethod(implObj, "GetGlobalLocationPermission"), flags, 2)
        this.vtbl.CheckLocationCapability := CallbackCreate(GetMethod(implObj, "CheckLocationCapability"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGlobalLocationPermission)
        CallbackFree(this.vtbl.CheckLocationCapability)
    }
}
