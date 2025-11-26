#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to bring a disk online and take it offline.Windows Vista:  This interface is not supported until Windows Vista with Service Pack 1 (SP1). Use IVdsDisk2 instead.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdiskonline
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDiskOnline extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDiskOnline
     * @type {Guid}
     */
    static IID => Guid("{90681b1d-6a7f-48e8-9061-31b7aa125322}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Online", "Offline"]

    /**
     * Brings the disk online.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_FAILED_TO_ONLINE_DISK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The online operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdiskonline-online
     */
    Online() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Takes the disk offline.Windows Vista:  This method is not supported until Windows Vista with Service Pack 1 (SP1). Use IVdsDisk2::SetSANMode instead.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_FAILED_TO_OFFLINE_DISK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The offline operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdiskonline-offline
     */
    Offline() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
