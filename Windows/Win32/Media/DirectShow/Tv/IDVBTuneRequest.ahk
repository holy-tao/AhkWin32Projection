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
     * 
     * @param {Pointer<Integer>} ONID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-get_onid
     */
    get_ONID(ONID) {
        ONIDMarshal := ONID is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, ONIDMarshal, ONID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ONID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-put_onid
     */
    put_ONID(ONID) {
        result := ComCall(13, this, "int", ONID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} TSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-get_tsid
     */
    get_TSID(TSID) {
        TSIDMarshal := TSID is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, TSIDMarshal, TSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} TSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-put_tsid
     */
    put_TSID(TSID) {
        result := ComCall(15, this, "int", TSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-get_sid
     */
    get_SID(SID) {
        SIDMarshal := SID is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, SIDMarshal, SID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-put_sid
     */
    put_SID(SID) {
        result := ComCall(17, this, "int", SID, "HRESULT")
        return result
    }
}
