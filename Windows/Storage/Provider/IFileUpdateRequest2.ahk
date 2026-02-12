#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IFileUpdateRequest2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileUpdateRequest2
     * @type {Guid}
     */
    static IID => Guid("{82484648-bdbe-447b-a2ee-7afe6a032a94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserInputNeededMessage", "put_UserInputNeededMessage"]

    /**
     * @type {HSTRING} 
     */
    UserInputNeededMessage {
        get => this.get_UserInputNeededMessage()
        set => this.put_UserInputNeededMessage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserInputNeededMessage() {
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
    put_UserInputNeededMessage(value) {
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
