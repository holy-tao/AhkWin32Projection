#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to get, set, and query a progress dialog.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ioperationsprogressdialog
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
     * 
     * @param {HWND} hwndOwner 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-startprogressdialog
     */
    StartProgressDialog(hwndOwner, flags) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", hwndOwner, "uint", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-stopprogressdialog
     */
    StopProgressDialog() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-setoperation
     */
    SetOperation(action) {
        result := ComCall(5, this, "int", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-setmode
     */
    SetMode(mode) {
        result := ComCall(6, this, "uint", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullPointsCurrent 
     * @param {Integer} ullPointsTotal 
     * @param {Integer} ullSizeCurrent 
     * @param {Integer} ullSizeTotal 
     * @param {Integer} ullItemsCurrent 
     * @param {Integer} ullItemsTotal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-updateprogress
     */
    UpdateProgress(ullPointsCurrent, ullPointsTotal, ullSizeCurrent, ullSizeTotal, ullItemsCurrent, ullItemsTotal) {
        result := ComCall(7, this, "uint", ullPointsCurrent, "uint", ullPointsTotal, "uint", ullSizeCurrent, "uint", ullSizeTotal, "uint", ullItemsCurrent, "uint", ullItemsTotal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiSource 
     * @param {IShellItem} psiTarget 
     * @param {IShellItem} psiItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-updatelocations
     */
    UpdateLocations(psiSource, psiTarget, psiItem) {
        result := ComCall(8, this, "ptr", psiSource, "ptr", psiTarget, "ptr", psiItem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-resettimer
     */
    ResetTimer() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-pausetimer
     */
    PauseTimer() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-resumetimer
     */
    ResumeTimer() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pullElapsed 
     * @param {Pointer<Integer>} pullRemaining 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-getmilliseconds
     */
    GetMilliseconds(pullElapsed, pullRemaining) {
        result := ComCall(12, this, "uint*", pullElapsed, "uint*", pullRemaining, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} popstatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ioperationsprogressdialog-getoperationstatus
     */
    GetOperationStatus(popstatus) {
        result := ComCall(13, this, "int*", popstatus, "HRESULT")
        return result
    }
}
