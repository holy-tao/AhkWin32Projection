#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IATSCChannelTuneRequest.ahk

/**
 * The IDigitalCableTuneRequest interface provides methods for tuning to a channel in a digital cable network.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idigitalcabletunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDigitalCableTuneRequest extends IATSCChannelTuneRequest{
    /**
     * The interface identifier for IDigitalCableTuneRequest
     * @type {Guid}
     */
    static IID => Guid("{bad7753b-6b37-4810-ae57-3ce0c4a9e6cb}")

    /**
     * The class identifier for DigitalCableTuneRequest
     * @type {Guid}
     */
    static CLSID => Guid("{26ec0b63-aa90-458a-8df4-5659f2c8a18a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * 
     * @param {Pointer<Int32>} pMajorChannel 
     * @returns {HRESULT} 
     */
    get_MajorChannel(pMajorChannel) {
        result := ComCall(16, this, "int*", pMajorChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MajorChannel 
     * @returns {HRESULT} 
     */
    put_MajorChannel(MajorChannel) {
        result := ComCall(17, this, "int", MajorChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSourceID 
     * @returns {HRESULT} 
     */
    get_SourceID(pSourceID) {
        result := ComCall(18, this, "int*", pSourceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SourceID 
     * @returns {HRESULT} 
     */
    put_SourceID(SourceID) {
        result := ComCall(19, this, "int", SourceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
