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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TSID", "put_TSID", "get_ProgNo", "put_ProgNo"]

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
    ProgNo {
        get => this.get_ProgNo()
        set => this.put_ProgNo(value)
    }

    /**
     * The get_TSID method retrieves the transport stream ID.
     * @returns {Integer} Pointer to a variable that receives the transport stream ID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-impeg2tunerequest-get_tsid
     */
    get_TSID() {
        result := ComCall(12, this, "int*", &TSID := 0, "HRESULT")
        return TSID
    }

    /**
     * The put_TSID method sets the transport stream ID.
     * @param {Integer} TSID Specifies the transport stream ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-impeg2tunerequest-put_tsid
     */
    put_TSID(TSID) {
        result := ComCall(13, this, "int", TSID, "HRESULT")
        return result
    }

    /**
     * The get_ProgNo method retrieves the program number ID.
     * @returns {Integer} Pointer to a variable that receives the program number ID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-impeg2tunerequest-get_progno
     */
    get_ProgNo() {
        result := ComCall(14, this, "int*", &ProgNo := 0, "HRESULT")
        return ProgNo
    }

    /**
     * The put_ProgNo method sets the program number ID.
     * @param {Integer} ProgNo Specifies the program number ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-impeg2tunerequest-put_progno
     */
    put_ProgNo(ProgNo) {
        result := ComCall(15, this, "int", ProgNo, "HRESULT")
        return result
    }
}
