#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exported by a host to allow clients to specify how to filter a Shell folder enumeration.
 * @remarks
 * 
  * The most common use of this interface is when your application calls <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a>. When you call this function, you become a client of the folder browser object. That object communicates with you by sending messages to a callback function, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762598(v=vs.85)">BrowseCallbackProc</a>. The BFFM_IUNKNOWN message contains a pointer to the folder browser's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. To filter folder enumeration:
  * 
  * 
  * 
  * <ol>
  * <li>Use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer to call the folder browser's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method, and request a pointer to the <b>IFolderFilterSite</b> interface.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderfiltersite-setfilter">IFolderFilterSite::SetFilter</a>, and pass the folder browser a pointer to your <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifolderfilter">IFolderFilter</a> (IUnknown or IFilterFolder?) interface.</li>
  * <li>The folder browser will then query the two methods of the <b>IFolderFilterSite</b> interface to determine how to filter the enumeration.</li>
  * </ol>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifolderfiltersite
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderFilterSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderFilterSite
     * @type {Guid}
     */
    static IID => Guid("{c0a651f5-b48b-11d2-b5ed-006097c686f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFilter"]

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderfiltersite-setfilter
     */
    SetFilter(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }
}
