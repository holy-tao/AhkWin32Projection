#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IMultipleViewPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultipleViewPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{a9cfa66f-6b84-4d71-9e48-d764d3bcda8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentViewProperty", "get_SupportedViewsProperty"]

    /**
     * @type {AutomationProperty} 
     */
    CurrentViewProperty {
        get => this.get_CurrentViewProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    SupportedViewsProperty {
        get => this.get_SupportedViewsProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_CurrentViewProperty() {
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
    get_SupportedViewsProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
