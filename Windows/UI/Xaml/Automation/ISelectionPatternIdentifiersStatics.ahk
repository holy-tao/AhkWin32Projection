#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ISelectionPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{93035b4c-6b50-40a1-b23f-5c78ddbd479a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanSelectMultipleProperty", "get_IsSelectionRequiredProperty", "get_SelectionProperty"]

    /**
     * @type {AutomationProperty} 
     */
    CanSelectMultipleProperty {
        get => this.get_CanSelectMultipleProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsSelectionRequiredProperty {
        get => this.get_IsSelectionRequiredProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    SelectionProperty {
        get => this.get_SelectionProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_CanSelectMultipleProperty() {
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
    get_IsSelectionRequiredProperty() {
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
    get_SelectionProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
