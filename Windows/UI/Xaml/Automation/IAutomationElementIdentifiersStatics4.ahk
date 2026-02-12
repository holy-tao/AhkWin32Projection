#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationElementIdentifiersStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationElementIdentifiersStatics4
     * @type {Guid}
     */
    static IID => Guid("{5af51f75-5913-4d78-b330-a6f50b73ed9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LandmarkTypeProperty", "get_LocalizedLandmarkTypeProperty"]

    /**
     * @type {AutomationProperty} 
     */
    LandmarkTypeProperty {
        get => this.get_LandmarkTypeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    LocalizedLandmarkTypeProperty {
        get => this.get_LocalizedLandmarkTypeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_LandmarkTypeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_LocalizedLandmarkTypeProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
