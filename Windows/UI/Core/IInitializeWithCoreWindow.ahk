#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the initialization behavior for apps that use [CoreWindow](corewindow.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.iinitializewithcorewindow
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class IInitializeWithCoreWindow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeWithCoreWindow
     * @type {Guid}
     */
    static IID => Guid("{188f20d6-9873-464a-ace5-57e010f465e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Specifies the method that provides the initial [CoreWindow](corewindow.md) instance for an app.
     * @param {CoreWindow} window_ The new app window.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.iinitializewithcorewindow.initialize
     */
    Initialize(window_) {
        result := ComCall(6, this, "ptr", window_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
