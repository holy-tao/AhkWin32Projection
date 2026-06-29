#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that initialize or retrieve Protected Broadcast Driver Architecture (PBDA) service records from a Program and System Information Protocol (PSIP) table in a Protected Broadcast Device Architecture (PBDA) transport stream.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-ipbda_services
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPBDA_Services extends IUnknown {
    /**
     * The interface identifier for IPBDA_Services
     * @type {Guid}
     */
    static IID := Guid("{944eab37-eed4-4850-afd2-77e7efeb4427}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPBDA_Services interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize        : IntPtr
        GetCountOfRecords : IntPtr
        GetRecordByIndex  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPBDA_Services.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes an object that retrieves service records from a Program and System Information Protocol (PSIP) table in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} _size Specifies the size of the buffer used to initialize the object.
     * @param {Pointer<Integer>} pBuffer Pointer to the buffer containing the service data used for initialization.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_services-initialize
     */
    Initialize(_size, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", _size, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * Gets the number of service records from a Program and System Information Protocol (PSIP) table in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the number of service records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_services-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(4, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets a service record at a given position from a Program and System Information Protocol (PSIP) table in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwRecordIndex Specifies the service record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-ipbda_services-getcountofrecords">IPBDA_Services::GetCountOfRecords</a> method to get the number of records in the PSIP table.
     * @returns {Integer} Receives the service record at the position given by <i>dwRecordIndex</i>.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbda_services-getrecordbyindex
     */
    GetRecordByIndex(dwRecordIndex) {
        result := ComCall(5, this, "uint", dwRecordIndex, "uint*", &pul64ServiceIdx := 0, "HRESULT")
        return pul64ServiceIdx
    }

    Query(iid) {
        if (IPBDA_Services.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordByIndex := CallbackCreate(GetMethod(implObj, "GetRecordByIndex"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordByIndex)
    }
}
