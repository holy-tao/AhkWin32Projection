#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IExpandCollapsePatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExpandCollapsePatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{d7816fd4-6ee0-4f38-8e14-56ef21adacfd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExpandCollapseStateProperty"]

    /**
     * @type {AutomationProperty} 
     */
    ExpandCollapseStateProperty {
        get => this.get_ExpandCollapseStateProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ExpandCollapseStateProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
