#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\UISettingsController.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class IUISettingsControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUISettingsControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{eb3c68cc-c220-578c-8119-7db324ed26a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestDefaultAsync"]

    /**
     * 
     * @returns {IAsyncOperation<UISettingsController>} 
     */
    RequestDefaultAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UISettingsController, operation)
    }
}
