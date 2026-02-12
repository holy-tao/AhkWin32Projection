#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaSource3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSource3
     * @type {Guid}
     */
    static IID => Guid("{b59f0d9b-4b6e-41ed-bbb4-7c7509a994ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_StateChanged", "remove_StateChanged", "get_State", "Reset"]

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaSource, MediaSourceStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
