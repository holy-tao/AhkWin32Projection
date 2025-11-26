#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_HINTS2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for applying and querying logical unit number (LUN) hints.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdslun2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLun2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsLun2
     * @type {Guid}
     */
    static IID => Guid("{e5b3a735-9efb-499a-8071-4394d9ee6fcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryHints2", "ApplyHints2"]

    /**
     * Returns the hints currently applied to the LUN. This method is identical to the IVdsLun::QueryHints method, except that it uses a VDS_HINTS2 structure instead of a VDS_HINTS structure.
     * @returns {VDS_HINTS2} A pointer to the returned LUN hints. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun2-queryhints2
     */
    QueryHints2() {
        pHints2 := VDS_HINTS2()
        result := ComCall(3, this, "ptr", pHints2, "HRESULT")
        return pHints2
    }

    /**
     * Applies a new set of hints to the LUN. Hints that are applied to a LUN are simultaneously applied to all plexes. This method is identical to the IVdsLun::ApplyHints method, except that it uses a VDS_HINTS2 structure instead of a VDS_HINTS structure.
     * @param {Pointer<VDS_HINTS2>} pHints2 A pointer to the new hints to be applied to the LUN. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure.
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
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a software or communication problem inside a provider that caches information 
     *         about the array. Use the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore 
     *         the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state and unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until the previous operation or 
     *         operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun2-applyhints2
     */
    ApplyHints2(pHints2) {
        result := ComCall(4, this, "ptr", pHints2, "HRESULT")
        return result
    }
}
