#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuneRequest.ahk" { ITuneRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IDVBTuneRequest interface is implemented on the DVBTuneRequest object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTuneRequest)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idvbtunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVBTuneRequest extends ITuneRequest {
    /**
     * The interface identifier for IDVBTuneRequest
     * @type {Guid}
     */
    static IID := Guid("{0d6f567e-a636-42bb-83ba-ce4c1704afa2}")

    /**
     * The class identifier for DVBTuneRequest
     * @type {Guid}
     */
    static CLSID := Guid("{15d6504a-5494-499c-886c-973c9e53b9f1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVBTuneRequest interfaces
    */
    struct Vtbl extends ITuneRequest.Vtbl {
        get_ONID : IntPtr
        put_ONID : IntPtr
        get_TSID : IntPtr
        put_TSID : IntPtr
        get_SID  : IntPtr
        put_SID  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVBTuneRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-get_onid
     */
    get_ONID() {
        result := ComCall(12, this, "int*", &ONID := 0, "HRESULT")
        return ONID
    }

    /**
     * The put_ONID method sets the original network ID.
     * @param {Integer} ONID The original network ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-put_onid
     */
    put_ONID(ONID) {
        result := ComCall(13, this, "int", ONID, "HRESULT")
        return result
    }

    /**
     * The get_TSID method retrieves the transport stream ID.
     * @returns {Integer} Receives the transport stream ID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-get_tsid
     */
    get_TSID() {
        result := ComCall(14, this, "int*", &TSID := 0, "HRESULT")
        return TSID
    }

    /**
     * The put_TSID method sets the transport stream ID.
     * @param {Integer} TSID The transport stream ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-put_tsid
     */
    put_TSID(TSID) {
        result := ComCall(15, this, "int", TSID, "HRESULT")
        return result
    }

    /**
     * The get_SID method retrieves the service ID for the network.
     * @returns {Integer} Receives the service ID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-get_sid
     */
    get_SID() {
        result := ComCall(16, this, "int*", &_SID := 0, "HRESULT")
        return _SID
    }

    /**
     * The put_SID method sets the service ID.
     * @param {Integer} _SID The service ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtunerequest-put_sid
     */
    put_SID(_SID) {
        result := ComCall(17, this, "int", _SID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVBTuneRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ONID := CallbackCreate(GetMethod(implObj, "get_ONID"), flags, 2)
        this.vtbl.put_ONID := CallbackCreate(GetMethod(implObj, "put_ONID"), flags, 2)
        this.vtbl.get_TSID := CallbackCreate(GetMethod(implObj, "get_TSID"), flags, 2)
        this.vtbl.put_TSID := CallbackCreate(GetMethod(implObj, "put_TSID"), flags, 2)
        this.vtbl.get_SID := CallbackCreate(GetMethod(implObj, "get_SID"), flags, 2)
        this.vtbl.put_SID := CallbackCreate(GetMethod(implObj, "put_SID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ONID)
        CallbackFree(this.vtbl.put_ONID)
        CallbackFree(this.vtbl.get_TSID)
        CallbackFree(this.vtbl.put_TSID)
        CallbackFree(this.vtbl.get_SID)
        CallbackFree(this.vtbl.put_SID)
    }
}
