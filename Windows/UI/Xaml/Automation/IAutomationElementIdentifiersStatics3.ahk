#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationElementIdentifiersStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationElementIdentifiersStatics3
     * @type {Guid}
     */
    static IID => Guid("{0f5cbebd-b3eb-4083-adc7-0c2f39bb3543}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PositionInSetProperty", "get_SizeOfSetProperty", "get_LevelProperty", "get_AnnotationsProperty"]

    /**
     * @type {AutomationProperty} 
     */
    PositionInSetProperty {
        get => this.get_PositionInSetProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    SizeOfSetProperty {
        get => this.get_SizeOfSetProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    LevelProperty {
        get => this.get_LevelProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    AnnotationsProperty {
        get => this.get_AnnotationsProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_PositionInSetProperty() {
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
    get_SizeOfSetProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_LevelProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_AnnotationsProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
