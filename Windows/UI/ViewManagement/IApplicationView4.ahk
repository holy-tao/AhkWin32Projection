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
class IApplicationView4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationView4
     * @type {Guid}
     */
    static IID => Guid("{15e5cbec-9e0f-46b5-bc3f-9bf653e74b5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ViewMode", "IsViewModeSupported", "TryEnterViewModeAsync", "TryEnterViewModeWithPreferencesAsync", "TryConsolidateAsync"]

    /**
     * @type {Integer} 
     */
    ViewMode {
        get => this.get_ViewMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} viewMode 
     * @returns {Boolean} 
     */
    IsViewModeSupported(viewMode) {
        result := ComCall(7, this, "int", viewMode, "int*", &isViewModeSupported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isViewModeSupported
    }

    /**
     * 
     * @param {Integer} viewMode 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryEnterViewModeAsync(viewMode) {
        result := ComCall(8, this, "int", viewMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} viewMode 
     * @param {ViewModePreferences} viewModePreferences_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryEnterViewModeWithPreferencesAsync(viewMode, viewModePreferences_) {
        result := ComCall(9, this, "int", viewMode, "ptr", viewModePreferences_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryConsolidateAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
