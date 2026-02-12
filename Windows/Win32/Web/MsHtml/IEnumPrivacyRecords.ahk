#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IEnumPrivacyRecords extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumPrivacyRecords
     * @type {Guid}
     */
    static IID => Guid("{3050f844-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "GetSize", "GetPrivacyImpacted", "Next"]

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
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSize() {
        result := ComCall(4, this, "uint*", &pSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSize
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetPrivacyImpacted() {
        result := ComCall(5, this, "int*", &pState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pState
    }

    /**
     * NextMember (MDX)
     * @remarks
     * The **NextMember** function returns the next member, in the same level, that contains the specified member.
     * @param {Pointer<BSTR>} pbstrUrl 
     * @param {Pointer<BSTR>} pbstrPolicyRef 
     * @param {Pointer<Integer>} pdwReserved 
     * @param {Pointer<Integer>} pdwPrivacyFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/nextmember-mdx
     */
    Next(pbstrUrl, pbstrPolicyRef, pdwReserved, pdwPrivacyFlags) {
        pdwReservedMarshal := pdwReserved is VarRef ? "int*" : "ptr"
        pdwPrivacyFlagsMarshal := pdwPrivacyFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pbstrUrl, "ptr", pbstrPolicyRef, pdwReservedMarshal, pdwReserved, pdwPrivacyFlagsMarshal, pdwPrivacyFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
