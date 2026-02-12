#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerModuleEnum.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerModuleEnum extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerModuleEnum
     * @type {Guid}
     */
    static IID => Guid("{b0266d75-2081-4493-af7f-028ba34db891}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Skip", "Reset", "Clone", "GetCount", "Next"]

    /**
     * SkipLine Method
     * @remarks
     * All characters up to and including the next line separator are skipped. By default, the [LineSeparator](./lineseparator-property-ado.md) is **adCRLF**. If you attempt to skip past [EOS](./eos-property.md), the current position will remain at **EOS**.  
     *   
     *  The **SkipLine** method is used with text streams ([Type](./type-property-ado-stream.md) is **adTypeText**).
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/skipline-method
     */
    Skip(celt) {
        result := ComCall(3, this, "uint", celt, "int")
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
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clone Method Example (VC++)
     * @returns {ICorProfilerModuleEnum} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICorProfilerModuleEnum(ppEnum)
    }

    /**
     * Retrieves the number of tagged elements in a given color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/icm/nf-icm-getcountcolorprofileelements
     */
    GetCount() {
        result := ComCall(6, this, "uint*", &pcelt := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcelt
    }

    /**
     * NextMember (MDX)
     * @remarks
     * The **NextMember** function returns the next member, in the same level, that contains the specified member.
     * @param {Integer} celt 
     * @param {Pointer<Pointer>} ids 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/nextmember-mdx
     */
    Next(celt, ids, pceltFetched) {
        idsMarshal := ids is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", celt, idsMarshal, ids, pceltFetchedMarshal, pceltFetched, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
