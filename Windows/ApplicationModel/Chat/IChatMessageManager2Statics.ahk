#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\ChatMessageTransport.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageManager2Statics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageManager2Statics
     * @type {Guid}
     */
    static IID => Guid("{1d45390f-9f4f-4e35-964e-1b9ca61ac044}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterTransportAsync", "GetTransportAsync"]

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    RegisterTransportAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {HSTRING} transportId 
     * @returns {IAsyncOperation<ChatMessageTransport>} 
     */
    GetTransportAsync(transportId) {
        if(transportId is String) {
            pin := HSTRING.Create(transportId)
            transportId := pin.Value
        }
        transportId := transportId is Win32Handle ? NumGet(transportId, "ptr") : transportId

        result := ComCall(7, this, "ptr", transportId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatMessageTransport, result_)
    }
}
