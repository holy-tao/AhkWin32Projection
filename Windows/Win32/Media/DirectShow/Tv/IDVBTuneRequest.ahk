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
     * 
     * @param {Pointer<Int32>} ONID 
     * @returns {HRESULT} 
     */
    get_ONID(ONID) {
        result := ComCall(12, this, "int*", ONID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ONID 
     * @returns {HRESULT} 
     */
    put_ONID(ONID) {
        result := ComCall(13, this, "int", ONID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} TSID 
     * @returns {HRESULT} 
     */
    get_TSID(TSID) {
        result := ComCall(14, this, "int*", TSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TSID 
     * @returns {HRESULT} 
     */
    put_TSID(TSID) {
        result := ComCall(15, this, "int", TSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} SID 
     * @returns {HRESULT} 
     */
    get_SID(SID) {
        result := ComCall(16, this, "int*", SID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SID 
     * @returns {HRESULT} 
     */
    put_SID(SID) {
        result := ComCall(17, this, "int", SID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
