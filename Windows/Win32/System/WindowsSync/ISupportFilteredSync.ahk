#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * When implemented by a derived class, represents a source provider that supports filtered change enumeration, and that can negotiate the type of filter that is used.
 * @remarks
 * <b>ISupportFilteredSync</b> is typically implemented by a source provider.
 * @see https://learn.microsoft.com/windows/win32/api//content/winsync/nn-winsync-isupportfilteredsync
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISupportFilteredSync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISupportFilteredSync
     * @type {Guid}
     */
    static IID => Guid("{3d128ded-d555-4e0d-bf4b-fb213a8a9302}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFilter"]

    /**
     * Sets the filter that is used for change enumeration by the source provider, when implemented by a derived class.
     * @remarks
     * Filter negotiation is achieved by using the following steps:
     * 
     * <ol>
     * <li>Before the source provider begins enumerating changes, a synchronization session typically starts filter negotiation by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ifilterrequestcallback-requestfilter">IRequestFilteredSync::SpecifyFilter</a> on the destination provider.</li>
     * <li>During processing of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ifilterrequestcallback-requestfilter">IRequestFilteredSync::SpecifyFilter</a>, the destination provider passes filters to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ifilterrequestcallback-requestfilter">IFilterRequestCallback::RequestFilter</a>.</li>
     * <li>During processing of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ifilterrequestcallback-requestfilter">IFilterRequestCallback::RequestFilter</a>, a synchronization session typically calls <b>ISupportFilteredSync::AddFilter</b> on the source provider. If the source provider does not support the requested filter, the destination provider can continue to request filters until it finds one that is supported.</li>
     * </ol>
     * When a filter has been successfully negotiated, the source provider uses it to determine which items to include during change enumeration.
     * 
     * <div class="alert"><b>Note</b>  An implementation of this method can examine the filter specified by <i>pFilter</i> and <i>filteringType</i>, and return <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/windows-sync-error-codes">SYNC_E_FILTER_NOT_SUPPORTED</a> to indicate that the filter is not supported. The destination provider can then request different filters until one is found that is supported.<p class="note">Typically the destination provider will end the synchronization session when an error other than <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/windows-sync-error-codes">SYNC_E_FILTER_NOT_SUPPORTED</a> is returned from <b>ISupportFilteredSync::AddFilter</b>.
     * 
     * </div>
     * <div> </div>
     * @param {IUnknown} pFilter The filter that is used for change enumeration by the source provider.
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
     * <dt><b>SYNC_E_FILTER_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the type of filter that is specified by <i>pFilter</i> is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/winsync/nf-winsync-isupportfilteredsync-addfilter
     */
    AddFilter(pFilter, filteringType) {
        result := ComCall(3, this, "ptr", pFilter, "int", filteringType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
