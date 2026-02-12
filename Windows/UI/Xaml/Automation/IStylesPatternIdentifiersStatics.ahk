#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IStylesPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStylesPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{528a457a-bc3c-4d48-94af-1f68703ca296}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtendedPropertiesProperty", "get_FillColorProperty", "get_FillPatternColorProperty", "get_FillPatternStyleProperty", "get_ShapeProperty", "get_StyleIdProperty", "get_StyleNameProperty"]

    /**
     * @type {AutomationProperty} 
     */
    ExtendedPropertiesProperty {
        get => this.get_ExtendedPropertiesProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    FillColorProperty {
        get => this.get_FillColorProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    FillPatternColorProperty {
        get => this.get_FillPatternColorProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    FillPatternStyleProperty {
        get => this.get_FillPatternStyleProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ShapeProperty {
        get => this.get_ShapeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    StyleIdProperty {
        get => this.get_StyleIdProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    StyleNameProperty {
        get => this.get_StyleNameProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ExtendedPropertiesProperty() {
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
    get_FillColorProperty() {
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
    get_FillPatternColorProperty() {
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
    get_FillPatternStyleProperty() {
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
    get_ShapeProperty() {
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
    get_StyleIdProperty() {
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
    get_StyleNameProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
