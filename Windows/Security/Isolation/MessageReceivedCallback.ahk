#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * **Deprecated.** Callback function that will be invoked when a message is sent from the Isolated Windows Environment using [PostMessageToReceiver](isolatedwindowshostmessenger_postmessagetoreceiver_901016500.md).
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.messagereceivedcallback
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class MessageReceivedCallback extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for MessageReceivedCallback
     * @type {Guid}
     */
    static IID => Guid("{f5b4c8ff-1d9d-4995-9fea-4d15257c0757}")

    /**
     * The class identifier for MessageReceivedCallback
     * @type {Guid}
     */
    static CLSID => Guid("{f5b4c8ff-1d9d-4995-9fea-4d15257c0757}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Guid} receiverId 
     * @param {IVectorView<IInspectable>} message 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(receiverId, message) {
        result := ComCall(3, this, "ptr", receiverId, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
