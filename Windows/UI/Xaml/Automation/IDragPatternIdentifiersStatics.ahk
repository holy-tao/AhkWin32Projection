#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IDragPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{2a05379d-1755-4082-9d90-46f1411d7986}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DropEffectProperty", "get_DropEffectsProperty", "get_GrabbedItemsProperty", "get_IsGrabbedProperty"]

    /**
     * @type {AutomationProperty} 
     */
    DropEffectProperty {
        get => this.get_DropEffectProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    DropEffectsProperty {
        get => this.get_DropEffectsProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    GrabbedItemsProperty {
        get => this.get_GrabbedItemsProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsGrabbedProperty {
        get => this.get_IsGrabbedProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_DropEffectProperty() {
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
    get_DropEffectsProperty() {
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
    get_GrabbedItemsProperty() {
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
    get_IsGrabbedProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
