#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IChannelTuneRequest.ahk

/**
 * The IATSCChannelTuneRequest interface provides methods for tuning to a channel in an ATSC network. The ATSCChannelTuneRequest object implements this interface.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iatscchanneltunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IATSCChannelTuneRequest extends IChannelTuneRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IATSCChannelTuneRequest
     * @type {Guid}
     */
    static IID => Guid("{0369b4e1-45b6-11d3-b650-00c04f79498e}")

    /**
     * The class identifier for ATSCChannelTuneRequest
     * @type {Guid}
     */
    static CLSID => Guid("{0369b4e6-45b6-11d3-b650-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinorChannel", "put_MinorChannel"]

    /**
     * 
     * @param {Pointer<Integer>} MinorChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatscchanneltunerequest-get_minorchannel
     */
    get_MinorChannel(MinorChannel) {
        result := ComCall(14, this, "int*", MinorChannel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MinorChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatscchanneltunerequest-put_minorchannel
     */
    put_MinorChannel(MinorChannel) {
        result := ComCall(15, this, "int", MinorChannel, "HRESULT")
        return result
    }
}
