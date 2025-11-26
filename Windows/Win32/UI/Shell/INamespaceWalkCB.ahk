#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback interface exposing methods used with INamespaceWalk.
 * @remarks
 * 
 * The IID for this interface is IID_INamespaceWalkCB.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-inamespacewalkcb
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INamespaceWalkCB extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamespaceWalkCB
     * @type {Guid}
     */
    static IID => Guid("{d92995f8-cf5e-4a76-bf59-ead39ea2b97e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FoundItem", "EnterFolder", "LeaveFolder", "InitializeProgressDialog"]

    /**
     * Called when an object is found in the namespace during a namespace walk. Use this method as the main action function for the class implementing it. Perform your actions as needed inside this method.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object representing the folder containing the item.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * The item's PIDL, relative to <i>psf</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacewalkcb-founditem
     */
    FoundItem(psf, pidl) {
        result := ComCall(3, this, "ptr", psf, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * Called when a folder is about to be entered during a namespace walk. Use this method for any initialization of the retrieved item.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object representing the parent of the folder designated by <i>pidl</i>.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * The PIDL, relative to <i>psf</i>, of the folder being entered.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacewalkcb-enterfolder
     */
    EnterFolder(psf, pidl) {
        result := ComCall(4, this, "ptr", psf, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * Called after a namespace walk through a folder. Use this method to perform any necessary cleanup following the actions performed by INamespaceWalkCB::EnterFolder or INamespaceWalkCB::FoundItem.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object representing the parent of the folder designated by <i>pidl</i>.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A PIDL, relative to <i>psf</i>, of the folder being exited.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacewalkcb-leavefolder
     */
    LeaveFolder(psf, pidl) {
        result := ComCall(5, this, "ptr", psf, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * Initializes the window title and cancel button text of the progress dialog box displayed during the namespace walk.
     * @param {Pointer<PWSTR>} ppszTitle Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a null-terminated string that contains the title to be used for the dialog box.
     * @param {Pointer<PWSTR>} ppszCancel Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a null-terminated string that contains the text displayed on the button that cancels the namespace walk.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacewalkcb-initializeprogressdialog
     */
    InitializeProgressDialog(ppszTitle, ppszCancel) {
        ppszTitleMarshal := ppszTitle is VarRef ? "ptr*" : "ptr"
        ppszCancelMarshal := ppszCancel is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, ppszTitleMarshal, ppszTitle, ppszCancelMarshal, ppszCancel, "HRESULT")
        return result
    }
}
