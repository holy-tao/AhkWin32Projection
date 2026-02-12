#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * ICommand (Native Client OLE DB provider)
 * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-interfaces/icommand-ole-db
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommand
     * @type {Guid}
     */
    static IID => Guid("{0c733a63-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Execute", "GetDBSession"]

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    Cancel() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Defines the method to be called when the command is invoked.
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<DBPARAMS>} pParams 
     * @param {Pointer<Pointer>} pcRowsAffected 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.icommand.execute
     */
    Execute(pUnkOuter, riid, pParams, pcRowsAffected, ppRowset) {
        pcRowsAffectedMarshal := pcRowsAffected is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pUnkOuter, "ptr", riid, "ptr", pParams, pcRowsAffectedMarshal, pcRowsAffected, "ptr*", ppRowset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetDBSession(riid) {
        result := ComCall(5, this, "ptr", riid, "ptr*", &ppSession := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppSession)
    }
}
