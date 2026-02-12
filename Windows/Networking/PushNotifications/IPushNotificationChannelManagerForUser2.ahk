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
class IPushNotificationChannelManagerForUser2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPushNotificationChannelManagerForUser2
     * @type {Guid}
     */
    static IID => Guid("{c38b066a-7cc1-4dac-87fd-be6e920414a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsync", "CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsyncWithId"]

    /**
     * 
     * @param {IBuffer} appServerKey 
     * @param {HSTRING} channelId 
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     */
    CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsync(appServerKey, channelId) {
        if(channelId is String) {
            pin := HSTRING.Create(channelId)
            channelId := pin.Value
        }
        channelId := channelId is Win32Handle ? NumGet(channelId, "ptr") : channelId

        result := ComCall(6, this, "ptr", appServerKey, "ptr", channelId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PushNotificationChannel, operation)
    }

    /**
     * 
     * @param {IBuffer} appServerKey 
     * @param {HSTRING} channelId 
     * @param {HSTRING} appId 
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     */
    CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsyncWithId(appServerKey, channelId, appId) {
        if(channelId is String) {
            pin := HSTRING.Create(channelId)
            channelId := pin.Value
        }
        channelId := channelId is Win32Handle ? NumGet(channelId, "ptr") : channelId
        if(appId is String) {
            pin := HSTRING.Create(appId)
            appId := pin.Value
        }
        appId := appId is Win32Handle ? NumGet(appId, "ptr") : appId

        result := ComCall(7, this, "ptr", appServerKey, "ptr", channelId, "ptr", appId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PushNotificationChannel, operation)
    }
}
