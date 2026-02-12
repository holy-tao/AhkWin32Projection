#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * DataSource Property (ADO)
 * @remarks
 * This property is used to create data-bound controls with the Data Environment. The Data Environment maintains collections of data (data sources) containing named objects (data members) that will be represented as a **Recordset** object.  
 *   
 *  The [DataMember](../../../ado/reference/ado-api/datamember-property.md) and **DataSource** properties must be used in conjunction.  
 *   
 *  The object referenced must implement the **IDataSource** interface and must contain an **IRowset** interface.
 * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/datasource-property-ado
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DataSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DataSource
     * @type {Guid}
     */
    static IID => Guid("{7c0ffab3-cd84-11d0-949a-00a0c91110ed}")

    /**
     * The class identifier for DataSource
     * @type {Guid}
     */
    static CLSID => Guid("{7c0ffab3-cd84-11d0-949a-00a0c91110ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getDataMember", "getDataMemberName", "getDataMemberCount", "addDataSourceListener", "removeDataSourceListener"]

    /**
     * 
     * @param {Pointer<Integer>} bstrDM 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    getDataMember(bstrDM, riid) {
        bstrDMMarshal := bstrDM is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, bstrDMMarshal, bstrDM, "ptr", riid, "ptr*", &ppunk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {Pointer<Integer>} 
     */
    getDataMemberName(lIndex) {
        result := ComCall(4, this, "int", lIndex, "ptr*", &pbstrDM := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrDM
    }

    /**
     * 
     * @returns {Integer} 
     */
    getDataMemberCount() {
        result := ComCall(5, this, "int*", &plCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCount
    }

    /**
     * 
     * @param {DataSourceListener} pDSL 
     * @returns {HRESULT} 
     */
    addDataSourceListener(pDSL) {
        result := ComCall(6, this, "ptr", pDSL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DataSourceListener} pDSL 
     * @returns {HRESULT} 
     */
    removeDataSourceListener(pDSL) {
        result := ComCall(7, this, "ptr", pDSL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
