#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a device's Forward Data Channel (FDC) Service. The FDC is an out-of-band channel that carries configuration and control messages.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_FDC)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/bdaiface/nn-bdaiface-ibda_fdc
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_FDC extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_FDC
     * @type {Guid}
     */
    static IID => Guid("{138adc7e-58ae-437f-b0b4-c9fe19d5b4ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "RequestTables", "AddPid", "RemovePid", "AddTid", "RemoveTid", "GetTableSection"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/bdaiface/nf-bdaiface-ibda_fdc-getstatus
     */
    GetStatus(CurrentBitrate, CarrierLock, CurrentFrequency, CurrentSpectrumInversion, CurrentPIDList, CurrentTIDList, Overflow) {
        CurrentBitrateMarshal := CurrentBitrate is VarRef ? "uint*" : "ptr"
        CarrierLockMarshal := CarrierLock is VarRef ? "int*" : "ptr"
        CurrentFrequencyMarshal := CurrentFrequency is VarRef ? "uint*" : "ptr"
        CurrentSpectrumInversionMarshal := CurrentSpectrumInversion is VarRef ? "int*" : "ptr"
        OverflowMarshal := Overflow is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, CurrentBitrateMarshal, CurrentBitrate, CarrierLockMarshal, CarrierLock, CurrentFrequencyMarshal, CurrentFrequency, CurrentSpectrumInversionMarshal, CurrentSpectrumInversion, "ptr", CurrentPIDList, "ptr", CurrentTIDList, OverflowMarshal, Overflow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests MPEG-2 table sections, filtered by table identifier (TID).
     * @param {BSTR} TableIDs A comma-separated list of TIDs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/bdaiface/nf-bdaiface-ibda_fdc-requesttables
     */
    RequestTables(TableIDs) {
        if(TableIDs is String) {
            pin := BSTR.Alloc(TableIDs)
            TableIDs := pin.Value
        }

        result := ComCall(4, this, "ptr", TableIDs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds one or more packet identifiers (PIDs) to the MPEG flow.
     * @remarks
     * This command causes the device to send a new_flow_req Application Protocol Data Unit (APDU).
     * @param {BSTR} PidsToAdd A comma-separated list of PIDs.
     * @returns {Integer} Receives the number of remaining MPEG flows on the device.
     * @see https://learn.microsoft.com/windows/win32/api//content/bdaiface/nf-bdaiface-ibda_fdc-addpid
     */
    AddPid(PidsToAdd) {
        if(PidsToAdd is String) {
            pin := BSTR.Alloc(PidsToAdd)
            PidsToAdd := pin.Value
        }

        result := ComCall(5, this, "ptr", PidsToAdd, "uint*", &RemainingFilterEntries := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemainingFilterEntries
    }

    /**
     * Removes one or more packet identifiers (PIDs) from the MPEG flow.
     * @remarks
     * This command causes the device to send a delete_flow_req Application Protocol Data Unit (APDU).
     * @param {BSTR} PidsToRemove A comma-separated list of PIDs to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/bdaiface/nf-bdaiface-ibda_fdc-removepid
     */
    RemovePid(PidsToRemove) {
        if(PidsToRemove is String) {
            pin := BSTR.Alloc(PidsToRemove)
            PidsToRemove := pin.Value
        }

        result := ComCall(6, this, "ptr", PidsToRemove, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds one or more table identifiers (TIDs) to the MPEG flow.
     * @param {BSTR} TidsToAdd A comma-separated list of TIDs.
     * @returns {BSTR} Receives a comma-separated list of the current TIDs. The caller must release the string by calling <b>SysFreeString</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/bdaiface/nf-bdaiface-ibda_fdc-addtid
     */
    AddTid(TidsToAdd) {
        if(TidsToAdd is String) {
            pin := BSTR.Alloc(TidsToAdd)
            TidsToAdd := pin.Value
        }

        CurrentTidList := BSTR()
        result := ComCall(7, this, "ptr", TidsToAdd, "ptr", CurrentTidList, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CurrentTidList
    }

    /**
     * Removes one or more table identifiers (TIDs) from the MPEG flow.
     * @param {BSTR} TidsToRemove A comma-separated list of TIDs to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/bdaiface/nf-bdaiface-ibda_fdc-removetid
     */
    RemoveTid(TidsToRemove) {
        if(TidsToRemove is String) {
            pin := BSTR.Alloc(TidsToRemove)
            TidsToRemove := pin.Value
        }

        result := ComCall(8, this, "ptr", TidsToRemove, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the latest table section.
     * @param {Pointer<Integer>} Pid Receives the packet identifier (PID) of the table.
     * @param {Integer} MaxBufferSize The size of the <i>SecBuffer</i> array, in bytes.
     * @param {Pointer<Integer>} ActualSize Receives the number of bytes that the method copies into the  <i>SecBuffer</i> array.
     * @param {Pointer<Integer>} SecBuffer_ A byte array, allocated by the caller, that receives the table section.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/bdaiface/nf-bdaiface-ibda_fdc-gettablesection
     */
    GetTableSection(Pid, MaxBufferSize, ActualSize, SecBuffer_) {
        PidMarshal := Pid is VarRef ? "uint*" : "ptr"
        ActualSizeMarshal := ActualSize is VarRef ? "uint*" : "ptr"
        SecBuffer_Marshal := SecBuffer_ is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, PidMarshal, Pid, "uint", MaxBufferSize, ActualSizeMarshal, ActualSize, SecBuffer_Marshal, SecBuffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
