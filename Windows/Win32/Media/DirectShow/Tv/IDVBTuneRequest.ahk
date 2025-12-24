#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuneRequest.ahk

/**
 * The IDVBTuneRequest interface is implemented on the DVBTuneRequest object.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTuneRequest)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idvbtunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVBTuneRequest extends ITuneRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDVBTuneRequest
     * @type {Guid}
     */
    static IID => Guid("{0d6f567e-a636-42bb-83ba-ce4c1704afa2}")

    /**
     * The class identifier for DVBTuneRequest
     * @type {Guid}
     */
    static CLSID => Guid("{15d6504a-5494-499c-886c-973c9e53b9f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ONID", "put_ONID", "get_TSID", "put_TSID", "get_SID", "put_SID"]

    /**
     * @type {Integer} 
     */
    ONID {
        get => this.get_ONID()
        set => this.put_ONID(value)
    }

    /**
     * @type {Integer} 
     */
    TSID {
        get => this.get_TSID()
        set => this.put_TSID(value)
    }

    /**
     * @type {Integer} 
     */
    SID {
        get => this.get_SID()
        set => this.put_SID(value)
    }

    /**
     * The get_ONID method retrieves the original network ID.
     * @returns {Integer} Receives the original network ID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtunerequest-get_onid
     */
    get_ONID() {
        result := ComCall(12, this, "int*", &ONID := 0, "HRESULT")
        return ONID
    }

    /**
     * The put_ONID method sets the original network ID.
     * @param {Integer} ONID The original network ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtunerequest-put_onid
     */
    put_ONID(ONID) {
        result := ComCall(13, this, "int", ONID, "HRESULT")
        return result
    }

    /**
     * The get_TSID method retrieves the transport stream ID.
     * @returns {Integer} Receives the transport stream ID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtunerequest-get_tsid
     */
    get_TSID() {
        result := ComCall(14, this, "int*", &TSID := 0, "HRESULT")
        return TSID
    }

    /**
     * The put_TSID method sets the transport stream ID.
     * @param {Integer} TSID The transport stream ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtunerequest-put_tsid
     */
    put_TSID(TSID) {
        result := ComCall(15, this, "int", TSID, "HRESULT")
        return result
    }

    /**
     * The get_SID method retrieves the service ID for the network.
     * @returns {Integer} Receives the service ID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtunerequest-get_sid
     */
    get_SID() {
        result := ComCall(16, this, "int*", &SID := 0, "HRESULT")
        return SID
    }

    /**
     * The put_SID method sets the service ID.
     * @param {Integer} SID The service ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtunerequest-put_sid
     */
    put_SID(SID) {
        result := ComCall(17, this, "int", SID, "HRESULT")
        return result
    }
}
