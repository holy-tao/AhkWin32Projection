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
     * 
     * @param {Pointer<IFileDialog>} pfd 
     * @returns {HRESULT} 
     */
    OnFileOk(pfd) {
        result := ComCall(3, this, "ptr", pfd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialog>} pfd 
     * @param {Pointer<IShellItem>} psiFolder 
     * @returns {HRESULT} 
     */
    OnFolderChanging(pfd, psiFolder) {
        result := ComCall(4, this, "ptr", pfd, "ptr", psiFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialog>} pfd 
     * @returns {HRESULT} 
     */
    OnFolderChange(pfd) {
        result := ComCall(5, this, "ptr", pfd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialog>} pfd 
     * @returns {HRESULT} 
     */
    OnSelectionChange(pfd) {
        result := ComCall(6, this, "ptr", pfd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialog>} pfd 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<Int32>} pResponse 
     * @returns {HRESULT} 
     */
    OnShareViolation(pfd, psi, pResponse) {
        result := ComCall(7, this, "ptr", pfd, "ptr", psi, "int*", pResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialog>} pfd 
     * @returns {HRESULT} 
     */
    OnTypeChange(pfd) {
        result := ComCall(8, this, "ptr", pfd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialog>} pfd 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<Int32>} pResponse 
     * @returns {HRESULT} 
     */
    OnOverwrite(pfd, psi, pResponse) {
        result := ComCall(9, this, "ptr", pfd, "ptr", psi, "int*", pResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
