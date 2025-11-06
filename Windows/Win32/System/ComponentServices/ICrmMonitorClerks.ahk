#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves information about the state of clerks.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmmonitorclerks
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmMonitorClerks extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICrmMonitorClerks
     * @type {Guid}
     */
    static IID => Guid("{70c8e442-c7ed-11d1-82fb-00a0c91eede9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Item", "get__NewEnum", "get_Count", "ProgIdCompensator", "Description", "TransactionUOW", "ActivityId"]

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-item
     */
    Item(Index) {
        pItem := VARIANT()
        result := ComCall(7, this, "ptr", Index, "ptr", pItem, "HRESULT")
        return pItem
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-progidcompensator
     */
    ProgIdCompensator(Index) {
        pItem := VARIANT()
        result := ComCall(10, this, "ptr", Index, "ptr", pItem, "HRESULT")
        return pItem
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-description
     */
    Description(Index) {
        pItem := VARIANT()
        result := ComCall(11, this, "ptr", Index, "ptr", pItem, "HRESULT")
        return pItem
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-transactionuow
     */
    TransactionUOW(Index) {
        pItem := VARIANT()
        result := ComCall(12, this, "ptr", Index, "ptr", pItem, "HRESULT")
        return pItem
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-activityid
     */
    ActivityId(Index) {
        pItem := VARIANT()
        result := ComCall(13, this, "ptr", Index, "ptr", pItem, "HRESULT")
        return pItem
    }
}
