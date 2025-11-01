#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetNotify extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnFieldChange", "OnRowChange", "OnRowsetChange"]

    /**
     * 
     * @param {IRowset} pRowset 
     * @param {Pointer} hRow 
     * @param {Pointer} cColumns 
     * @param {Pointer<Pointer>} rgColumns 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnFieldChange(pRowset, hRow, cColumns, rgColumns, eReason, ePhase, fCantDeny) {
        rgColumnsMarshal := rgColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pRowset, "ptr", hRow, "ptr", cColumns, rgColumnsMarshal, rgColumns, "uint", eReason, "uint", ePhase, "int", fCantDeny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRowset} pRowset 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnRowChange(pRowset, cRows, rghRows, eReason, ePhase, fCantDeny) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pRowset, "ptr", cRows, rghRowsMarshal, rghRows, "uint", eReason, "uint", ePhase, "int", fCantDeny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRowset} pRowset 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnRowsetChange(pRowset, eReason, ePhase, fCantDeny) {
        result := ComCall(5, this, "ptr", pRowset, "uint", eReason, "uint", ePhase, "int", fCantDeny, "HRESULT")
        return result
    }
}
