#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IGridItemPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridItemPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{217d2402-5e46-4d61-8794-b8ee8e774714}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColumnProperty", "get_ColumnSpanProperty", "get_ContainingGridProperty", "get_RowProperty", "get_RowSpanProperty"]

    /**
     * @type {AutomationProperty} 
     */
    ColumnProperty {
        get => this.get_ColumnProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ColumnSpanProperty {
        get => this.get_ColumnSpanProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ContainingGridProperty {
        get => this.get_ContainingGridProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    RowProperty {
        get => this.get_RowProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    RowSpanProperty {
        get => this.get_RowSpanProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ColumnProperty() {
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
    get_ColumnSpanProperty() {
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
    get_ContainingGridProperty() {
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
    get_RowProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_RowSpanProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
