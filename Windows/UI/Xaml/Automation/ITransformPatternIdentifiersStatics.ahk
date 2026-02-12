#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ITransformPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransformPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{4570edab-d705-40c4-a1dc-e9acfcef85f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanMoveProperty", "get_CanResizeProperty", "get_CanRotateProperty"]

    /**
     * @type {AutomationProperty} 
     */
    CanMoveProperty {
        get => this.get_CanMoveProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    CanResizeProperty {
        get => this.get_CanResizeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    CanRotateProperty {
        get => this.get_CanRotateProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_CanMoveProperty() {
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
    get_CanResizeProperty() {
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
    get_CanRotateProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
