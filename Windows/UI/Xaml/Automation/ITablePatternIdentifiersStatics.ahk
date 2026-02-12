#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ITablePatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITablePatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{75073d25-32c9-4903-aecf-dc3504cbd244}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColumnHeadersProperty", "get_RowHeadersProperty", "get_RowOrColumnMajorProperty"]

    /**
     * @type {AutomationProperty} 
     */
    ColumnHeadersProperty {
        get => this.get_ColumnHeadersProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    RowHeadersProperty {
        get => this.get_RowHeadersProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    RowOrColumnMajorProperty {
        get => this.get_RowOrColumnMajorProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ColumnHeadersProperty() {
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
    get_RowHeadersProperty() {
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
    get_RowOrColumnMajorProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
