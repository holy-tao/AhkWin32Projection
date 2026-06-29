#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a device's Forward Data Channel (FDC) Service. The FDC is an out-of-band channel that carries configuration and control messages.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_FDC)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_fdc
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_FDC extends IUnknown {
    /**
     * The interface identifier for IBDA_FDC
     * @type {Guid}
     */
    static IID := Guid("{138adc7e-58ae-437f-b0b4-c9fe19d5b4ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_FDC interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStatus       : IntPtr
        RequestTables   : IntPtr
        AddPid          : IntPtr
        RemovePid       : IntPtr
        AddTid          : IntPtr
        RemoveTid       : IntPtr
        GetTableSection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_FDC.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tuning status of the Forward Data Channel (FDC) stream.
     * @param {Pointer<Integer>} CurrentBitrate Receives the expected bit rate of the FDC stream, in kilobits per second (kbps).
     * @param {Pointer<BOOL>} CarrierLock Receives the carrier lock status.
     * @param {Pointer<Integer>} CurrentFrequency Receives the current frequency of the FDC tuner, in kHz.
     * @param {Pointer<BOOL>} CurrentSpectrumInversion Receives the expected spectrum inversion status of the FDC stream.
     * @param {Pointer<BSTR>} CurrentPIDList Receives a comma-separated list of packet identifiers (PIDs). The caller must release the string by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} CurrentTIDList Receives a comma-separated list of table identifiers (TIDs). The caller must release the string by calling <b>SysFreeString</b>.
     * @param {Pointer<BOOL>} Overflow Receives the overflow status.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-getstatus
     */
    GetStatus(CurrentBitrate, CarrierLock, CurrentFrequency, CurrentSpectrumInversion, CurrentPIDList, CurrentTIDList, Overflow) {
        CurrentBitrateMarshal := CurrentBitrate is VarRef ? "uint*" : "ptr"
        CarrierLockMarshal := CarrierLock is VarRef ? "int*" : "ptr"
        CurrentFrequencyMarshal := CurrentFrequency is VarRef ? "uint*" : "ptr"
        CurrentSpectrumInversionMarshal := CurrentSpectrumInversion is VarRef ? "int*" : "ptr"
        OverflowMarshal := Overflow is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, CurrentBitrateMarshal, CurrentBitrate, CarrierLockMarshal, CarrierLock, CurrentFrequencyMarshal, CurrentFrequency, CurrentSpectrumInversionMarshal, CurrentSpectrumInversion, BSTR.Ptr, CurrentPIDList, BSTR.Ptr, CurrentTIDList, OverflowMarshal, Overflow, "HRESULT")
        return result
    }

    /**
     * Requests MPEG-2 table sections, filtered by table identifier (TID).
     * @param {BSTR} TableIDs A comma-separated list of TIDs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-requesttables
     */
    RequestTables(TableIDs) {
        TableIDs := TableIDs is String ? BSTR.Alloc(TableIDs).Value : TableIDs

        result := ComCall(4, this, BSTR, TableIDs, "HRESULT")
        return result
    }

    /**
     * Adds one or more packet identifiers (PIDs) to the MPEG flow.
     * @remarks
     * This command causes the device to send a new_flow_req Application Protocol Data Unit (APDU).
     * @param {BSTR} PidsToAdd A comma-separated list of PIDs.
     * @returns {Integer} Receives the number of remaining MPEG flows on the device.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-addpid
     */
    AddPid(PidsToAdd) {
        PidsToAdd := PidsToAdd is String ? BSTR.Alloc(PidsToAdd).Value : PidsToAdd

        result := ComCall(5, this, BSTR, PidsToAdd, "uint*", &RemainingFilterEntries := 0, "HRESULT")
        return RemainingFilterEntries
    }

    /**
     * Removes one or more packet identifiers (PIDs) from the MPEG flow.
     * @remarks
     * This command causes the device to send a delete_flow_req Application Protocol Data Unit (APDU).
     * @param {BSTR} PidsToRemove A comma-separated list of PIDs to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-removepid
     */
    RemovePid(PidsToRemove) {
        PidsToRemove := PidsToRemove is String ? BSTR.Alloc(PidsToRemove).Value : PidsToRemove

        result := ComCall(6, this, BSTR, PidsToRemove, "HRESULT")
        return result
    }

    /**
     * Adds one or more table identifiers (TIDs) to the MPEG flow.
     * @param {BSTR} TidsToAdd A comma-separated list of TIDs.
     * @returns {BSTR} Receives a comma-separated list of the current TIDs. The caller must release the string by calling <b>SysFreeString</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-addtid
     */
    AddTid(TidsToAdd) {
        TidsToAdd := TidsToAdd is String ? BSTR.Alloc(TidsToAdd).Value : TidsToAdd

        CurrentTidList := BSTR.Owned()
        result := ComCall(7, this, BSTR, TidsToAdd, BSTR.Ptr, CurrentTidList, "HRESULT")
        return CurrentTidList
    }

    /**
     * Removes one or more table identifiers (TIDs) from the MPEG flow.
     * @param {BSTR} TidsToRemove A comma-separated list of TIDs to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-removetid
     */
    RemoveTid(TidsToRemove) {
        TidsToRemove := TidsToRemove is String ? BSTR.Alloc(TidsToRemove).Value : TidsToRemove

        result := ComCall(8, this, BSTR, TidsToRemove, "HRESULT")
        return result
    }

    /**
     * Gets the latest table section.
     * @param {Pointer<Integer>} Pid Receives the packet identifier (PID) of the table.
     * @param {Integer} MaxBufferSize The size of the <i>SecBuffer</i> array, in bytes.
     * @param {Pointer<Integer>} ActualSize Receives the number of bytes that the method copies into the  <i>SecBuffer</i> array.
     * @param {Pointer<Integer>} _SecBuffer A byte array, allocated by the caller, that receives the table section.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-gettablesection
     */
    GetTableSection(Pid, MaxBufferSize, ActualSize, _SecBuffer) {
        PidMarshal := Pid is VarRef ? "uint*" : "ptr"
        ActualSizeMarshal := ActualSize is VarRef ? "uint*" : "ptr"
        _SecBufferMarshal := _SecBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, PidMarshal, Pid, "uint", MaxBufferSize, ActualSizeMarshal, ActualSize, _SecBufferMarshal, _SecBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_FDC.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 8)
        this.vtbl.RequestTables := CallbackCreate(GetMethod(implObj, "RequestTables"), flags, 2)
        this.vtbl.AddPid := CallbackCreate(GetMethod(implObj, "AddPid"), flags, 3)
        this.vtbl.RemovePid := CallbackCreate(GetMethod(implObj, "RemovePid"), flags, 2)
        this.vtbl.AddTid := CallbackCreate(GetMethod(implObj, "AddTid"), flags, 3)
        this.vtbl.RemoveTid := CallbackCreate(GetMethod(implObj, "RemoveTid"), flags, 2)
        this.vtbl.GetTableSection := CallbackCreate(GetMethod(implObj, "GetTableSection"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.RequestTables)
        CallbackFree(this.vtbl.AddPid)
        CallbackFree(this.vtbl.RemovePid)
        CallbackFree(this.vtbl.AddTid)
        CallbackFree(this.vtbl.RemoveTid)
        CallbackFree(this.vtbl.GetTableSection)
    }
}
