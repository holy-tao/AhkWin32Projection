#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationElementIdentifiersStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationElementIdentifiersStatics2
     * @type {Guid}
     */
    static IID => Guid("{b5cbb1e2-d55f-46a9-9eda-1a4742515dc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ControlledPeersProperty"]

    /**
     * @type {AutomationProperty} 
     */
    ControlledPeersProperty {
        get => this.get_ControlledPeersProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ControlledPeersProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
