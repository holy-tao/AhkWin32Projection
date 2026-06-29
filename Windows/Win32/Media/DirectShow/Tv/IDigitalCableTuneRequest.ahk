#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IATSCChannelTuneRequest.ahk" { IATSCChannelTuneRequest }

/**
 * The IDigitalCableTuneRequest interface provides methods for tuning to a channel in a digital cable network.
 * @remarks
 * This interface provides three ways to specify the program for the tune request:
 * 
 * <ul>
 * <li>Virtual channel number (VCN). To set the VCN, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ichanneltunerequest-put_channel">IChannelTuneRequest::put_Channel</a>. (This interface inherits <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ichanneltunerequest">IChannelTuneRequest</a> through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-iatscchanneltunerequest">IATSCChannelTuneRequest</a> interface.)</li>
 * <li>Major channel and minor channel. These are used when an ATSC broadcast is transmitted over cable without remultiplexing the streams. To set the major and minor channels, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-idigitalcabletunerequest-put_majorchannel">IDigitalCableTuneRequest::put_MajorChannel</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iatscchanneltunerequest-put_minorchannel">IATSCChannelTuneRequest::put_MinorChannel</a>, respectively.</li>
 * <li>Source identifier. The source identifier is mapped to a physical channel in the virtual channel table. To set the source identifier, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-idigitalcabletunerequest-put_sourceid">IDigitalCableTuneRequest::put_SourceID</a>.</li>
 * </ul>
 * Only one of these settings should be used in any one tune request. Set the other values equal to BDA_UNDEFINED_CHANNEL (-1). Also, if the physical channel is set in the locator, the physical channel overrides any of these values.
 * 
 * Note that the base channel number from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ichanneltunerequest">IChannelTuneRequest</a> has a different meaning when it is used in this interface than it does in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-iatscchanneltunerequest">IATSCChannelTuneRequest</a> interface. In this interface, the base channel number is the VCN, not the major channel.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDigitalCableTuneRequest)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idigitalcabletunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDigitalCableTuneRequest extends IATSCChannelTuneRequest {
    /**
     * The interface identifier for IDigitalCableTuneRequest
     * @type {Guid}
     */
    static IID := Guid("{bad7753b-6b37-4810-ae57-3ce0c4a9e6cb}")

    /**
     * The class identifier for DigitalCableTuneRequest
     * @type {Guid}
     */
    static CLSID := Guid("{26ec0b63-aa90-458a-8df4-5659f2c8a18a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDigitalCableTuneRequest interfaces
    */
    struct Vtbl extends IATSCChannelTuneRequest.Vtbl {
        get_MajorChannel : IntPtr
        put_MajorChannel : IntPtr
        get_SourceID     : IntPtr
        put_SourceID     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDigitalCableTuneRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MajorChannel {
        get => this.get_MajorChannel()
        set => this.put_MajorChannel(value)
    }

    /**
     * @type {Integer} 
     */
    SourceID {
        get => this.get_SourceID()
        set => this.put_SourceID(value)
    }

    /**
     * The get_MajorChannel method retrieves the major channel number.
     * @returns {Integer} Receives the major channel number. If the value received is BDA_UNDEFINED_CHANNEL, the major channel number is not used.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletunerequest-get_majorchannel
     */
    get_MajorChannel() {
        result := ComCall(16, this, "int*", &pMajorChannel := 0, "HRESULT")
        return pMajorChannel
    }

    /**
     * The put_MajorChannel method sets the major channel number.
     * @param {Integer} MajorChannel Specifies the major channel number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletunerequest-put_majorchannel
     */
    put_MajorChannel(MajorChannel) {
        result := ComCall(17, this, "int", MajorChannel, "HRESULT")
        return result
    }

    /**
     * The get_SourceID method retrieves the source identifier, which maps to a physical channel.
     * @returns {Integer} Receives the source identifier. If the value received is BDA_UNDEFINED_CHANNEL, the source identifier is not used.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletunerequest-get_sourceid
     */
    get_SourceID() {
        result := ComCall(18, this, "int*", &pSourceID := 0, "HRESULT")
        return pSourceID
    }

    /**
     * The put_SourceID method sets the source identifier, which maps to a physical channel.
     * @param {Integer} SourceID Specifies the source identifier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletunerequest-put_sourceid
     */
    put_SourceID(SourceID) {
        result := ComCall(19, this, "int", SourceID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDigitalCableTuneRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MajorChannel := CallbackCreate(GetMethod(implObj, "get_MajorChannel"), flags, 2)
        this.vtbl.put_MajorChannel := CallbackCreate(GetMethod(implObj, "put_MajorChannel"), flags, 2)
        this.vtbl.get_SourceID := CallbackCreate(GetMethod(implObj, "get_SourceID"), flags, 2)
        this.vtbl.put_SourceID := CallbackCreate(GetMethod(implObj, "put_SourceID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MajorChannel)
        CallbackFree(this.vtbl.put_MajorChannel)
        CallbackFree(this.vtbl.get_SourceID)
        CallbackFree(this.vtbl.put_SourceID)
    }
}
