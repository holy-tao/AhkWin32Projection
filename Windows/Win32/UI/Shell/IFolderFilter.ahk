#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by a client to specify how to filter the enumeration of a Shell folder by a server application.
 * @remarks
 * 
  * This interface is most often used with <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a> to filter the contents of the tree view displayed in a folder selection dialog box. To use <b>IFolderFilter</b> with <b>SHBrowseForFolder</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-browseinfoa">BIF_NEWDIALOGSTYLE</a> flag must be set.
  * 
  * When your application calls <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a>, you become a client of the folder browser object. The folder browser object communicates with you by sending messages to a callback function, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762598(v=vs.85)">BrowseCallbackProc</a>. The <b>BFFM_IUNKNOWN</b> message handled by that callback function contains a pointer to the folder browser's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. To filter the display of a folder's contents, do the following:
  * 
  *                 
  * 
  * <ol>
  * <li>Use the folder browser's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method to request a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifolderfiltersite">IFolderFilterSite</a> interface.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderfiltersite-setfilter">IFolderFilterSite::SetFilter</a>, passing it a pointer to your <b>IFolderFilter</b> interface.</li>
  * <li>The folder browser then queries <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderfilter-getenumflags">IFolderFilter::GetEnumFlags</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderfilter-shouldshow">IFolderFilter::ShouldShow</a>to determine how to filter the enumeration.</li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifolderfilter
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderFilter
     * @type {Guid}
     */
    static IID => Guid("{9cc22886-dc8e-11d2-b1d0-00c04f8eeb3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShouldShow", "GetEnumFlags"]

    /**
     * 
     * @param {IShellFolder} psf 
     * @param {Pointer<ITEMIDLIST>} pidlFolder 
     * @param {Pointer<ITEMIDLIST>} pidlItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderfilter-shouldshow
     */
    ShouldShow(psf, pidlFolder, pidlItem) {
        result := ComCall(3, this, "ptr", psf, "ptr", pidlFolder, "ptr", pidlItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellFolder} psf 
     * @param {Pointer<ITEMIDLIST>} pidlFolder 
     * @param {Pointer<Integer>} pgrfFlags 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderfilter-getenumflags
     */
    GetEnumFlags(psf, pidlFolder, pgrfFlags) {
        pgrfFlagsMarshal := pgrfFlags is VarRef ? "uint*" : "ptr"

        phwnd := HWND()
        result := ComCall(4, this, "ptr", psf, "ptr", pidlFolder, "ptr", phwnd, pgrfFlagsMarshal, pgrfFlags, "HRESULT")
        return phwnd
    }
}
