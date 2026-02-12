#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ISmsMessage.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsDeviceMessageStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsDeviceMessageStore
     * @type {Guid}
     */
    static IID => Guid("{9889f253-f188-4427-8d54-ce0c2423c5c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteMessageAsync", "DeleteMessagesAsync", "GetMessageAsync", "GetMessagesAsync", "get_MaxMessages"]

    /**
     * @type {Integer} 
     */
    MaxMessages {
        get => this.get_MaxMessages()
    }

    /**
     * 
     * @param {Integer} messageId 
     * @returns {IAsyncAction} 
     */
    DeleteMessageAsync(messageId) {
        result := ComCall(6, this, "uint", messageId, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {Integer} messageFilter 
     * @returns {IAsyncAction} 
     */
    DeleteMessagesAsync(messageFilter) {
        result := ComCall(7, this, "int", messageFilter, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {Integer} messageId 
     * @returns {IAsyncOperation<ISmsMessage>} 
     */
    GetMessageAsync(messageId) {
        result := ComCall(8, this, "uint", messageId, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ISmsMessage, asyncInfo)
    }

    /**
     * 
     * @param {Integer} messageFilter 
     * @returns {IAsyncOperationWithProgress<IVectorView<ISmsMessage>, Integer>} 
     */
    GetMessagesAsync(messageFilter) {
        result := ComCall(9, this, "int", messageFilter, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(IVectorView.Call.Bind(IVectorView, ISmsMessage), (ptr) => IPropertyValue(ptr).GetInt32(), asyncInfo)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxMessages() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
