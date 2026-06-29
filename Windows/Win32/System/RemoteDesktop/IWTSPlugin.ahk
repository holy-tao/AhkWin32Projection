#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWTSVirtualChannelManager.ahk" { IWTSVirtualChannelManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows for the Remote Desktop Connection (RDC) client plug-in to be loaded by the Remote Desktop Connection (RDC) client.
 * @remarks
 * The **IWTSPlugin** interface is implemented by %System32%\webauthn.dll to enable the Remote Desktop WebAuthn redirection functionality. Get an instance of this interface by calling [VirtualChannelGetInstance]( ../termserv/virtualchannelgetinstance.md), which is also provided by webauthn.dll.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSPlugin extends IUnknown {
    /**
     * The interface identifier for IWTSPlugin
     * @type {Guid}
     */
    static IID := Guid("{a1230201-1439-4e62-a414-190d0ac3d40e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSPlugin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize   : IntPtr
        Connected    : IntPtr
        Disconnected : IntPtr
        Terminated   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used for the first call that is made from the client to the plug-in.
     * @param {IWTSVirtualChannelManager} pChannelMgr Passed instance to the channel manager (<a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannelmanager">IWTSVirtualChannelManager</a>) for the client.
     * @returns {HRESULT} Returns <b>S_OK</b> if the call completes successfully. If the call fails, the plug-in will be released by the Remote Desktop Connection (RDC) client.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsplugin-initialize
     */
    Initialize(pChannelMgr) {
        result := ComCall(3, this, "ptr", pChannelMgr, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in that the Remote Desktop Connection (RDC) client has successfully connected to the Remote Desktop Session Host (RD Session Host) server.
     * @returns {HRESULT} Returns <b>S_OK</b> if the call completes successfully. Returns <b>E_FAIL</b> if the call fails, but the plug-in will continue to work.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsplugin-connected
     */
    Connected() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in that the Remote Desktop Connection (RDC) client has disconnected from the Remote Desktop Session Host (RD Session Host) server.
     * @param {Integer} dwDisconnectCode Code that identifies the disconnect reason. For the possible codes, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/imstscaxevents-ondisconnected">IMsTscAxEvents::OnDisconnected</a>.
     * @returns {HRESULT} Returns <b>S_OK</b> if the call completes successfully. Results in no action if the call fails.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsplugin-disconnected
     */
    Disconnected(dwDisconnectCode) {
        result := ComCall(5, this, "uint", dwDisconnectCode, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in that the Remote Desktop Connection (RDC) client has terminated.
     * @returns {HRESULT} Returns <b>S_OK</b> if the call completes successfully. Results in no action if the call fails.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsplugin-terminated
     */
    Terminated() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSPlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.Connected := CallbackCreate(GetMethod(implObj, "Connected"), flags, 1)
        this.vtbl.Disconnected := CallbackCreate(GetMethod(implObj, "Disconnected"), flags, 2)
        this.vtbl.Terminated := CallbackCreate(GetMethod(implObj, "Terminated"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Connected)
        CallbackFree(this.vtbl.Disconnected)
        CallbackFree(this.vtbl.Terminated)
    }
}
