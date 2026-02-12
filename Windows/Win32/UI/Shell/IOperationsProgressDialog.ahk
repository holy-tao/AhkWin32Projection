#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to get, set, and query a progress dialog.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ioperationsprogressdialog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IOperationsProgressDialog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOperationsProgressDialog
     * @type {Guid}
     */
    static IID => Guid("{0c9fb851-e5c9-43eb-a370-f0677b13874c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartProgressDialog", "StopProgressDialog", "SetOperation", "SetMode", "UpdateProgress", "UpdateLocations", "ResetTimer", "PauseTimer", "ResumeTimer", "GetMilliseconds", "GetOperationStatus"]

    /**
     * Starts the specified progress dialog.
     * @remarks
     * The progress dialog should be created on a separate thread than the file operation on which the dialog is reporting. If the dialog is running in the same thread as the file operation, progress messages are, at best, only sent as resources allow. Progress messages on the same thread as the file operation might not be sent at all.
     * 
     * Once <b>IOperationsProgressDialog::StartProgressDialog</b> is called, that instance of the <b>CLSID_ProgressDialog</b> object cannot be accessed by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iprogressdialog">IProgressDialog</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iactionprogressdialog">IActionProgressDialog</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iactionprogress">IActionProgress</a>. Although <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> can be used to access these interfaces, most of their methods cannot be invoked. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ioperationsprogressdialog">IOperationsProgressDialog</a> is the interface used to display the new progress dialog for the Windows Vista and later operations engine.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the parent window.
     * @param {Integer} flags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-startprogressdialog
     */
    StartProgressDialog(hwndOwner, flags) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", hwndOwner, "uint", flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops current progress dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-stopprogressdialog
     */
    StopProgressDialog() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets which progress dialog operation is occurring, and whether we are in pre-flight or undo mode.
     * @param {Integer} action Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-spaction">SPACTION</a></b>
     * 
     * Specifies operation. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-spaction">SPACTION</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-setoperation
     */
    SetOperation(action) {
        result := ComCall(5, this, "int", action, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets progress dialog operations mode.
     * @param {Integer} mode_ Type: <b>PDMODE</b>
     * 
     * Specifies the operation mode. The following are valid values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-setmode
     */
    SetMode(mode_) {
        result := ComCall(6, this, "uint", mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Updates the current progress dialog, as specified.
     * @param {Integer} ullPointsCurrent Type: <b>ULONGLONG</b>
     * 
     * Current points, used for showing progress in points.
     * @param {Integer} ullPointsTotal Type: <b>ULONGLONG</b>
     * 
     * Total points, used for showing progress in points.
     * @param {Integer} ullSizeCurrent Type: <b>ULONGLONG</b>
     * 
     * Current size in bytes, used for showing progress in bytes.
     * @param {Integer} ullSizeTotal Type: <b>ULONGLONG</b>
     * 
     * Total size in bytes, used for showing progress in bytes.
     * @param {Integer} ullItemsCurrent Type: <b>ULONGLONG</b>
     * 
     * Current items, used for showing progress in items.
     * @param {Integer} ullItemsTotal Type: <b>ULONGLONG</b>
     * 
     * Specifies total items, used for showing progress in items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-updateprogress
     */
    UpdateProgress(ullPointsCurrent, ullPointsTotal, ullSizeCurrent, ullSizeTotal, ullItemsCurrent, ullItemsTotal) {
        result := ComCall(7, this, "uint", ullPointsCurrent, "uint", ullPointsTotal, "uint", ullSizeCurrent, "uint", ullSizeTotal, "uint", ullItemsCurrent, "uint", ullItemsTotal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called to specify the text elements stating the source and target in the current progress dialog.
     * @param {IShellItem} psiSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the source Shell item.
     * @param {IShellItem} psiTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the target Shell item.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the item currently being operated on by the operation engine. This parameter is only used in Windows 7 and later. In earlier versions, this parameter should be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-updatelocations
     */
    UpdateLocations(psiSource, psiTarget, psiItem) {
        result := ComCall(8, this, "ptr", psiSource, "ptr", psiTarget, "ptr", psiItem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resets progress dialog timer to 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-resettimer
     */
    ResetTimer() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Pauses progress dialog timer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-pausetimer
     */
    PauseTimer() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resumes progress dialog timer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-resumetimer
     */
    ResumeTimer() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets elapsed and remaining time for progress dialog.
     * @param {Pointer<Integer>} pullElapsed Type: <b>ULONGLONG*</b>
     * 
     * A pointer to the elapsed time in milliseconds.
     * @param {Pointer<Integer>} pullRemaining Type: <b>ULONGLONG*</b>
     * 
     * A pointer to the remaining time in milliseconds.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-getmilliseconds
     */
    GetMilliseconds(pullElapsed, pullRemaining) {
        pullElapsedMarshal := pullElapsed is VarRef ? "uint*" : "ptr"
        pullRemainingMarshal := pullRemaining is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pullElapsedMarshal, pullElapsed, pullRemainingMarshal, pullRemaining, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets operation status for progress dialog.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-pdopstatus">PDOPSTATUS</a>*</b>
     * 
     * Contains pointer to the operation status. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-pdopstatus">PDOPSTATUS</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-getoperationstatus
     */
    GetOperationStatus() {
        result := ComCall(13, this, "int*", &popstatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return popstatus
    }
}
