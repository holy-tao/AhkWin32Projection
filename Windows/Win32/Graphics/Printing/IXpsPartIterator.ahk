#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsPartIterator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsPartIterator
     * @type {Guid}
     */
    static IID => Guid("{0021d3cd-af6f-42ab-9999-14bc82a62d2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Current", "IsDone", "Next"]

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
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/reset-method-rds
     */
    Reset() {
        ComCall(3, this)
    }

    /**
     * Current (MDX)
     * @remarks
     * At each step during an iteration, the tuple being operated upon is the current tuple. The **Current** function returns that tuple. This function is only valid during an iteration over a set.  
     *   
     *  MDX functions that iterate through a set include the [Generate](../mdx/generate-mdx.md) function.  
     *   
     * > [!NOTE]  
     * >  This function only works with sets that are named, either using a set alias or by defining a named set.
     * @param {Pointer<BSTR>} pUri 
     * @param {Pointer<IUnknown>} ppXpsPart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/current-mdx
     */
    Current(pUri, ppXpsPart) {
        result := ComCall(4, this, "ptr", pUri, "ptr*", ppXpsPart, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsDone() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * NextMember (MDX)
     * @remarks
     * The **NextMember** function returns the next member, in the same level, that contains the specified member.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/nextmember-mdx
     */
    Next() {
        ComCall(6, this)
    }
}
