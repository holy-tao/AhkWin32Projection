#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuneRequest.ahk

/**
 * The IChannelTuneRequest interface is implemented on tuning request objects that support channel numbers, including analog TV and ATSC.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IChannelTuneRequest)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ichanneltunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IChannelTuneRequest extends ITuneRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChannelTuneRequest
     * @type {Guid}
     */
    static IID => Guid("{0369b4e0-45b6-11d3-b650-00c04f79498e}")

    /**
     * The class identifier for ChannelTuneRequest
     * @type {Guid}
     */
    static CLSID => Guid("{0369b4e5-45b6-11d3-b650-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Channel", "put_Channel"]

    /**
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
        set => this.put_Channel(value)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ichanneltunerequest-get_channel
     */
    get_Channel() {
        result := ComCall(12, this, "int*", &Channel := 0, "HRESULT")
        return Channel
    }

    /**
     * 
     * @param {Integer} Channel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ichanneltunerequest-put_channel
     */
    put_Channel(Channel) {
        result := ComCall(13, this, "int", Channel, "HRESULT")
        return result
    }
}
