#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PushNotificationChannel.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class IPushNotificationChannelManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPushNotificationChannelManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{8baf9b65-77a1-4588-bd19-861529a9dcf0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePushNotificationChannelForApplicationAsync", "CreatePushNotificationChannelForApplicationAsyncWithId", "CreatePushNotificationChannelForSecondaryTileAsync"]

    /**
     * 
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     */
    CreatePushNotificationChannelForApplicationAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PushNotificationChannel, operation)
    }

    /**
     * 
     * @param {HSTRING} applicationId 
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     */
    CreatePushNotificationChannelForApplicationAsyncWithId(applicationId) {
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(7, this, "ptr", applicationId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PushNotificationChannel, operation)
    }

    /**
     * 
     * @param {HSTRING} tileId 
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     */
    CreatePushNotificationChannelForSecondaryTileAsync(tileId) {
        if(tileId is String) {
            pin := HSTRING.Create(tileId)
            tileId := pin.Value
        }
        tileId := tileId is Win32Handle ? NumGet(tileId, "ptr") : tileId

        result := ComCall(8, this, "ptr", tileId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PushNotificationChannel, operation)
    }
}
