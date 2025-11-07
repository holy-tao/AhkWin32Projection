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
     * 
     * @param {IShellFolder} psf 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb-founditem
     */
    FoundItem(psf, pidl) {
        result := ComCall(3, this, "ptr", psf, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellFolder} psf 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb-enterfolder
     */
    EnterFolder(psf, pidl) {
        result := ComCall(4, this, "ptr", psf, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellFolder} psf 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb-leavefolder
     */
    LeaveFolder(psf, pidl) {
        result := ComCall(5, this, "ptr", psf, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTitle 
     * @param {Pointer<PWSTR>} ppszCancel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb-initializeprogressdialog
     */
    InitializeProgressDialog(ppszTitle, ppszCancel) {
        ppszTitleMarshal := ppszTitle is VarRef ? "ptr*" : "ptr"
        ppszCancelMarshal := ppszCancel is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, ppszTitleMarshal, ppszTitle, ppszCancelMarshal, ppszCancel, "HRESULT")
        return result
    }
}
