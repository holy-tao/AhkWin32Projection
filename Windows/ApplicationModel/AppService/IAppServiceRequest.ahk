#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class IAppServiceRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppServiceRequest
     * @type {Guid}
     */
    static IID => Guid("{20e58d9d-18de-4b01-80ba-90a76204e3c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Message", "SendResponseAsync"]

    /**
     * @type {ValueSet} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Message() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }

    /**
     * 
     * @param {ValueSet} message 
     * @returns {IAsyncOperation<Integer>} 
     */
    SendResponseAsync(message) {
        result := ComCall(7, this, "ptr", message, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
