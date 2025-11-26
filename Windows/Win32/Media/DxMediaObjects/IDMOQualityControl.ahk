#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDMOQualityControl interface supports quality control on a Microsoft DirectX Media Object (DMO).
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-idmoqualitycontrol
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IDMOQualityControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMOQualityControl
     * @type {Guid}
     */
    static IID => Guid("{65abea96-cf36-453f-af8a-705e98f16260}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNow", "SetStatus", "GetStatus"]

    /**
     * The SetNow method specifies the earliest time stamp that the DMO will deliver.
     * @param {Integer} rtNow Reference time specifying the earliest time stamp to deliver.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-idmoqualitycontrol-setnow
     */
    SetNow(rtNow) {
        result := ComCall(3, this, "int64", rtNow, "HRESULT")
        return result
    }

    /**
     * The SetStatus method enables or disables quality control.
     * @param {Integer} dwFlags Value that specifies whether to enable or disable quality control. Use DMO_QUALITY_STATUS_ENABLED to enable quality control, or zero to disable quality control.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-idmoqualitycontrol-setstatus
     */
    SetStatus(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetStatus method determines whether quality control is active.
     * @returns {Integer} Pointer to a variable that receives the quality control status. If quality control is disabled, the value is zero. If quality control is enabled, the value is DMO_QUALITY_STATUS_ENABLED.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-idmoqualitycontrol-getstatus
     */
    GetStatus() {
        result := ComCall(5, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
