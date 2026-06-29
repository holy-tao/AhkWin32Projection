#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWTSListenerCallback.ahk" { IWTSListenerCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWTSListener.ahk" { IWTSListener }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Manages all Remote Desktop Connection (RDC) client plug-ins and dynamic virtual channel (DVC) listeners.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannelmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSVirtualChannelManager extends IUnknown {
    /**
     * The interface identifier for IWTSVirtualChannelManager
     * @type {Guid}
     */
    static IID := Guid("{a1230205-d6a7-11d8-b9fd-000bdbd1f198}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSVirtualChannelManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateListener : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSVirtualChannelManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns an instance of a listener object that listens on a specific endpoint.
     * @param {PSTR} pszChannelName The endpoint name on which the listener will listen. This is a string value, the length of which is limited to <b>MAX_PATH</b> number of characters.
     * @param {Integer} uFlags This parameter is reserved and must be set to zero.
     * @param {IWTSListenerCallback} pListenerCallback Returns a listener callback (<a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtslistenercallback">IWTSListenerCallback</a>)  that will receive notifications for incoming connections.
     * @returns {IWTSListener} An instance of the <a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtslistener">IWTSListener</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannelmanager-createlistener
     */
    CreateListener(pszChannelName, uFlags, pListenerCallback) {
        pszChannelName := pszChannelName is String ? StrPtr(pszChannelName) : pszChannelName

        result := ComCall(3, this, "ptr", pszChannelName, "uint", uFlags, "ptr", pListenerCallback, "ptr*", &ppListener := 0, "HRESULT")
        return IWTSListener(ppListener)
    }

    Query(iid) {
        if (IWTSVirtualChannelManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateListener := CallbackCreate(GetMethod(implObj, "CreateListener"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateListener)
    }
}
