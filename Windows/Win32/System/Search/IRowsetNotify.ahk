#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetNotify extends IUnknown{
    /**
     * The interface identifier for IRowsetNotify
     * @type {Guid}
     */
    static IID => Guid("{0c733a83-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IRowset>} pRowset 
     * @param {Pointer} hRow 
     * @param {Pointer} cColumns 
     * @param {Pointer<UIntPtr>} rgColumns 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnFieldChange(pRowset, hRow, cColumns, rgColumns, eReason, ePhase, fCantDeny) {
        result := ComCall(3, this, "ptr", pRowset, "ptr", hRow, "ptr", cColumns, "ptr*", rgColumns, "uint", eReason, "uint", ePhase, "int", fCantDeny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRowset>} pRowset 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} rghRows 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnRowChange(pRowset, cRows, rghRows, eReason, ePhase, fCantDeny) {
        result := ComCall(4, this, "ptr", pRowset, "ptr", cRows, "ptr*", rghRows, "uint", eReason, "uint", ePhase, "int", fCantDeny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRowset>} pRowset 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnRowsetChange(pRowset, eReason, ePhase, fCantDeny) {
        result := ComCall(5, this, "ptr", pRowset, "uint", eReason, "uint", ePhase, "int", fCantDeny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
