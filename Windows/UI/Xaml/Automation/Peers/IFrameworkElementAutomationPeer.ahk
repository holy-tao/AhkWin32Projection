#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\UIElement.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IFrameworkElementAutomationPeer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElementAutomationPeer
     * @type {Guid}
     */
    static IID => Guid("{b90ad781-bfeb-4451-bd47-9f3a63ebd24a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Owner"]

    /**
     * @type {UIElement} 
     */
    Owner {
        get => this.get_Owner()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Owner() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }
}
