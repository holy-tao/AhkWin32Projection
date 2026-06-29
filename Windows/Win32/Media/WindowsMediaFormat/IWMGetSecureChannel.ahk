#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWMSecureChannel.ahk" { IWMSecureChannel }

/**
 * The IWMGetSecureChannel interface is used by one communication party to get the other party's IWMSecureChannel interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nn-wmsecure-iwmgetsecurechannel
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMGetSecureChannel extends IUnknown {
    /**
     * The interface identifier for IWMGetSecureChannel
     * @type {Guid}
     */
    static IID := Guid("{94bc0598-c3d2-11d3-bedf-00c04f612986}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMGetSecureChannel interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPeerSecureChannelInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMGetSecureChannel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPeerSecureChannelInterface method gets the IWMSecureChannel interface from the other communication party.
     * @returns {IWMSecureChannel} An address of a pointer to the other communication party's <a href="https://docs.microsoft.com/windows/desktop/api/wmsecure/nn-wmsecure-iwmsecurechannel">IWMSecureChannel</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmgetsecurechannel-getpeersecurechannelinterface
     */
    GetPeerSecureChannelInterface() {
        result := ComCall(3, this, "ptr*", &ppPeer := 0, "HRESULT")
        return IWMSecureChannel(ppPeer)
    }

    Query(iid) {
        if (IWMGetSecureChannel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPeerSecureChannelInterface := CallbackCreate(GetMethod(implObj, "GetPeerSecureChannelInterface"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPeerSecureChannelInterface)
    }
}
