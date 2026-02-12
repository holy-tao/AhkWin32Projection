#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UIViewSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IUIViewSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIViewSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{595c97a5-f8f6-41cf-b0fb-aacdb81fd5f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView"]

    /**
     * 
     * @returns {UIViewSettings} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIViewSettings(result_)
    }
}
