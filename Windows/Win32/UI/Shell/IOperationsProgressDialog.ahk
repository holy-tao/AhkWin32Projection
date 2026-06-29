#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "PropertiesSystem\PDOPSTATUS.ahk" { PDOPSTATUS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SPACTION.ahk" { SPACTION }

/**
 * Exposes methods to get, set, and query a progress dialog.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ioperationsprogressdialog
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IOperationsProgressDialog extends IUnknown {
    /**
     * The interface identifier for IOperationsProgressDialog
     * @type {Guid}
     */
    static IID := Guid("{0c9fb851-e5c9-43eb-a370-f0677b13874c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOperationsProgressDialog interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartProgressDialog : IntPtr
        StopProgressDialog  : IntPtr
        SetOperation        : IntPtr
        SetMode             : IntPtr
        UpdateProgress      : IntPtr
        UpdateLocations     : IntPtr
        ResetTimer          : IntPtr
        PauseTimer          : IntPtr
        ResumeTimer         : IntPtr
        GetMilliseconds     : IntPtr
        GetOperationStatus  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOperationsProgressDialog.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-startprogressdialog
     */
    StartProgressDialog(hwndOwner, flags) {
        result := ComCall(3, this, HWND, hwndOwner, "uint", flags, "HRESULT")
        return result
    }

    /**
     * Stops current progress dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-stopprogressdialog
     */
    StopProgressDialog() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Sets which progress dialog operation is occurring, and whether we are in pre-flight or undo mode.
     * @param {SPACTION} action Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-spaction">SPACTION</a></b>
     * 
     * Specifies operation. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-spaction">SPACTION</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-setoperation
     */
    SetOperation(action) {
        result := ComCall(5, this, SPACTION, action, "HRESULT")
        return result
    }

    /**
     * Sets progress dialog operations mode.
     * @param {Integer} _mode Type: <b>PDMODE</b>
     * 
     * Specifies the operation mode. The following are valid values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-setmode
     */
    SetMode(_mode) {
        result := ComCall(6, this, "uint", _mode, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-updateprogress
     */
    UpdateProgress(ullPointsCurrent, ullPointsTotal, ullSizeCurrent, ullSizeTotal, ullItemsCurrent, ullItemsTotal) {
        result := ComCall(7, this, "uint", ullPointsCurrent, "uint", ullPointsTotal, "uint", ullSizeCurrent, "uint", ullSizeTotal, "uint", ullItemsCurrent, "uint", ullItemsTotal, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-updatelocations
     */
    UpdateLocations(psiSource, psiTarget, psiItem) {
        result := ComCall(8, this, "ptr", psiSource, "ptr", psiTarget, "ptr", psiItem, "HRESULT")
        return result
    }

    /**
     * Resets progress dialog timer to 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-resettimer
     */
    ResetTimer() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Pauses progress dialog timer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-pausetimer
     */
    PauseTimer() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Resumes progress dialog timer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-resumetimer
     */
    ResumeTimer() {
        result := ComCall(11, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-getmilliseconds
     */
    GetMilliseconds(pullElapsed, pullRemaining) {
        pullElapsedMarshal := pullElapsed is VarRef ? "uint*" : "ptr"
        pullRemainingMarshal := pullRemaining is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pullElapsedMarshal, pullElapsed, pullRemainingMarshal, pullRemaining, "HRESULT")
        return result
    }

    /**
     * Gets operation status for progress dialog.
     * @returns {PDOPSTATUS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-pdopstatus">PDOPSTATUS</a>*</b>
     * 
     * Contains pointer to the operation status. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-pdopstatus">PDOPSTATUS</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-getoperationstatus
     */
    GetOperationStatus() {
        result := ComCall(13, this, "int*", &popstatus := 0, "HRESULT")
        return popstatus
    }

    Query(iid) {
        if (IOperationsProgressDialog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartProgressDialog := CallbackCreate(GetMethod(implObj, "StartProgressDialog"), flags, 3)
        this.vtbl.StopProgressDialog := CallbackCreate(GetMethod(implObj, "StopProgressDialog"), flags, 1)
        this.vtbl.SetOperation := CallbackCreate(GetMethod(implObj, "SetOperation"), flags, 2)
        this.vtbl.SetMode := CallbackCreate(GetMethod(implObj, "SetMode"), flags, 2)
        this.vtbl.UpdateProgress := CallbackCreate(GetMethod(implObj, "UpdateProgress"), flags, 7)
        this.vtbl.UpdateLocations := CallbackCreate(GetMethod(implObj, "UpdateLocations"), flags, 4)
        this.vtbl.ResetTimer := CallbackCreate(GetMethod(implObj, "ResetTimer"), flags, 1)
        this.vtbl.PauseTimer := CallbackCreate(GetMethod(implObj, "PauseTimer"), flags, 1)
        this.vtbl.ResumeTimer := CallbackCreate(GetMethod(implObj, "ResumeTimer"), flags, 1)
        this.vtbl.GetMilliseconds := CallbackCreate(GetMethod(implObj, "GetMilliseconds"), flags, 3)
        this.vtbl.GetOperationStatus := CallbackCreate(GetMethod(implObj, "GetOperationStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartProgressDialog)
        CallbackFree(this.vtbl.StopProgressDialog)
        CallbackFree(this.vtbl.SetOperation)
        CallbackFree(this.vtbl.SetMode)
        CallbackFree(this.vtbl.UpdateProgress)
        CallbackFree(this.vtbl.UpdateLocations)
        CallbackFree(this.vtbl.ResetTimer)
        CallbackFree(this.vtbl.PauseTimer)
        CallbackFree(this.vtbl.ResumeTimer)
        CallbackFree(this.vtbl.GetMilliseconds)
        CallbackFree(this.vtbl.GetOperationStatus)
    }
}
