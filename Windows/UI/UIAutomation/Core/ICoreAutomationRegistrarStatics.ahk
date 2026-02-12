#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationAnnotationTypeRegistration.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class ICoreAutomationRegistrarStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreAutomationRegistrarStatics
     * @type {Guid}
     */
    static IID => Guid("{3e50129b-d6dc-5680-b580-ffff78300304}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterAnnotationType", "UnregisterAnnotationType"]

    /**
     * 
     * @param {Guid} guid 
     * @returns {AutomationAnnotationTypeRegistration} 
     */
    RegisterAnnotationType(guid) {
        result_ := AutomationAnnotationTypeRegistration()
        result := ComCall(6, this, "ptr", guid, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {AutomationAnnotationTypeRegistration} registration 
     * @returns {HRESULT} 
     */
    UnregisterAnnotationType(registration) {
        result := ComCall(7, this, "ptr", registration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
