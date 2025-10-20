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
     * 
     * @param {HWND} hwndOwner 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    StartProgressDialog(hwndOwner, flags) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", hwndOwner, "uint", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopProgressDialog() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    SetOperation(action) {
        result := ComCall(5, this, "int", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetMode(mode) {
        result := ComCall(6, this, "uint", mode, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    UpdateProgress(ullPointsCurrent, ullPointsTotal, ullSizeCurrent, ullSizeTotal, ullItemsCurrent, ullItemsTotal) {
        result := ComCall(7, this, "uint", ullPointsCurrent, "uint", ullPointsTotal, "uint", ullSizeCurrent, "uint", ullSizeTotal, "uint", ullItemsCurrent, "uint", ullItemsTotal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psiSource 
     * @param {Pointer<IShellItem>} psiTarget 
     * @param {Pointer<IShellItem>} psiItem 
     * @returns {HRESULT} 
     */
    UpdateLocations(psiSource, psiTarget, psiItem) {
        result := ComCall(8, this, "ptr", psiSource, "ptr", psiTarget, "ptr", psiItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetTimer() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PauseTimer() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResumeTimer() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pullElapsed 
     * @param {Pointer<UInt64>} pullRemaining 
     * @returns {HRESULT} 
     */
    GetMilliseconds(pullElapsed, pullRemaining) {
        result := ComCall(12, this, "uint*", pullElapsed, "uint*", pullRemaining, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} popstatus 
     * @returns {HRESULT} 
     */
    GetOperationStatus(popstatus) {
        result := ComCall(13, this, "int*", popstatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
