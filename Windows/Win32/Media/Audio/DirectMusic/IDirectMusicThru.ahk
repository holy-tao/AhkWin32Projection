#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicThru extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusicThru
     * @type {Guid}
     */
    static IID => Guid("{ced153e7-3606-11d2-b9f9-0000f875ac12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ThruChannel"]

    /**
     * 
     * @param {Integer} dwSourceChannelGroup 
     * @param {Integer} dwSourceChannel 
     * @param {Integer} dwDestinationChannelGroup 
     * @param {Integer} dwDestinationChannel 
     * @param {IDirectMusicPort} pDestinationPort 
     * @returns {HRESULT} 
     */
    ThruChannel(dwSourceChannelGroup, dwSourceChannel, dwDestinationChannelGroup, dwDestinationChannel, pDestinationPort) {
        result := ComCall(3, this, "uint", dwSourceChannelGroup, "uint", dwSourceChannel, "uint", dwDestinationChannelGroup, "uint", dwDestinationChannel, "ptr", pDestinationPort, "HRESULT")
        return result
    }
}
