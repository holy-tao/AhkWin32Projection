#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AutomationConnection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.UIAutomation
 * @version WindowsRuntime 1.4
 */
class IAutomationConnectionBoundObject extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationConnectionBoundObject
     * @type {Guid}
     */
    static IID => Guid("{5e8558fb-ca52-5b65-9830-dd2905816093}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Connection"]

    /**
     * @type {AutomationConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * 
     * @returns {AutomationConnection} 
     */
    get_Connection() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationConnection(value)
    }
}
