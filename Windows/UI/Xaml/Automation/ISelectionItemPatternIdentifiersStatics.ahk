#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ISelectionItemPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionItemPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{a918d163-487e-4e3e-9f86-7b44acbe27ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSelectedProperty", "get_SelectionContainerProperty"]

    /**
     * @type {AutomationProperty} 
     */
    IsSelectedProperty {
        get => this.get_IsSelectedProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    SelectionContainerProperty {
        get => this.get_SelectionContainerProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsSelectedProperty() {
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
    get_SelectionContainerProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
