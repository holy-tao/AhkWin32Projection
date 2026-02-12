#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IScrollPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{4bf8e0a1-fb7f-4fa4-83b3-cfaeb103a685}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontallyScrollableProperty", "get_HorizontalScrollPercentProperty", "get_HorizontalViewSizeProperty", "get_NoScroll", "get_VerticallyScrollableProperty", "get_VerticalScrollPercentProperty", "get_VerticalViewSizeProperty"]

    /**
     * @type {AutomationProperty} 
     */
    HorizontallyScrollableProperty {
        get => this.get_HorizontallyScrollableProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    HorizontalScrollPercentProperty {
        get => this.get_HorizontalScrollPercentProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    HorizontalViewSizeProperty {
        get => this.get_HorizontalViewSizeProperty()
    }

    /**
     * @type {Float} 
     */
    NoScroll {
        get => this.get_NoScroll()
    }

    /**
     * @type {AutomationProperty} 
     */
    VerticallyScrollableProperty {
        get => this.get_VerticallyScrollableProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    VerticalScrollPercentProperty {
        get => this.get_VerticalScrollPercentProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    VerticalViewSizeProperty {
        get => this.get_VerticalViewSizeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_HorizontallyScrollableProperty() {
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
    get_HorizontalScrollPercentProperty() {
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
    get_HorizontalViewSizeProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NoScroll() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_VerticallyScrollableProperty() {
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
    get_VerticalScrollPercentProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_VerticalViewSizeProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
