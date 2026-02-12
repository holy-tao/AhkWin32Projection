#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * When implemented by a derived class, represents a destination provider that can specify a filter to be used by the source provider during change enumeration.
 * @remarks
 * Typically, <b>IRequestFilteredSync</b> is implemented by a destination provider.
 * @see https://learn.microsoft.com/windows/win32/api//content/winsync/nn-winsync-irequestfilteredsync
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IRequestFilteredSync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRequestFilteredSync
     * @type {Guid}
     */
    static IID => Guid("{2e020184-6d18-46a7-a32a-da4aeb06696c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SpecifyFilter"]

    /**
     * When implemented by a derived class, negotiates which filter is used by the source provider during change enumeration.
     * @remarks
     * Filter negotiation is achieved by using the following steps:
     * 
     * <ol>
     * <li>Before the source provider begins enumerating changes, a synchronization session typically starts filter negotiation by calling <b>IRequestFilteredSync::SpecifyFilter</b> on the destination provider.</li>
     * <li>During processing of <b>IRequestFilteredSync::SpecifyFilter</b>, the destination provider passes filters to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ifilterrequestcallback-requestfilter">IFilterRequestCallback::RequestFilter</a>.</li>
     * <li>During processing of <b>IFilterRequestCallback::RequestFilter</b>, a synchronization session typically calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isupportfilteredsync-addfilter">ISupportFilteredSync::AddFilter</a> on the source provider. If the source provider does not support the requested filter, the destination provider can continue to request filters until it finds one that is supported.</li>
     * </ol>
     * When a filter has been successfully negotiated, the source provider uses it to determine which items to include during change enumeration.
     * 
     * <div class="alert"><b>Note</b>  An implementation of this method can repeatedly call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ifilterrequestcallback-requestfilter">IFilterRequestCallback::RequestFilter</a> until a filter is found that is supported by both the destination provider and the source provider. The source provider indicates that it does not support a filter by returning <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/windows-sync-error-codes">SYNC_E_FILTER_NOT_SUPPORTED</a> in response to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isupportfilteredsync-addfilter">ISupportFilteredSync::AddFilter</a> call.
     * 
     * <p class="note">When <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isupportfilteredsync-addfilter">ISupportFilteredSync::AddFilter</a> returns an error other than <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/windows-sync-error-codes">SYNC_E_FILTER_NOT_SUPPORTED</a>, <b>IRequestFilteredSync::SpecifyFilter</b> should return the error to the Sync Application. This ends the synchronization session.
     * 
     * </div>
     * <div> </div>
     * @param {IFilterRequestCallback} pCallback The callback interface that is used by the destination provider to request that a filter be used by the source provider during change enumeration.
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
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/winsync/nf-winsync-irequestfilteredsync-specifyfilter
     */
    SpecifyFilter(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
