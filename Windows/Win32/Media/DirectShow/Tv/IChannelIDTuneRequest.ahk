#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITuneRequest.ahk

/**
 * Implements methods that support channel requests using a string identifier.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IChannelIDTuneRequest)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ichannelidtunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IChannelIDTuneRequest extends ITuneRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChannelIDTuneRequest
     * @type {Guid}
     */
    static IID => Guid("{156eff60-86f4-4e28-89fc-109799fd57ee}")

    /**
     * The class identifier for ChannelIDTuneRequest
     * @type {Guid}
     */
    static CLSID => Guid("{3a9428a7-31a4-45e9-9efb-e055bf7bb3db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChannelID", "put_ChannelID"]

    /**
     * @type {BSTR} 
     */
    ChannelID {
        get => this.get_ChannelID()
        set => this.put_ChannelID(value)
    }

    /**
     * Provider-defined channel identifier in string format.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ichannelidtunerequest-get_channelid
     */
    get_ChannelID() {
        ChannelID := BSTR()
        result := ComCall(12, this, "ptr", ChannelID, "HRESULT")
        return ChannelID
    }

    /**
     * Provider-defined channel identifier in string format.
     * @param {BSTR} ChannelID 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ichannelidtunerequest-put_channelid
     */
    put_ChannelID(ChannelID) {
        ChannelID := ChannelID is String ? BSTR.Alloc(ChannelID).Value : ChannelID

        result := ComCall(13, this, "ptr", ChannelID, "HRESULT")
        return result
    }
}
