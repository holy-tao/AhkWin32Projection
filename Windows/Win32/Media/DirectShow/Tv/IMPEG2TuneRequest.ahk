#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuneRequest.ahk" { ITuneRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IMPEG2TuneRequest interface represents a tune request for a basic MPEG-2 transport stream containing the minimal tables.Use the IMPEG2TuneRequestFactory::CreateTuneRequest method to obtain this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2TuneRequest)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-impeg2tunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMPEG2TuneRequest extends ITuneRequest {
    /**
     * The interface identifier for IMPEG2TuneRequest
     * @type {Guid}
     */
    static IID := Guid("{eb7d987f-8a01-42ad-b8ae-574deee44d1a}")

    /**
     * The class identifier for MPEG2TuneRequest
     * @type {Guid}
     */
    static CLSID := Guid("{0955ac62-bf2e-4cba-a2b9-a63f772d46cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMPEG2TuneRequest interfaces
    */
    struct Vtbl extends ITuneRequest.Vtbl {
        get_TSID   : IntPtr
        put_TSID   : IntPtr
        get_ProgNo : IntPtr
        put_ProgNo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMPEG2TuneRequest.Vtbl()
        }
        super.__New(implObj, flags)
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
    ProgNo {
        get => this.get_ProgNo()
        set => this.put_ProgNo(value)
    }

    /**
     * The get_TSID method retrieves the transport stream ID.
     * @returns {Integer} Pointer to a variable that receives the transport stream ID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2tunerequest-get_tsid
     */
    get_TSID() {
        result := ComCall(12, this, "int*", &TSID := 0, "HRESULT")
        return TSID
    }

    /**
     * The put_TSID method sets the transport stream ID.
     * @param {Integer} TSID Specifies the transport stream ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2tunerequest-put_tsid
     */
    put_TSID(TSID) {
        result := ComCall(13, this, "int", TSID, "HRESULT")
        return result
    }

    /**
     * The get_ProgNo method retrieves the program number ID.
     * @returns {Integer} Pointer to a variable that receives the program number ID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2tunerequest-get_progno
     */
    get_ProgNo() {
        result := ComCall(14, this, "int*", &ProgNo := 0, "HRESULT")
        return ProgNo
    }

    /**
     * The put_ProgNo method sets the program number ID.
     * @param {Integer} ProgNo Specifies the program number ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2tunerequest-put_progno
     */
    put_ProgNo(ProgNo) {
        result := ComCall(15, this, "int", ProgNo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMPEG2TuneRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TSID := CallbackCreate(GetMethod(implObj, "get_TSID"), flags, 2)
        this.vtbl.put_TSID := CallbackCreate(GetMethod(implObj, "put_TSID"), flags, 2)
        this.vtbl.get_ProgNo := CallbackCreate(GetMethod(implObj, "get_ProgNo"), flags, 2)
        this.vtbl.put_ProgNo := CallbackCreate(GetMethod(implObj, "put_ProgNo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TSID)
        CallbackFree(this.vtbl.put_TSID)
        CallbackFree(this.vtbl.get_ProgNo)
        CallbackFree(this.vtbl.put_ProgNo)
    }
}
