#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IRDPSRAPIVirtualChannel.ahk" { IRDPSRAPIVirtualChannel }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CHANNEL_PRIORITY.ahk" { CHANNEL_PRIORITY }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Manages the list of virtual channels.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapivirtualchannelmanager
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIVirtualChannelManager extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIVirtualChannelManager
     * @type {Guid}
     */
    static IID := Guid("{0d11c661-5d0d-4ee4-89df-2166ae1fdfed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIVirtualChannelManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum         : IntPtr
        get_Item             : IntPtr
        CreateVirtualChannel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIVirtualChannelManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * An enumerator interface for the virtual channel collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannelmanager-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * An item in the virtual channel collection.
     * @param {VARIANT} item 
     * @returns {IRDPSRAPIVirtualChannel} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannelmanager-get_item
     */
    get_Item(item) {
        result := ComCall(8, this, VARIANT, item, "ptr*", &pChannel := 0, "HRESULT")
        return IRDPSRAPIVirtualChannel(pChannel)
    }

    /**
     * Creates a virtual channel.
     * @remarks
     * When a virtual channel is created, an RDP virtual channel is bound at the RDP stack layer for each opened channel. For a channel to actually be opened between the client and the server, both the client and the server have to bind the channel. The <i>Priority</i> parameter is used to assign a priority to the packets send on the channel.
     * 
     * The binding between server and client channels is established based on the channel name.
     * @param {BSTR} bstrChannelName Type: <b>BSTR</b>
     * 
     * The name of the channel. The maximum length is 8 characters, including the null-terminating character. Legacy channel names are limited to 32 characters.
     * @param {CHANNEL_PRIORITY} _Priority Type: <b>CHANNEL_PRIORITY</b>
     * @param {Integer} ChannelFlags Type: <b>unsigned long</b>
     * 
     * Flags that determine how data is sent on the channel. This parameter can be 0 or <a href="https://docs.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-channel_flags">CHANNEL_FLAGS_UNCOMPRESSED</a>.
     * @returns {IRDPSRAPIVirtualChannel} Type: <b>IRDPSRAPIVirtualChannel**</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapivirtualchannel">IRDPSRAPIVirtualChannel</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannelmanager-createvirtualchannel
     */
    CreateVirtualChannel(bstrChannelName, _Priority, ChannelFlags) {
        bstrChannelName := bstrChannelName is String ? BSTR.Alloc(bstrChannelName).Value : bstrChannelName

        result := ComCall(9, this, BSTR, bstrChannelName, CHANNEL_PRIORITY, _Priority, "uint", ChannelFlags, "ptr*", &ppChannel := 0, "HRESULT")
        return IRDPSRAPIVirtualChannel(ppChannel)
    }

    Query(iid) {
        if (IRDPSRAPIVirtualChannelManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.CreateVirtualChannel := CallbackCreate(GetMethod(implObj, "CreateVirtualChannel"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.CreateVirtualChannel)
    }
}
