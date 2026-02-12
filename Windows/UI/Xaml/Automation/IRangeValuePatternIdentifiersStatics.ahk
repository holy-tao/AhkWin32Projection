#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IRangeValuePatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRangeValuePatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{ce23450f-1c27-457f-b815-7a5e46863dbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsReadOnlyProperty", "get_LargeChangeProperty", "get_MaximumProperty", "get_MinimumProperty", "get_SmallChangeProperty", "get_ValueProperty"]

    /**
     * @type {AutomationProperty} 
     */
    IsReadOnlyProperty {
        get => this.get_IsReadOnlyProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    LargeChangeProperty {
        get => this.get_LargeChangeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    MaximumProperty {
        get => this.get_MaximumProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    MinimumProperty {
        get => this.get_MinimumProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    SmallChangeProperty {
        get => this.get_SmallChangeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ValueProperty {
        get => this.get_ValueProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsReadOnlyProperty() {
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
    get_LargeChangeProperty() {
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
    get_MaximumProperty() {
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
    get_MinimumProperty() {
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
    get_SmallChangeProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ValueProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
