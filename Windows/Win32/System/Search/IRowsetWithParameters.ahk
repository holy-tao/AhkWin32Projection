#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetWithParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetWithParameters
     * @type {Guid}
     */
    static IID => Guid("{0c733a6e-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParameterInfo", "Requery"]

    /**
     * 
     * @param {Pointer<Pointer>} pcParams 
     * @param {Pointer<Pointer<DBPARAMINFO>>} prgParamInfo 
     * @param {Pointer<Pointer<Integer>>} ppNamesBuffer 
     * @returns {HRESULT} 
     */
    GetParameterInfo(pcParams, prgParamInfo, ppNamesBuffer) {
        pcParamsMarshal := pcParams is VarRef ? "ptr*" : "ptr"
        prgParamInfoMarshal := prgParamInfo is VarRef ? "ptr*" : "ptr"
        ppNamesBufferMarshal := ppNamesBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcParamsMarshal, pcParams, prgParamInfoMarshal, prgParamInfo, ppNamesBufferMarshal, ppNamesBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requery Method
     * @remarks
     * Use the **Requery** method to refresh the entire contents of a **Recordset** object from the data source by reissuing the original command and retrieving the data a second time. Calling this method is equivalent to calling the [Close](./close-method-ado.md) and [Open](./open-method-ado-recordset.md) methods in succession. If you are editing the current record or adding a new record, an error occurs.  
     *   
     *  While the **Recordset** object is open, the properties that define the nature of the cursor ([CursorType](./cursortype-property-ado.md), [LockType](./locktype-property-ado.md), [MaxRecords](./maxrecords-property-ado.md), and so forth) are read-only. Thus, the **Requery** method can only refresh the current cursor. To change any of the cursor properties and view the results, you must use the [Close](./close-method-ado.md) method so that the properties become read/write again. You can then change the property settings and call the [Open](./open-method-ado-recordset.md) method to reopen the cursor.
     * @param {Pointer<DBPARAMS>} pParams 
     * @param {Pointer<Integer>} pulErrorParam 
     * @param {Pointer<Pointer>} phReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/requery-method
     */
    Requery(pParams, pulErrorParam, phReserved) {
        pulErrorParamMarshal := pulErrorParam is VarRef ? "uint*" : "ptr"
        phReservedMarshal := phReserved is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pParams, pulErrorParamMarshal, pulErrorParam, phReservedMarshal, phReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
