#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ITableItemPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITableItemPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{24c4b923-e9a2-4de9-b2a4-a8b22d0be362}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColumnHeaderItemsProperty", "get_RowHeaderItemsProperty"]

    /**
     * @type {AutomationProperty} 
     */
    ColumnHeaderItemsProperty {
        get => this.get_ColumnHeaderItemsProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    RowHeaderItemsProperty {
        get => this.get_RowHeaderItemsProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ColumnHeaderItemsProperty() {
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
    get_RowHeaderItemsProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
