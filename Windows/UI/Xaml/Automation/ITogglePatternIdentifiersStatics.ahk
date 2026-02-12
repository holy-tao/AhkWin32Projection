#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ITogglePatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITogglePatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{c7f75544-14a5-4f2f-92fc-760524de06ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ToggleStateProperty"]

    /**
     * @type {AutomationProperty} 
     */
    ToggleStateProperty {
        get => this.get_ToggleStateProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ToggleStateProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
