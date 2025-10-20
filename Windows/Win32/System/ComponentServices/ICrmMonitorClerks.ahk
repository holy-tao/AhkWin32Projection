#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves information about the state of clerks.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmmonitorclerks
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmMonitorClerks extends IDispatch{
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
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<VARIANT>} pItem 
     * @returns {HRESULT} 
     */
    Item(Index, pItem) {
        result := ComCall(7, this, "ptr", Index, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(9, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<VARIANT>} pItem 
     * @returns {HRESULT} 
     */
    ProgIdCompensator(Index, pItem) {
        result := ComCall(10, this, "ptr", Index, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<VARIANT>} pItem 
     * @returns {HRESULT} 
     */
    Description(Index, pItem) {
        result := ComCall(11, this, "ptr", Index, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<VARIANT>} pItem 
     * @returns {HRESULT} 
     */
    TransactionUOW(Index, pItem) {
        result := ComCall(12, this, "ptr", Index, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<VARIANT>} pItem 
     * @returns {HRESULT} 
     */
    ActivityId(Index, pItem) {
        result := ComCall(13, this, "ptr", Index, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
