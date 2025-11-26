#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_HBAPORT_PROP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and interact with HBA ports on the local system.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdshbaport
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsHbaPort extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsHbaPort
     * @type {Guid}
     */
    static IID => Guid("{2abd757f-2851-4997-9a13-47d2a885d6ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "SetAllPathStatuses"]

    /**
     * Retrieves the properties of an HBA port.
     * @returns {VDS_HBAPORT_PROP} The address of a member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hbaport_prop">VDS_HBAPORT_PROP</a> structure 
     *       that is allocated and passed in by the caller.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdshbaport-getproperties
     */
    GetProperties() {
        pHbaPortProp := VDS_HBAPORT_PROP()
        result := ComCall(3, this, "ptr", pHbaPortProp, "HRESULT")
        return pHbaPortProp
    }

    /**
     * Sets the statuses of all paths originating from the HBA port to a specified status.
     * @param {Integer} status The status to be assigned to the paths.
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
     * The statuses were successfully set.
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
     * At least one path's status was not set successfully due to a nonfatal error (for example, the status 
     *         conflicts with the current load balance policy).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdshbaport-setallpathstatuses
     */
    SetAllPathStatuses(status) {
        result := ComCall(4, this, "int", status, "HRESULT")
        return result
    }
}
