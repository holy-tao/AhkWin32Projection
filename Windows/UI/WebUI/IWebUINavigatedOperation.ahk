#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WebUINavigatedDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class IWebUINavigatedOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebUINavigatedOperation
     * @type {Guid}
     */
    static IID => Guid("{7a965f08-8182-4a89-ab67-8492e8750d4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral"]

    /**
     * 
     * @returns {WebUINavigatedDeferral} 
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebUINavigatedDeferral(deferral_)
    }
}
