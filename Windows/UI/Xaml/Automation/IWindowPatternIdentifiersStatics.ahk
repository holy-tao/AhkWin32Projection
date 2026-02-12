#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IWindowPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{07d0ad06-6302-4d29-878b-19da03fc228d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanMaximizeProperty", "get_CanMinimizeProperty", "get_IsModalProperty", "get_IsTopmostProperty", "get_WindowInteractionStateProperty", "get_WindowVisualStateProperty"]

    /**
     * @type {AutomationProperty} 
     */
    CanMaximizeProperty {
        get => this.get_CanMaximizeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    CanMinimizeProperty {
        get => this.get_CanMinimizeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsModalProperty {
        get => this.get_IsModalProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsTopmostProperty {
        get => this.get_IsTopmostProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    WindowInteractionStateProperty {
        get => this.get_WindowInteractionStateProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    WindowVisualStateProperty {
        get => this.get_WindowVisualStateProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_CanMaximizeProperty() {
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
    get_CanMinimizeProperty() {
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
    get_IsModalProperty() {
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
    get_IsTopmostProperty() {
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
    get_WindowInteractionStateProperty() {
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
    get_WindowVisualStateProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
