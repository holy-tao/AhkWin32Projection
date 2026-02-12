#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Describes the method that will handle the event that's fired when a published message has been transmitted.
 * @remarks
 * Messages continue to be published until the [StopPublishingMessage](proximitydevice_stoppublishingmessage_1046474884.md) method is called or the [ProximityDevice](proximitydevice.md) on the publishing computer is released. Messages are delivered to all apps that have subscribed for the same message type.
 * 
 * When using the [PublishMessage](proximitydevice_publishmessage_1881696512.md) method, the only supported message type is one that begins with "Windows.". To publish messages using another message type, such as "WindowsMime." or "NDEF:WriteTag", you must use the [PublishBinaryMessage](proximitydevice_publishbinarymessage_285088637.md) method.
 * 
 * The MessageTransmittedHandler delegate is called each time a message is successfully transmitted to a device, regardless of whether any apps were subscribed to the message on that device.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.messagetransmittedhandler
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class MessageTransmittedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for MessageTransmittedHandler
     * @type {Guid}
     */
    static IID => Guid("{efaa0b4a-f6e2-4d7d-856c-78fc8efc021e}")

    /**
     * The class identifier for MessageTransmittedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{efaa0b4a-f6e2-4d7d-856c-78fc8efc021e}")

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
     * @param {Integer} messageId 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, messageId) {
        result := ComCall(3, this, "ptr", sender, "int64", messageId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
