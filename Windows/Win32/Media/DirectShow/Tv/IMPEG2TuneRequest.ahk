#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuneRequest.ahk

/**
 * The IMPEG2TuneRequest interface represents a tune request for a basic MPEG-2 transport stream containing the minimal tables.Use the IMPEG2TuneRequestFactory::CreateTuneRequest method to obtain this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2TuneRequest)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-impeg2tunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMPEG2TuneRequest extends ITuneRequest{
    /**
     * The interface identifier for IMPEG2TuneRequest
     * @type {Guid}
     */
    static IID => Guid("{eb7d987f-8a01-42ad-b8ae-574deee44d1a}")

    /**
     * The class identifier for MPEG2TuneRequest
     * @type {Guid}
     */
    static CLSID => Guid("{0955ac62-bf2e-4cba-a2b9-a63f772d46cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<Int32>} TSID 
     * @returns {HRESULT} 
     */
    get_TSID(TSID) {
        result := ComCall(12, this, "int*", TSID, "int")
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
        result := ComCall(13, this, "int", TSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ProgNo 
     * @returns {HRESULT} 
     */
    get_ProgNo(ProgNo) {
        result := ComCall(14, this, "int*", ProgNo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProgNo 
     * @returns {HRESULT} 
     */
    put_ProgNo(ProgNo) {
        result := ComCall(15, this, "int", ProgNo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
