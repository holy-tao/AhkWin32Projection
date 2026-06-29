#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuneRequest.ahk" { ITuneRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IChannelTuneRequest interface is implemented on tuning request objects that support channel numbers, including analog TV and ATSC.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IChannelTuneRequest)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ichanneltunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IChannelTuneRequest extends ITuneRequest {
    /**
     * The interface identifier for IChannelTuneRequest
     * @type {Guid}
     */
    static IID := Guid("{0369b4e0-45b6-11d3-b650-00c04f79498e}")

    /**
     * The class identifier for ChannelTuneRequest
     * @type {Guid}
     */
    static CLSID := Guid("{0369b4e5-45b6-11d3-b650-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IChannelTuneRequest interfaces
    */
    struct Vtbl extends ITuneRequest.Vtbl {
        get_Channel : IntPtr
        put_Channel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IChannelTuneRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
        set => this.put_Channel(value)
    }

    /**
     * The get_Channel method gets the channel to be tuned.
     * @returns {Integer} Pointer to a variable of type <b>long</b> that receives the current channel.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ichanneltunerequest-get_channel
     */
    get_Channel() {
        result := ComCall(12, this, "int*", &Channel := 0, "HRESULT")
        return Channel
    }

    /**
     * The put_Channel method sets the channel to be tuned.
     * @remarks
     * If the value specified for <i>Channel</i> is less than the minimum channel set for the tuning space, it will "wrap around" to the maximum channel value. Likewise, if the value specified for <i>Channel</i> is greater than the maximum channel set for the tuning space, it will "wrap around" to the minimum channel value.
     * @param {Integer} Channel Variable of type <b>long</b> that specifies the channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM IErrorInfo interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ichanneltunerequest-put_channel
     */
    put_Channel(Channel) {
        result := ComCall(13, this, "int", Channel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IChannelTuneRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Channel := CallbackCreate(GetMethod(implObj, "get_Channel"), flags, 2)
        this.vtbl.put_Channel := CallbackCreate(GetMethod(implObj, "put_Channel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Channel)
        CallbackFree(this.vtbl.put_Channel)
    }
}
