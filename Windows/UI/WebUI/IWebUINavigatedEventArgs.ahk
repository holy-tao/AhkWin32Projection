#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WebUINavigatedOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data for an app navigation event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.iwebuinavigatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class IWebUINavigatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebUINavigatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a75841b8-2499-4030-a69d-15d2d9cfe524}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NavigatedOperation"]

    /**
     * Gets the app navigation operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.iwebuinavigatedeventargs.navigatedoperation
     * @type {WebUINavigatedOperation} 
     */
    NavigatedOperation {
        get => this.get_NavigatedOperation()
    }

    /**
     * 
     * @returns {WebUINavigatedOperation} 
     */
    get_NavigatedOperation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebUINavigatedOperation(value)
    }
}
