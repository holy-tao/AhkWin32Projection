#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IWebUIBackgroundTaskInstance.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class IWebUIBackgroundTaskInstanceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebUIBackgroundTaskInstanceStatics
     * @type {Guid}
     */
    static IID => Guid("{9c7a5291-19ae-4ca3-b94b-fe4ec744a740}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current"]

    /**
     * @type {IWebUIBackgroundTaskInstance} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {IWebUIBackgroundTaskInstance} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &backgroundTaskInstance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWebUIBackgroundTaskInstance(backgroundTaskInstance)
    }
}
