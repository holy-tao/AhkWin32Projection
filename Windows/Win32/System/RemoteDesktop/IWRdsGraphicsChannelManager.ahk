#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * This interface is used by the RemoteFX graphics services API to create the graphics virtual channels necessary for remoting graphics data.
 * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannelmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsGraphicsChannelManager extends IUnknown{
    /**
     * The interface identifier for IWRdsGraphicsChannelManager
     * @type {Guid}
     */
    static IID => Guid("{0fd57159-e83e-476a-a8b9-4a7976e71e18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pszChannelName 
     * @param {Integer} channelType 
     * @param {Pointer<IWRdsGraphicsChannel>} ppVirtualChannel 
     * @returns {HRESULT} 
     */
    CreateChannel(pszChannelName, channelType, ppVirtualChannel) {
        result := ComCall(3, this, "char*", pszChannelName, "int", channelType, "ptr", ppVirtualChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
