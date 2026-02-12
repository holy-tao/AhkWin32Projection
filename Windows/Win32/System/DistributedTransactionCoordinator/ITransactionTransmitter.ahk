#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionTransmitter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionTransmitter
     * @type {Guid}
     */
    static IID => Guid("{59313e01-b36c-11cf-a539-00aa006887c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Set", "GetPropagationTokenSize", "MarshalPropagationToken", "UnmarshalReturnToken", "Reset"]

    /**
     * Set Large Data (Native Client OLE DB provider)
     * @param {ITransaction} pTransaction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/set-large-data-ole-db
     */
    Set(pTransaction) {
        result := ComCall(3, this, "ptr", pTransaction, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPropagationTokenSize() {
        result := ComCall(4, this, "uint*", &pcbToken := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbToken
    }

    /**
     * 
     * @param {Integer} cbToken 
     * @param {Pointer<Integer>} rgbToken 
     * @param {Pointer<Integer>} pcbUsed 
     * @returns {HRESULT} 
     */
    MarshalPropagationToken(cbToken, rgbToken, pcbUsed) {
        rgbTokenMarshal := rgbToken is VarRef ? "char*" : "ptr"
        pcbUsedMarshal := pcbUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", cbToken, rgbTokenMarshal, rgbToken, pcbUsedMarshal, pcbUsed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} cbReturnToken 
     * @param {Pointer<Integer>} rgbReturnToken 
     * @returns {HRESULT} 
     */
    UnmarshalReturnToken(cbReturnToken, rgbReturnToken) {
        rgbReturnTokenMarshal := rgbReturnToken is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", cbReturnToken, rgbReturnTokenMarshal, rgbReturnToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reset Method (RDS)
     * @remarks
     * The [SortColumn](./sortcolumn-property-rds.md), [SortDirection](./sortdirection-property-rds.md), [FilterValue](./filtervalue-property-rds.md), [FilterCriterion](./filtercriterion-property-rds.md), and [FilterColumn](./filtercolumn-property-rds.md) properties provide sorting and filtering functionality on the client-side cache. The sorting functionality orders records by values from one column. The filtering functionality displays a subset of records based on a find criteria, while the full [Recordset](../ado-api/recordset-object-ado.md) is maintained in the cache. The **Reset** method will execute the criteria and replace the current **Recordset** with an updatable **Recordset**.  
     *   
     *  If there are changes to the original data that have not been submitted, the **Reset** method will fail. First, use the [SubmitChanges](./submitchanges-method-rds.md) method to save any changes in a read/write **Recordset**, and then use the **Reset** method to sort or filter the records.  
     *   
     *  If you want to perform more than one filter on your rowset, you can use the optional *Boolean* argument with the **Reset** method. The following example shows how to do this:  
     *   
     * ```  
     * ADC.SQL = "Select au_lname from authors"  
     * ADC.Refresh    ' Get the new rowset.  
     *   
     * ADC.FilterColumn = "au_lname"  
     * ADC.FilterCriterion = "<"  
     * ADC.FilterValue = "'M'"  
     * ADC.Reset         ' Rowset now has all Last Names < "M".  
     *   
     * ADC.FilterCriterion = ">"  
     * ADC.FilterValue = "'F'"  
     * ' Passing True is not necessary, because it is the   
     * ' default filter on the current "filtered" rowset.  
     * ADC.Reset(TRUE)     ' Rowset now has all Last   
     *                     ' Names < "M" and > "F".  
     *   
     * ADC.FilterCriterion = ">"  
     * ADC.FilterValue = "'T'"  
     * ' Filter on the original rowset, throwing out the  
     * ' previous filter options.  
     * ADC.Reset(FALSE)   ' Rowset now has all Last Names > "T".  
     * ```
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/reset-method-rds
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
