#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ITransformPattern2IdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransformPattern2IdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{78963644-11f0-467c-a72b-5dac41c1f6fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanZoomProperty", "get_ZoomLevelProperty", "get_MaxZoomProperty", "get_MinZoomProperty"]

    /**
     * @type {AutomationProperty} 
     */
    CanZoomProperty {
        get => this.get_CanZoomProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ZoomLevelProperty {
        get => this.get_ZoomLevelProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    MaxZoomProperty {
        get => this.get_MaxZoomProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    MinZoomProperty {
        get => this.get_MinZoomProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_CanZoomProperty() {
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
    get_ZoomLevelProperty() {
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
    get_MaxZoomProperty() {
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
    get_MinZoomProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
