#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow notification of events within a common file dialog.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * <b>IFileDialogEvents</b> is implemented by an application that is a client of the common file dialog browser. Methods that are not implemented should return E_NOTIMPL. An example of <b>IFileDialogEvents</b> can be found in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd940349(v=vs.85)">Common File Dialog</a> SDK sample.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifiledialogevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileDialogEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileDialogEvents
     * @type {Guid}
     */
    static IID => Guid("{973510db-7d7f-452b-8975-74a85828d354}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnFileOk", "OnFolderChanging", "OnFolderChange", "OnSelectionChange", "OnShareViolation", "OnTypeChange", "OnOverwrite"]

    /**
     * 
     * @param {IFileDialog} pfd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfileok
     */
    OnFileOk(pfd) {
        result := ComCall(3, this, "ptr", pfd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFileDialog} pfd 
     * @param {IShellItem} psiFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfolderchanging
     */
    OnFolderChanging(pfd, psiFolder) {
        result := ComCall(4, this, "ptr", pfd, "ptr", psiFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFileDialog} pfd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfolderchange
     */
    OnFolderChange(pfd) {
        result := ComCall(5, this, "ptr", pfd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFileDialog} pfd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onselectionchange
     */
    OnSelectionChange(pfd) {
        result := ComCall(6, this, "ptr", pfd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFileDialog} pfd 
     * @param {IShellItem} psi 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onshareviolation
     */
    OnShareViolation(pfd, psi) {
        result := ComCall(7, this, "ptr", pfd, "ptr", psi, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    /**
     * 
     * @param {IFileDialog} pfd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogevents-ontypechange
     */
    OnTypeChange(pfd) {
        result := ComCall(8, this, "ptr", pfd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFileDialog} pfd 
     * @param {IShellItem} psi 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onoverwrite
     */
    OnOverwrite(pfd, psi) {
        result := ComCall(9, this, "ptr", pfd, "ptr", psi, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }
}
