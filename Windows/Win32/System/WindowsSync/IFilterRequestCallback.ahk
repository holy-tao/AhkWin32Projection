#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Mediates filter negotiation between a destination provider and a source provider.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ifilterrequestcallback
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFilterRequestCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterRequestCallback
     * @type {Guid}
     */
    static IID => Guid("{82df8873-6360-463a-a8a1-ede5e1a1594d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestFilter"]

    /**
     * Requests that the filter that is specified by the destination provider be used by the source provider during change enumeration.
     * @param {IUnknown} pFilter The filter that is specified by the destination provider. This filter is passed to the source provider to be used during change enumeration.
     * @param {Integer} filteringType A <a href="https://docs.microsoft.com/windows/win32/api/winsync/ne-winsync-filtering_type">FILTERING_TYPE</a> enumeration value that indicates the type of information that is included in a change batch during filtered synchronization.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_FILTER_NOT_SUPPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the filter that is specified by <i>pFilter</i> is not supported by the source provider. This is also returned when the source provider does not implement <a href="/previous-versions/windows/desktop/api/winsync/nn-winsync-isupportfilteredsync">ISupportFilteredSync</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ifilterrequestcallback-requestfilter
     */
    RequestFilter(pFilter, filteringType) {
        result := ComCall(3, this, "ptr", pFilter, "int", filteringType, "HRESULT")
        return result
    }
}
