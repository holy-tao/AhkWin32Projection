#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ControlChannelTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IControlChannelTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlChannelTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{da4b7cf0-8d71-446f-88c3-b95184a2d6cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateControlChannelTrigger", "CreateControlChannelTriggerEx"]

    /**
     * 
     * @param {HSTRING} channelId 
     * @param {Integer} serverKeepAliveIntervalInMinutes 
     * @returns {ControlChannelTrigger} 
     */
    CreateControlChannelTrigger(channelId, serverKeepAliveIntervalInMinutes) {
        if(channelId is String) {
            pin := HSTRING.Create(channelId)
            channelId := pin.Value
        }
        channelId := channelId is Win32Handle ? NumGet(channelId, "ptr") : channelId

        result := ComCall(6, this, "ptr", channelId, "uint", serverKeepAliveIntervalInMinutes, "ptr*", &notificationChannel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ControlChannelTrigger(notificationChannel)
    }

    /**
     * 
     * @param {HSTRING} channelId 
     * @param {Integer} serverKeepAliveIntervalInMinutes 
     * @param {Integer} resourceRequestType 
     * @returns {ControlChannelTrigger} 
     */
    CreateControlChannelTriggerEx(channelId, serverKeepAliveIntervalInMinutes, resourceRequestType) {
        if(channelId is String) {
            pin := HSTRING.Create(channelId)
            channelId := pin.Value
        }
        channelId := channelId is Win32Handle ? NumGet(channelId, "ptr") : channelId

        result := ComCall(7, this, "ptr", channelId, "uint", serverKeepAliveIntervalInMinutes, "int", resourceRequestType, "ptr*", &notificationChannel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ControlChannelTrigger(notificationChannel)
    }
}
