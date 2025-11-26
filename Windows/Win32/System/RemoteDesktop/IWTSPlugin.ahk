#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allows for the Remote Desktop Connection (RDC) client plug-in to be loaded by the Remote Desktop Connection (RDC) client.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtsplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSPlugin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSPlugin
     * @type {Guid}
     */
    static IID => Guid("{a1230201-1439-4e62-a414-190d0ac3d40e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Connected", "Disconnected", "Terminated"]

    /**
     * Used for the first call that is made from the client to the plug-in.
     * @param {IWTSVirtualChannelManager} pChannelMgr Passed instance to the channel manager (<a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannelmanager">IWTSVirtualChannelManager</a>) for the client.
     * @returns {HRESULT} Returns <b>S_OK</b> if the call completes successfully. If the call fails, the plug-in will be released by the Remote Desktop Connection (RDC) client.
     * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nf-tsvirtualchannels-iwtsplugin-initialize
     */
    Initialize(pChannelMgr) {
        result := ComCall(3, this, "ptr", pChannelMgr, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in that the Remote Desktop Connection (RDC) client has successfully connected to the Remote Desktop Session Host (RD Session Host) server.
     * @returns {HRESULT} Returns <b>S_OK</b> if the call completes successfully. Returns <b>E_FAIL</b> if the call fails, but the plug-in will continue to work.
     * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nf-tsvirtualchannels-iwtsplugin-connected
     */
    Connected() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in that the Remote Desktop Connection (RDC) client has disconnected from the Remote Desktop Session Host (RD Session Host) server.
     * @param {Integer} dwDisconnectCode Code that identifies the disconnect reason. For the possible codes, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/imstscaxevents-ondisconnected">IMsTscAxEvents::OnDisconnected</a>.
     * @returns {HRESULT} Returns <b>S_OK</b> if the call completes successfully. Results in no action if the call fails.
     * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nf-tsvirtualchannels-iwtsplugin-disconnected
     */
    Disconnected(dwDisconnectCode) {
        result := ComCall(5, this, "uint", dwDisconnectCode, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in that the Remote Desktop Connection (RDC) client has terminated.
     * @returns {HRESULT} Returns <b>S_OK</b> if the call completes successfully. Results in no action if the call fails.
     * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nf-tsvirtualchannels-iwtsplugin-terminated
     */
    Terminated() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
