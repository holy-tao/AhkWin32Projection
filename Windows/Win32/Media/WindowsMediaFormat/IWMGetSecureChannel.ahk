#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMGetSecureChannel interface is used by one communication party to get the other party's IWMSecureChannel interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nn-wmsecure-iwmgetsecurechannel
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMGetSecureChannel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMGetSecureChannel
     * @type {Guid}
     */
    static IID => Guid("{94bc0598-c3d2-11d3-bedf-00c04f612986}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPeerSecureChannelInterface"]

    /**
     * 
     * @param {Pointer<IWMSecureChannel>} ppPeer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmgetsecurechannel-getpeersecurechannelinterface
     */
    GetPeerSecureChannelInterface(ppPeer) {
        result := ComCall(3, this, "ptr*", ppPeer, "HRESULT")
        return result
    }
}
