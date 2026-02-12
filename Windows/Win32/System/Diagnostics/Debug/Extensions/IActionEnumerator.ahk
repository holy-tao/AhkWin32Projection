#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IActionEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEnumerator
     * @type {Guid}
     */
    static IID => Guid("{3dec5c44-f63a-4ca6-90f0-fd5c269fda59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "GetNext"]

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
     * Retrieves a handle to the first control in a group of controls that precedes (or follows) the specified control in a dialog box.
     * @remarks
     * The <b>GetNextDlgGroupItem</b> function searches controls in the order (or reverse order) they were created in the dialog box template. The first control in the group must have the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/dlgbox-programming-considerations">WS_GROUP</a> style; all other controls in the group must have been consecutively created and must not have the <b>WS_GROUP</b> style. 
     * 
     * When searching for the previous control, the function returns the first control it locates that is visible and not disabled. If the control specified by <i>hCtl</i> has the <b>WS_GROUP</b> style, the function temporarily reverses the search to locate the first control having the <b>WS_GROUP</b> style, then resumes the search in the original direction, returning the first control it locates that is visible and not disabled, or returning <i>hCtl</i> if no such control is found. 
     * 
     * When searching for the next control, the function returns the first control it locates that is visible, not disabled, and does not have the <b>WS_GROUP</b> style. If it encounters a control having the <b>WS_GROUP</b> style, the function reverses the search, locates the first control having the <b>WS_GROUP</b> style, and returns this control if it is visible and not disabled. Otherwise, the function resumes the search in the original direction and returns the first control it locates that is visible and not disabled, or returns <i>hCtl</i> if no such control is found. 
     * 
     * If the search for the next control in the group encounters a window with the <b>WS_EX_CONTROLPARENT</b> style, the system recursively searches the window's children.
     * @param {Pointer<BSTR>} keyName 
     * @param {Pointer<BSTR>} actionName 
     * @param {Pointer<BSTR>} actionDescription 
     * @param {Pointer<Boolean>} actionIsDefault 
     * @param {Pointer<Pointer<IModelObject>>} actionMethod 
     * @param {Pointer<Pointer<IKeyStore>>} metadta 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a handle to the previous (or next) control in the group of controls. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getnextdlggroupitem
     */
    GetNext(keyName, actionName, actionDescription, actionIsDefault, actionMethod, metadta) {
        actionIsDefaultMarshal := actionIsDefault is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", keyName, "ptr", actionName, "ptr", actionDescription, actionIsDefaultMarshal, actionIsDefault, "ptr*", actionMethod, "ptr*", metadta, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
