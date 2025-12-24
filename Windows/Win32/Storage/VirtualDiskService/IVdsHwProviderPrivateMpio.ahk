#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that sets the status of paths originating from a particular HBA port to the provider.
 * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nn-vdshwprv-ivdshwproviderprivatempio
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsHwProviderPrivateMpio extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsHwProviderPrivateMpio
     * @type {Guid}
     */
    static IID => Guid("{310a7715-ac2b-4c6f-9827-3d742f351676}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllPathStatusesFromHbaPort"]

    /**
     * Sets the statuses of paths originating from a particular HBA port to a specified status.
     * @param {VDS_HBAPORT_PROP} hbaPortProp The properties of the HBA port from which the paths to be set originate.  The only fields that need to be 
     *       provided are <b>wwnNode</b> and <b>wwnPort</b>.  The hardware provider 
     *       must ignore all other fields.
     * @param {Integer} status The status (enumerated by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_path_status">VDS_PATH_STATUS</a> enumeration) to set the paths.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The association name was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_S_STATUSES_INCOMPLETELY_SET</b></b></dt>
     * <dt>0x00042702L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one path's status was not successfully set due to a nonfatal error (for example, the status conflicts with 
     *         the current load balance policy).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nf-vdshwprv-ivdshwproviderprivatempio-setallpathstatusesfromhbaport
     */
    SetAllPathStatusesFromHbaPort(hbaPortProp, status) {
        result := ComCall(3, this, "ptr", hbaPortProp, "int", status, "HRESULT")
        return result
    }
}
