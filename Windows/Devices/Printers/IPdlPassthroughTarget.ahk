#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IPdlPassthroughTarget extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPdlPassthroughTarget
     * @type {Guid}
     */
    static IID => Guid("{9840be79-67f8-5385-a5b9-e8c96e0fca76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrintJobId", "GetOutputStream", "Submit"]

    /**
     * @type {Integer} 
     */
    PrintJobId {
        get => this.get_PrintJobId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrintJobId() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    GetOutputStream() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(result_)
    }

    /**
     * SubmitChanges Method (RDS)
     * @remarks
     * The [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties must be set before you can use the **SubmitChanges** method with the **RDS.DataControl** object.  
     *   
     *  If you call the [CancelUpdate](./cancelupdate-method-rds.md) method after you have called **SubmitChanges** for the same **Recordset** object, the **CancelUpdate** call fails because the changes have already been committed.  
     *   
     *  Only the changed records are sent for modification, and either all of the changes succeed or all the changes fail together.  
     *   
     *  You can use **SubmitChanges** only with the default **RDSServer.DataFactory** object. Custom business objects cannot use this method.  
     *   
     *  If the **URL** property has been set, **SubmitChanges** will submit changes to the location specified by the URL.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/submitchanges-method-rds
     */
    Submit() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
