#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Describes the method that will handle the event that's fired when a message that has been subscribed to has been received.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.messagereceivedhandler
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class MessageReceivedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for MessageReceivedHandler
     * @type {Guid}
     */
    static IID => Guid("{efab0782-f6e2-4675-a045-d8e320c24808}")

    /**
     * The class identifier for MessageReceivedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{efab0782-f6e2-4675-a045-d8e320c24808}")

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
     * @param {ProximityDevice} sender 
     * @param {ProximityMessage} message 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, message) {
        result := ComCall(3, this, "ptr", sender, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
