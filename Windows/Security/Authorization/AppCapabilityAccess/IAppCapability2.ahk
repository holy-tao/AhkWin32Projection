#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authorization.AppCapabilityAccess
 * @version WindowsRuntime 1.4
 */
class IAppCapability2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCapability2
     * @type {Guid}
     */
    static IID => Guid("{11c7ccb6-c74f-50a3-b960-88008767d939}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayMessage", "put_DisplayMessage"]

    /**
     * @type {HSTRING} 
     */
    DisplayMessage {
        get => this.get_DisplayMessage()
        set => this.put_DisplayMessage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMessage() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayMessage(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
