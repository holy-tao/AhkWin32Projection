#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IActivationViewSwitcher extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivationViewSwitcher
     * @type {Guid}
     */
    static IID => Guid("{dca71bb6-7350-492b-aac7-c8a13d7224ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowAsStandaloneAsync", "ShowAsStandaloneWithSizePreferenceAsync", "IsViewPresentedOnActivationVirtualDesktop"]

    /**
     * 
     * @param {Integer} viewId 
     * @returns {IAsyncAction} 
     */
    ShowAsStandaloneAsync(viewId) {
        result := ComCall(6, this, "int", viewId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} viewId 
     * @param {Integer} sizePreference 
     * @returns {IAsyncAction} 
     */
    ShowAsStandaloneWithSizePreferenceAsync(viewId, sizePreference) {
        result := ComCall(7, this, "int", viewId, "int", sizePreference, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} viewId 
     * @returns {Boolean} 
     */
    IsViewPresentedOnActivationVirtualDesktop(viewId) {
        result := ComCall(8, this, "int", viewId, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
