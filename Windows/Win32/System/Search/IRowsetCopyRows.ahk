#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetCopyRows extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetCopyRows
     * @type {Guid}
     */
    static IID => Guid("{0c733a6b-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CloseSource", "CopyByHROWS", "CopyRows", "DefineSource"]

    /**
     * 
     * @param {Integer} hSourceID 
     * @returns {HRESULT} 
     */
    CloseSource(hSourceID) {
        result := ComCall(3, this, "ushort", hSourceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hSourceID 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Integer} bFlags 
     * @returns {HRESULT} 
     */
    CopyByHROWS(hSourceID, hReserved, cRows, rghRows, bFlags) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ushort", hSourceID, "ptr", hReserved, "ptr", cRows, rghRowsMarshal, rghRows, "uint", bFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hSourceID 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Integer} bFlags 
     * @returns {Pointer} 
     */
    CopyRows(hSourceID, hReserved, cRows, bFlags) {
        result := ComCall(5, this, "ushort", hSourceID, "ptr", hReserved, "ptr", cRows, "uint", bFlags, "ptr*", &pcRowsCopied := 0, "HRESULT")
        return pcRowsCopied
    }

    /**
     * 
     * @param {IRowset} pRowsetSource 
     * @param {Pointer} cColIds 
     * @param {Pointer<Pointer>} rgSourceColumns 
     * @param {Pointer<Pointer>} rgTargetColumns 
     * @returns {Integer} 
     */
    DefineSource(pRowsetSource, cColIds, rgSourceColumns, rgTargetColumns) {
        rgSourceColumnsMarshal := rgSourceColumns is VarRef ? "ptr*" : "ptr"
        rgTargetColumnsMarshal := rgTargetColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pRowsetSource, "ptr", cColIds, rgSourceColumnsMarshal, rgSourceColumns, rgTargetColumnsMarshal, rgTargetColumns, "ushort*", &phSourceID := 0, "HRESULT")
        return phSourceID
    }
}
