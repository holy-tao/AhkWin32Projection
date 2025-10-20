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
     * 
     * @param {Pointer<Integer>} pszChannelName 
     * @param {Integer} channelType 
     * @param {Pointer<IWRdsGraphicsChannel>} ppVirtualChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelmanager-createchannel
     */
    CreateChannel(pszChannelName, channelType, ppVirtualChannel) {
        result := ComCall(3, this, "char*", pszChannelName, "int", channelType, "ptr*", ppVirtualChannel, "HRESULT")
        return result
    }
}
