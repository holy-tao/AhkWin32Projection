#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWTSListener.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Manages all Remote Desktop Connection (RDC) client plug-ins and dynamic virtual channel (DVC) listeners.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannelmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSVirtualChannelManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSVirtualChannelManager
     * @type {Guid}
     */
    static IID => Guid("{a1230205-d6a7-11d8-b9fd-000bdbd1f198}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateListener"]

    /**
     * Returns an instance of a listener object that listens on a specific endpoint.
     * @param {PSTR} pszChannelName The endpoint name on which the listener will listen. This is a string value, the length of which is limited to <b>MAX_PATH</b> number of characters.
     * @param {Integer} uFlags This parameter is reserved and must be set to zero.
     * @param {IWTSListenerCallback} pListenerCallback Returns a listener callback (<a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtslistenercallback">IWTSListenerCallback</a>)  that will receive notifications for incoming connections.
     * @returns {IWTSListener} An instance of the <a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtslistener">IWTSListener</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannelmanager-createlistener
     */
    CreateListener(pszChannelName, uFlags, pListenerCallback) {
        pszChannelName := pszChannelName is String ? StrPtr(pszChannelName) : pszChannelName

        result := ComCall(3, this, "ptr", pszChannelName, "uint", uFlags, "ptr", pListenerCallback, "ptr*", &ppListener := 0, "HRESULT")
        return IWTSListener(ppListener)
    }
}
