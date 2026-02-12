#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RemoteSystemSessionMessageChannel.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionMessageChannelFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionMessageChannelFactory
     * @type {Guid}
     */
    static IID => Guid("{295e1c4a-bd16-4298-b7ce-415482b0e11d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithReliability"]

    /**
     * Create Extended Stored Procedures
     * @param {RemoteSystemSession} session 
     * @param {HSTRING} channelName 
     * @returns {RemoteSystemSessionMessageChannel} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(session, channelName) {
        if(channelName is String) {
            pin := HSTRING.Create(channelName)
            channelName := pin.Value
        }
        channelName := channelName is Win32Handle ? NumGet(channelName, "ptr") : channelName

        result := ComCall(6, this, "ptr", session, "ptr", channelName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSessionMessageChannel(value)
    }

    /**
     * Create Extended Stored Procedures
     * @param {RemoteSystemSession} session 
     * @param {HSTRING} channelName 
     * @param {Integer} reliability 
     * @returns {RemoteSystemSessionMessageChannel} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    CreateWithReliability(session, channelName, reliability) {
        if(channelName is String) {
            pin := HSTRING.Create(channelName)
            channelName := pin.Value
        }
        channelName := channelName is Win32Handle ? NumGet(channelName, "ptr") : channelName

        result := ComCall(7, this, "ptr", session, "ptr", channelName, "int", reliability, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSessionMessageChannel(value)
    }
}
