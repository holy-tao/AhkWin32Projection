#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWRdsGraphicsChannel.ahk
#Include ..\Com\IUnknown.ahk

/**
 * This interface is used by the RemoteFX graphics services API to create the graphics virtual channels necessary for remoting graphics data.
 * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannelmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsGraphicsChannelManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateChannel"]

    /**
     * Used to create a graphics virtual channel.
     * @param {Pointer<Integer>} pszChannelName Type: <b>const char*</b>
     * @param {Integer} channelType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/wrdsgraphicschannels/ne-wrdsgraphicschannels-wrdsgraphicschanneltype">WRdsGraphicsChannelType</a></b>
     * 
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/wrdsgraphicschannels/ne-wrdsgraphicschannels-wrdsgraphicschanneltype">WRdsGraphicsChannelType</a> enumeration that specifies what type of channel to create. If the specified type of channel cannot be created, this method should return a channel object rather than fail.
     * @returns {IWRdsGraphicsChannel} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannel">IWRdsGraphicsChannel</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannel">IWRdsGraphicsChannel</a> interface pointer that receives the channel object.
     * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelmanager-createchannel
     */
    CreateChannel(pszChannelName, channelType) {
        pszChannelNameMarshal := pszChannelName is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pszChannelNameMarshal, pszChannelName, "int", channelType, "ptr*", &ppVirtualChannel := 0, "HRESULT")
        return IWRdsGraphicsChannel(ppVirtualChannel)
    }
}
