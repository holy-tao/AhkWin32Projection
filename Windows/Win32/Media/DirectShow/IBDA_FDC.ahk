#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a device's Forward Data Channel (FDC) Service. The FDC is an out-of-band channel that carries configuration and control messages.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_FDC)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_fdc
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
     * 
     * @param {Pointer<Integer>} CurrentBitrate 
     * @param {Pointer<BOOL>} CarrierLock 
     * @param {Pointer<Integer>} CurrentFrequency 
     * @param {Pointer<BOOL>} CurrentSpectrumInversion 
     * @param {Pointer<BSTR>} CurrentPIDList 
     * @param {Pointer<BSTR>} CurrentTIDList 
     * @param {Pointer<BOOL>} Overflow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-getstatus
     */
    GetStatus(CurrentBitrate, CarrierLock, CurrentFrequency, CurrentSpectrumInversion, CurrentPIDList, CurrentTIDList, Overflow) {
        CurrentBitrateMarshal := CurrentBitrate is VarRef ? "uint*" : "ptr"
        CarrierLockMarshal := CarrierLock is VarRef ? "int*" : "ptr"
        CurrentFrequencyMarshal := CurrentFrequency is VarRef ? "uint*" : "ptr"
        CurrentSpectrumInversionMarshal := CurrentSpectrumInversion is VarRef ? "int*" : "ptr"
        OverflowMarshal := Overflow is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, CurrentBitrateMarshal, CurrentBitrate, CarrierLockMarshal, CarrierLock, CurrentFrequencyMarshal, CurrentFrequency, CurrentSpectrumInversionMarshal, CurrentSpectrumInversion, "ptr", CurrentPIDList, "ptr", CurrentTIDList, OverflowMarshal, Overflow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TableIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-requesttables
     */
    RequestTables(TableIDs) {
        TableIDs := TableIDs is String ? BSTR.Alloc(TableIDs).Value : TableIDs

        result := ComCall(4, this, "ptr", TableIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PidsToAdd 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-addpid
     */
    AddPid(PidsToAdd) {
        PidsToAdd := PidsToAdd is String ? BSTR.Alloc(PidsToAdd).Value : PidsToAdd

        result := ComCall(5, this, "ptr", PidsToAdd, "uint*", &RemainingFilterEntries := 0, "HRESULT")
        return RemainingFilterEntries
    }

    /**
     * 
     * @param {BSTR} PidsToRemove 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-removepid
     */
    RemovePid(PidsToRemove) {
        PidsToRemove := PidsToRemove is String ? BSTR.Alloc(PidsToRemove).Value : PidsToRemove

        result := ComCall(6, this, "ptr", PidsToRemove, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TidsToAdd 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-addtid
     */
    AddTid(TidsToAdd) {
        TidsToAdd := TidsToAdd is String ? BSTR.Alloc(TidsToAdd).Value : TidsToAdd

        CurrentTidList := BSTR()
        result := ComCall(7, this, "ptr", TidsToAdd, "ptr", CurrentTidList, "HRESULT")
        return CurrentTidList
    }

    /**
     * 
     * @param {BSTR} TidsToRemove 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-removetid
     */
    RemoveTid(TidsToRemove) {
        TidsToRemove := TidsToRemove is String ? BSTR.Alloc(TidsToRemove).Value : TidsToRemove

        result := ComCall(8, this, "ptr", TidsToRemove, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Pid 
     * @param {Integer} MaxBufferSize 
     * @param {Pointer<Integer>} ActualSize 
     * @param {Pointer<Integer>} SecBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_fdc-gettablesection
     */
    GetTableSection(Pid, MaxBufferSize, ActualSize, SecBuffer) {
        PidMarshal := Pid is VarRef ? "uint*" : "ptr"
        ActualSizeMarshal := ActualSize is VarRef ? "uint*" : "ptr"
        SecBufferMarshal := SecBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, PidMarshal, Pid, "uint", MaxBufferSize, ActualSizeMarshal, ActualSize, SecBufferMarshal, SecBuffer, "HRESULT")
        return result
    }
}
