#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to set the SAN mode of a disk to offline or online.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdisk2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDisk2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDisk2
     * @type {Guid}
     */
    static IID => Guid("{40f73c8b-687d-4a13-8d96-3d7f2e683936}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSANMode"]

    /**
     * Sets the SAN mode of a disk to offline or online.
     * @param {BOOL} bEnable Specify <b>TRUE</b> for online or <b>FALSE</b> for offline.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SAN mode was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_FAILED_TO_OFFLINE_DISK</b></dt>
     * <dt>0x80042597L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The offline operation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_FAILED_TO_ONLINE_DISK</b></dt>
     * <dt>0x80042596L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The online operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdisk2-setsanmode
     */
    SetSANMode(bEnable) {
        result := ComCall(3, this, "int", bEnable, "HRESULT")
        return result
    }
}
