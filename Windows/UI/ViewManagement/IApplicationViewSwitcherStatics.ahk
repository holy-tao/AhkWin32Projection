#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationViewSwitcherStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationViewSwitcherStatics
     * @type {Guid}
     */
    static IID => Guid("{975f2f1e-e656-4c5e-a0a1-717c6ffa7d64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DisableShowingMainViewOnActivation", "TryShowAsStandaloneAsync", "TryShowAsStandaloneWithSizePreferenceAsync", "TryShowAsStandaloneWithAnchorViewAndSizePreferenceAsync", "SwitchAsync", "SwitchFromViewAsync", "SwitchFromViewWithOptionsAsync", "PrepareForCustomAnimatedSwitchAsync"]

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableShowingMainViewOnActivation() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} viewId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryShowAsStandaloneAsync(viewId) {
        result := ComCall(7, this, "int", viewId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} viewId 
     * @param {Integer} sizePreference 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryShowAsStandaloneWithSizePreferenceAsync(viewId, sizePreference) {
        result := ComCall(8, this, "int", viewId, "int", sizePreference, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} viewId 
     * @param {Integer} sizePreference 
     * @param {Integer} anchorViewId 
     * @param {Integer} anchorSizePreference 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryShowAsStandaloneWithAnchorViewAndSizePreferenceAsync(viewId, sizePreference, anchorViewId, anchorSizePreference) {
        result := ComCall(9, this, "int", viewId, "int", sizePreference, "int", anchorViewId, "int", anchorSizePreference, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} viewId 
     * @returns {IAsyncAction} 
     */
    SwitchAsync(viewId) {
        result := ComCall(10, this, "int", viewId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} toViewId 
     * @param {Integer} fromViewId 
     * @returns {IAsyncAction} 
     */
    SwitchFromViewAsync(toViewId, fromViewId) {
        result := ComCall(11, this, "int", toViewId, "int", fromViewId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} toViewId 
     * @param {Integer} fromViewId 
     * @param {Integer} options 
     * @returns {IAsyncAction} 
     */
    SwitchFromViewWithOptionsAsync(toViewId, fromViewId, options) {
        result := ComCall(12, this, "int", toViewId, "int", fromViewId, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} toViewId 
     * @param {Integer} fromViewId 
     * @param {Integer} options 
     * @returns {IAsyncOperation<Boolean>} 
     */
    PrepareForCustomAnimatedSwitchAsync(toViewId, fromViewId, options) {
        result := ComCall(13, this, "int", toViewId, "int", fromViewId, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
