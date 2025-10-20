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
     * 
     * @param {Pointer<UInt32>} CurrentBitrate 
     * @param {Pointer<BOOL>} CarrierLock 
     * @param {Pointer<UInt32>} CurrentFrequency 
     * @param {Pointer<BOOL>} CurrentSpectrumInversion 
     * @param {Pointer<BSTR>} CurrentPIDList 
     * @param {Pointer<BSTR>} CurrentTIDList 
     * @param {Pointer<BOOL>} Overflow 
     * @returns {HRESULT} 
     */
    GetStatus(CurrentBitrate, CarrierLock, CurrentFrequency, CurrentSpectrumInversion, CurrentPIDList, CurrentTIDList, Overflow) {
        result := ComCall(3, this, "uint*", CurrentBitrate, "ptr", CarrierLock, "uint*", CurrentFrequency, "ptr", CurrentSpectrumInversion, "ptr", CurrentPIDList, "ptr", CurrentTIDList, "ptr", Overflow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} TableIDs 
     * @returns {HRESULT} 
     */
    RequestTables(TableIDs) {
        TableIDs := TableIDs is String ? BSTR.Alloc(TableIDs).Value : TableIDs

        result := ComCall(4, this, "ptr", TableIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PidsToAdd 
     * @param {Pointer<UInt32>} RemainingFilterEntries 
     * @returns {HRESULT} 
     */
    AddPid(PidsToAdd, RemainingFilterEntries) {
        PidsToAdd := PidsToAdd is String ? BSTR.Alloc(PidsToAdd).Value : PidsToAdd

        result := ComCall(5, this, "ptr", PidsToAdd, "uint*", RemainingFilterEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PidsToRemove 
     * @returns {HRESULT} 
     */
    RemovePid(PidsToRemove) {
        PidsToRemove := PidsToRemove is String ? BSTR.Alloc(PidsToRemove).Value : PidsToRemove

        result := ComCall(6, this, "ptr", PidsToRemove, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} TidsToAdd 
     * @param {Pointer<BSTR>} CurrentTidList 
     * @returns {HRESULT} 
     */
    AddTid(TidsToAdd, CurrentTidList) {
        TidsToAdd := TidsToAdd is String ? BSTR.Alloc(TidsToAdd).Value : TidsToAdd

        result := ComCall(7, this, "ptr", TidsToAdd, "ptr", CurrentTidList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} TidsToRemove 
     * @returns {HRESULT} 
     */
    RemoveTid(TidsToRemove) {
        TidsToRemove := TidsToRemove is String ? BSTR.Alloc(TidsToRemove).Value : TidsToRemove

        result := ComCall(8, this, "ptr", TidsToRemove, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Pid 
     * @param {Integer} MaxBufferSize 
     * @param {Pointer<UInt32>} ActualSize 
     * @param {Pointer<Byte>} SecBuffer 
     * @returns {HRESULT} 
     */
    GetTableSection(Pid, MaxBufferSize, ActualSize, SecBuffer) {
        result := ComCall(9, this, "uint*", Pid, "uint", MaxBufferSize, "uint*", ActualSize, "char*", SecBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
