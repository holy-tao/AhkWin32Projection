#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationViewSwitcherStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationViewSwitcherStatics3
     * @type {Guid}
     */
    static IID => Guid("{92059420-80a7-486d-b21f-c7a4a242a383}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryShowAsViewModeAsync", "TryShowAsViewModeWithPreferencesAsync"]

    /**
     * 
     * @param {Integer} viewId 
     * @param {Integer} viewMode 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryShowAsViewModeAsync(viewId, viewMode) {
        result := ComCall(6, this, "int", viewId, "int", viewMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} viewId 
     * @param {Integer} viewMode 
     * @param {ViewModePreferences} viewModePreferences_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryShowAsViewModeWithPreferencesAsync(viewId, viewMode, viewModePreferences_) {
        result := ComCall(7, this, "int", viewId, "int", viewMode, "ptr", viewModePreferences_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
