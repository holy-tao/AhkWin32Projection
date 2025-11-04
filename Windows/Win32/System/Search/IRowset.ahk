#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowset extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowset
     * @type {Guid}
     */
    static IID => Guid("{0c733a7c-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddRefRows", "GetData", "GetNextRows", "ReleaseRows", "RestartPosition"]

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Integer>} rgRefCounts 
     * @param {Pointer<Integer>} rgRowStatus 
     * @returns {HRESULT} 
     */
    AddRefRows(cRows, rghRows, rgRefCounts, rgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        rgRefCountsMarshal := rgRefCounts is VarRef ? "uint*" : "ptr"
        rgRowStatusMarshal := rgRowStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", cRows, rghRowsMarshal, rghRows, rgRefCountsMarshal, rgRefCounts, rgRowStatusMarshal, rgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    GetData(hRow, hAccessor, pData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", hRow, "ptr", hAccessor, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} lRowsOffset 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsObtained 
     * @param {Pointer<Pointer<Pointer>>} prghRows 
     * @returns {HRESULT} 
     */
    GetNextRows(hReserved, lRowsOffset, cRows, pcRowsObtained, prghRows) {
        pcRowsObtainedMarshal := pcRowsObtained is VarRef ? "ptr*" : "ptr"
        prghRowsMarshal := prghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", hReserved, "ptr", lRowsOffset, "ptr", cRows, pcRowsObtainedMarshal, pcRowsObtained, prghRowsMarshal, prghRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Integer>} rgRowOptions 
     * @param {Pointer<Integer>} rgRefCounts 
     * @param {Pointer<Integer>} rgRowStatus 
     * @returns {HRESULT} 
     */
    ReleaseRows(cRows, rghRows, rgRowOptions, rgRefCounts, rgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        rgRowOptionsMarshal := rgRowOptions is VarRef ? "uint*" : "ptr"
        rgRefCountsMarshal := rgRefCounts is VarRef ? "uint*" : "ptr"
        rgRowStatusMarshal := rgRowStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", cRows, rghRowsMarshal, rghRows, rgRowOptionsMarshal, rgRowOptions, rgRefCountsMarshal, rgRefCounts, rgRowStatusMarshal, rgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @returns {HRESULT} 
     */
    RestartPosition(hReserved) {
        result := ComCall(7, this, "ptr", hReserved, "HRESULT")
        return result
    }
}
