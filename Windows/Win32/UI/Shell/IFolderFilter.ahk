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
     * Specifies whether an individual item should be allowed through the filter and which should be blocked.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The PIDL of the folder.
     * @param {Pointer<ITEMIDLIST>} pidlItem Type: <b>PCUITEMID_CHILD</b>
     * 
     * The relative PIDL of the child item of <i>pidlFolder</i> in question.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the item should be shown, S_FALSE if it should not be shown, or a standard error code if an error is encountered. If an error is encountered, the item is not shown.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderfilter-shouldshow
     */
    ShouldShow(psf, pidlFolder, pidlItem) {
        result := ComCall(3, this, "ptr", psf, "ptr", pidlFolder, "ptr", pidlItem, "HRESULT")
        return result
    }

    /**
     * Allows a client to specify which classes of objects in a Shell folder should be enumerated. When used with SHBrowseForFolder, specifies the class or classes of items that should be shown in the dialog box tree view and which class or classes should not.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE </b>
     * 
     * The PIDL of the folder.
     * @param {Pointer<Integer>} pgrfFlags Type: <b>DWORD*</b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a> values that specify the classes of object to enumerate.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * A pointer to the host's window handle.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderfilter-getenumflags
     */
    GetEnumFlags(psf, pidlFolder, pgrfFlags) {
        pgrfFlagsMarshal := pgrfFlags is VarRef ? "uint*" : "ptr"

        phwnd := HWND()
        result := ComCall(4, this, "ptr", psf, "ptr", pidlFolder, "ptr", phwnd, pgrfFlagsMarshal, pgrfFlags, "HRESULT")
        return phwnd
    }
}
