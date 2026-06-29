#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IChannelTuneRequest.ahk" { IChannelTuneRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IATSCChannelTuneRequest interface provides methods for tuning to a channel in an ATSC network. The ATSCChannelTuneRequest object implements this interface.
 * @remarks
 * ATSC defines a tune request in terms of a <i>major channel</i> and a <i>minor channel</i>. The major channel is mapped to a physical frequency and the minor channel identifies different programs within the same major channel. To access the channel numbers, use the following methods:
 * 
 * <ul>
 * <li>Major channel: <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ichanneltunerequest-get_channel">IChannelTuneRequest::get_Channel</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ichanneltunerequest-put_channel">IChannelTuneRequest::put_Channel</a>
 * </li>
 * </ul>
 * </li>
 * <li>Minor channel: <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iatscchanneltunerequest-get_minorchannel">IATSCChannelTuneRequest::get_MinorChannel</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iatscchanneltunerequest-put_minorchannel">IATSCChannelTuneRequest::put_MinorChannel</a>
 * </li>
 * </ul>
 * </li>
 * </ul>
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IATSCChannelTuneRequest)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iatscchanneltunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IATSCChannelTuneRequest extends IChannelTuneRequest {
    /**
     * The interface identifier for IATSCChannelTuneRequest
     * @type {Guid}
     */
    static IID := Guid("{0369b4e1-45b6-11d3-b650-00c04f79498e}")

    /**
     * The class identifier for ATSCChannelTuneRequest
     * @type {Guid}
     */
    static CLSID := Guid("{0369b4e6-45b6-11d3-b650-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IATSCChannelTuneRequest interfaces
    */
    struct Vtbl extends IChannelTuneRequest.Vtbl {
        get_MinorChannel : IntPtr
        put_MinorChannel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IATSCChannelTuneRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MinorChannel {
        get => this.get_MinorChannel()
        set => this.put_MinorChannel(value)
    }

    /**
     * The get_MinorChannel method gets the current minor channel.
     * @returns {Integer} Receives the current minor channel. If the value received is -1, the tuner should tune to the first valid minor channel it finds.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatscchanneltunerequest-get_minorchannel
     */
    get_MinorChannel() {
        result := ComCall(14, this, "int*", &MinorChannel := 0, "HRESULT")
        return MinorChannel
    }

    /**
     * The put_MinorChannel method sets the minor channel to be tuned.
     * @param {Integer} MinorChannel Specifies the minor channel. If the value is -1, the tuner tunes to the first valid minor channel it finds.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatscchanneltunerequest-put_minorchannel
     */
    put_MinorChannel(MinorChannel) {
        result := ComCall(15, this, "int", MinorChannel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IATSCChannelTuneRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MinorChannel := CallbackCreate(GetMethod(implObj, "get_MinorChannel"), flags, 2)
        this.vtbl.put_MinorChannel := CallbackCreate(GetMethod(implObj, "put_MinorChannel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MinorChannel)
        CallbackFree(this.vtbl.put_MinorChannel)
    }
}
