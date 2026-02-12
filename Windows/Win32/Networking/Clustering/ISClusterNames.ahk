#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusterNames extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusterNames
     * @type {Guid}
     */
    static IID => Guid("{f2e606ec-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Refresh", "get_Item", "get_DomainName"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {BSTR} 
     */
    DomainName {
        get => this.get_DomainName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCount
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(retval)
    }

    /**
     * Refresh Method (RDS)
     * @remarks
     * You must set the [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties before you use the **Refresh** method. All data-bound controls on the form associated with an **RDS.DataControl** object will reflect the new set of records. Any pre-existing [Recordset](../ado-api/recordset-object-ado.md) object is released, and any unsaved changes are discarded. The **Refresh** method automatically makes the first record the current record.  
     *   
     *  It is a good idea to call the **Refresh** method periodically when you work with data. If you retrieve data, and then leave it on a client computer for a while, it is likely to become out of date. It is possible that any changes that you make will fail, because someone else might have changed the record and submitted changes before you.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/refresh-method-rds
     */
    Refresh() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {BSTR} 
     */
    get_Item(varIndex) {
        pbstrClusterName := BSTR()
        result := ComCall(10, this, "ptr", varIndex, "ptr", pbstrClusterName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrClusterName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainName() {
        pbstrDomainName := BSTR()
        result := ComCall(11, this, "ptr", pbstrDomainName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrDomainName
    }
}
